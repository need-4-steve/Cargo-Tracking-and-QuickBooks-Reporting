<?php

defined('BASEPATH') or exit('No direct script access allowed');
use PHPHtmlParser\Dom;

class Shipments extends CI_Controller
{
    public function index()
    {
        if (!$this->session->userdata('logged_in')) {
            redirect('users/login');
        }
        redirect('shipments/getcurrent');
    }

    public function autoupdate($uname, $pw)
    {
        if ($this->users_model->login($uname, $pw)) {

        } else {
            echo "AUTHENTICATION ERROR";
        }
    }

    public function getcurrent()
    {
        $starttime = microtime(true);
        if (is_cli()) {
            echo "cli...";
        } else {
            // Check login
            if (!$this->session->userdata('logged_in')) {
                redirect('users/login');
            }
        }
        if (is_cli()) {
            $dataRows = array();
            /* connect to gmail */
            set_time_limit(4000);
            $hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
            $username = 'cargodata.libra';
            $password = 'Libra123$$';
            /* try to connect */
            $inbox = imap_open($hostname, $username, $password) or die('Cannot connect to Gmail: ' . imap_last_error());
            $subjpass = 'COSCO SHIPPING Lines report, Daily B/L Report';
            /* if emails are returned, cycle through each... */
            $failSafe = true;
            if ($inbox !== false) {
                $numMsg = imap_num_msg($inbox);
                $emails = imap_search($inbox, 'ALL', SE_UID);
                if (!$emails) {
                    echo "NO NEW DATA";
                    $failSafe = false;
                }
                if ($failSafe) {
                    //var_dump($emails);
                    /* put the newest emails on top */
                    rsort($emails);
                    /* for every email... */
                    $reportEmailFound = false;
                    foreach ($emails as $email_number) {
                        if ($reportEmailFound) {
                            break;
                        }

                        $msgno = imap_msgno($inbox, $email_number);
                        $header = imap_headerinfo($inbox, $msgno);
                        //var_dump($header);
                        if ($header === false) {
                            echo "email header parsing error. line 52 Shipments.php -sv";
                        }
                        $msgBody = imap_body($inbox, $msgno);
                        /* get information specific to this email */
                        //echo "<br/>email_number: $email_number <br/> msgNo: $msgno<br/>";
                        $overview = imap_fetch_overview($inbox, $msgno, 0) or die("can't fetch overview: " . imap_last_error());
                        if (!$overview) {
                            echo "overview failed...container line 124<br/>";
                            $failSafe = false;
                        }
                        if ($failSafe) {
                            $pos = strpos($overview[0]->subject, 'COSCO SHIPPING Lines report, Daily B/L Report');
                            $pos2 = strpos($overview[0]->from, 'coscon@coscon.com');
                            if ($pos !== false && $pos2 !== false) {
                                $reportEmailFound = true;
                                /* get mail structure */
                                $structure = imap_fetchstructure($inbox, $msgno);
                                $attachments = array();
                                /* if any attachments found... */
                                if (isset($structure->parts) && count($structure->parts)) {
                                    for ($i = 0; $i < count($structure->parts); $i++) {
                                        $attachments[$i] = array('is_attachment' => false, 'filename' => '', 'name' => '', 'attachment' => '');
                                        if ($structure->parts[$i]->ifdparameters) {
                                            foreach ($structure->parts[$i]->dparameters as $object) {
                                                if (strtolower($object->attribute) == 'filename') {
                                                    $attachments[$i]['is_attachment'] = true;
                                                    $attachments[$i]['filename'] = $object->value;
                                                    //echo "attachment found...".$attachments[$i]['filename']."<br/>";
                                                }
                                            }
                                        }
                                        if ($structure->parts[$i]->ifparameters) {
                                            foreach ($structure->parts[$i]->parameters as $object) {
                                                if (strtolower($object->attribute) == 'name') {
                                                    $attachments[$i]['is_attachment'] = true;
                                                    $attachments[$i]['name'] = $object->value;
                                                    //echo "attachment found...".$attachments[$i]['name']."<br/>";
                                                }
                                            }
                                        }
                                        if ($attachments[$i]['is_attachment']) {
                                            $attachments[$i]['attachment'] = imap_fetchbody($inbox, $msgno, $i + 1);
                                            if ($structure->parts[$i]->encoding == 3) {
                                                //echo "BASE64 decoding file...<br/>";
                                                /* 3 = BASE64 encoding */
                                                $attachments[$i]['attachment'] = base64_decode($attachments[$i]['attachment']);
                                            } elseif ($structure->parts[$i]->encoding == 4) {
                                                //echo "QUOTED-PRINTABLE decoding file...<br/>";
                                                /* 4 = QUOTED-PRINTABLE encoding */
                                                $attachments[$i]['attachment'] = quoted_printable_decode($attachments[$i]['attachment']);
                                            }
                                        }
                                    }
                                }
                                /* iterate through each attachment and save it */
                                foreach ($attachments as $attachment) {
                                    if ($attachment['is_attachment'] == 1) {
                                        $filename = $attachment['name'];
                                        if (empty($filename)) {
                                            $filename = $attachment['filename'];
                                        }

                                        if (empty($filename)) {
                                            $filename = time() . ".dat";
                                        }

                                        /*
                                         * prefix the email number to the filename in case two emails
                                         * have the attachment with the same file name.
                                         */
                                        //                echo "writing attachment to file: \n\t ./" . $msgno . "-" . $filename . "<br/>";
                                        $fp = fopen("./" . $msgno . "-" . $filename, "w+");
                                        //              echo "file created...writing data...!<br/>";
                                        fwrite($fp, $attachment['attachment']);
                                        //               echo "data written to file successfully!<br/>";
                                        fclose($fp);

                                        //               echo "\n\nFILE DATA:\n-----------------------------------<br/>";
                                        $row = 1;
                                        if (($handle = fopen("./" . $msgno . "-" . $filename, "r")) !== false) {
                                            while (($recordData = fgetcsv($handle, 1000, ",")) !== false) {
                                                $num = count($recordData);
                                                //                          echo "<p> $num fields in line $row: <br /></p><br/>";
                                                $dataRows[$row - 1] = array();
                                                for ($c = 0; $c < $num; $c++) {
                                                    //                              echo $recordData[$c] . "<br />";
                                                    $dataRows[$row - 1][$c] = $recordData[$c];
                                                }
                                                $row++;
                                            }
                                            fclose($handle);
                                        }
                                    }
                                }
                            }
                        }
                        // Mark as Read
                        $setflagSEENresult = imap_setflag_full($inbox, $email_number, "\\Seen", ST_UID);
                        if ($setflagSEENresult === false) {
                            echo "error occurred while setting UNSEEN flag to SEEN. line 148 Shipments.php -sv<br/>";
                        }
                    }
                }
                imap_close($inbox);
            }
            //bill of lading    CN #    Vendor    Port of Discharge     Destination City    Destination State    Destination Country    ETA Date/Time    ETA Time Zone    Customs Clearance Status Date/Time    Customs Clearance Status Time Zone    Customs Clearance Status    B/L Status    Latest Container Event     Latest Container Event Date/Time    Latest Container Event Time Zone    Latest Container Event Location
            $columnNames = array("bill_of_lading", "container_number", "vendor_name", "discharge_port", "destination_city", "destination_state", "destination_country", "eta", "eta-timezone", "customs-clearance-datetime", "customs-clearance-timezone", "customs_status", "bl_status", "latest_event", "latest_event_timestamp", "latest_event_timestamp-timezone", "latest_event_location", "container_size");
            $data['newContainers'] = array();
            $unassignedContainerCount = 0;
            if (count($dataRows) > 0) {
                $this->ShipmentsModel->mark_everything_inactive();
                /*$this->ShipmentsModel->archiveInactiveRecords();*/
                //return;
                $num = count($dataRows);
                //echo "<br/>LINE 228: <br>num: $num<br>";
                for ($c = 1; $c < $num; $c++) {
                    $valueCount = count($dataRows[$c]);
                    //echo "<br/>LINE 231: <br>c: $c<br> valueCount: $valueCount<br>";
                    //var_dump($dataRows[$c]);
                    //echo"<br/>";
                    for ($d = 0; $d < $valueCount - 1; $d++) {
                        $key = $columnNames[$d];
                        //echo "<br/>LINE 236: <br>c: $c<br> d: $d<br>key: $key<br>dataRows[$c][$d]:";
                        //var_dump($dataRows[$c][$d]);
                        //echo "<br>";
                        $data['newContainers'][$c - 1][$key] = $dataRows[$c][$d];
                        if ($key === 'bill_of_lading') {
                            $data['newContainers'][$c - 1][$key] = trim(substr($data['newContainers'][$c - 1][$key], strpos($data['newContainers'][$c - 1][$key], '"') + 1, strlen($data['newContainers'][$c - 1][$key]) - (strpos($data['newContainers'][$c - 1][$key], '"') + 1) - 1));
                        } else if ($key === 'eta' || $key === 'latest_event_timestamp') {
                            //$data['newContainers'][$c-1][$key]= trim(substr($data['newContainers'][$c-1][$key],0,strlen($data['newContainers'][$c-1][$key])-strpos($data['newContainers'][$c-1][$key],'('))-1);
                            //var_dump($data['newContainers'][$c-1][$key]);
                            // "<br><hr>";
                            if (strlen($data['newContainers'][$c - 1][$key]) >= 15) {
                                $data['newContainers'][$c - 1][$key] = trim(substr($data['newContainers'][$c - 1][$key], 0, 16));
                                $data['newContainers'][$c - 1][$key] = date('m/d/Y H:II', strtotime($data['newContainers'][$c - 1][$key]));
                            } else {
                                $data['newContainers'][$c - 1][$key] = null;
                            }
                            //$sqlFormat = 'Y-m-d H:i:s';
                            //$data['newContainers'][$c-1][$key]=date($sqlFormat, strtotime($data['newContainers'][$c-1][$key]));
                        } else if ($key === 'container_number') {
                            if ($data['newContainers'][$c - 1][$key] === 'Unassigned') {
                                $unassignedContainerCount++;
                                $data['newContainers'][$c - 1][$key] = $data['newContainers'][$c - 1][$key] . "-[$unassignedContainerCount]";
                            } else {
                                $lengthOfCN = strpos($data['newContainers'][$c - 1][$key], '-');
                                $tempCNval = substr($data['newContainers'][$c - 1][$key], 0, (($lengthOfCN > 4) ? $lengthOfCN : strlen($data['newContainers'][$c - 1][$key])));
                                $data['newContainers'][$c - 1][$key] = $tempCNval;
                            }
                        }
                    }
                    if (!is_null($data['newContainers'][$c - 1]['eta']) && (strtotime($data['newContainers'][$c - 1]['eta']) < strtotime('2017-01-01 12:00'))) {
                        $data['newContainers'][$c - 1]['eta'] = null;
                        $data['newContainers'][$c - 1]['status'] = null;
                    } else {
                        $start = strtotime($data['newContainers'][$c - 1]['eta']);
                        $end = time(); //now
                        $diff = ($end - $start) * -1;
                        $daysDifference = floor($diff / (60 * 60 * 24));
                        /* $statusHTML ="<div class='[TYPE]'><p></p></div>";*/
                        echo $data['newContainers'][$c - 1]['container_number'] . "= $end - $start =  $diff \n";
                        $statusValue = -1;
                        if ($diff < 0) {
                            echo $data['newContainers'][$c - 1]['container_number'] . "status: \n";
                            $statusValue = 0;
                        } else {
                            if ($daysDifference >= 0 && $daysDifference < 3) {
                                /* $statusValue="circle_red";*/
                                $statusValue = 0;
                            } else if ($daysDifference >= 3 && $daysDifference <= 7) {
                                /*$statusValue="circle_yellow";*/
                                $statusValue = 1;
                            } else if ($daysDifference > 7) {
                                /*  $statusValue="circle_green";*/
                                $statusValue = 2;
                            }
                        }
                        $data['newContainers'][$c - 1]['status'] = $statusValue; /*str_replace("[TYPE]", $statusValue, $statusHTML);*/
                    }
                    $data['newContainers'][$c - 1]['final_destination'] = $data['newContainers'][$c - 1]['destination_city'] . ', ' . $data['newContainers'][$c - 1]['destination_state'];
                    $data['newContainers'][$c - 1]['vendor_id'] = $this->ShipmentsModel->get_vendor_id_by_name($data['newContainers'][$c - 1]['vendor_name']);
                    $data['newContainers'][$c - 1]['product_id'] = $this->ShipmentsModel->get_product_id_by_vendor_id($data['newContainers'][$c - 1]['vendor_id']);
                    $data['newContainers'][$c - 1]['isf_required'] = $this->ShipmentsModel->getISFreq($data['newContainers'][$c - 1]['discharge_port']);
                    $data['newContainers'][$c - 1]['do'] = $this->ShipmentsModel->getDOvalue($data['newContainers'][$c - 1]['destination_city']);
                    $data['newContainers'][$c - 1]['latest_event_time_and_date'] = date("Y-m-d\TH:i:s", strtotime($data['newContainers'][$c - 1]['latest_event_timestamp']));
                }
            } else {
                $data['newContainers'] = false;
            }
            $numObjects = count($data['newContainers']);
            for ($a = 0; $a < $numObjects; $a++) {
                $updateData = array(
                    'status' => $data['newContainers'][$a]['status'],
                    'bill_of_lading' => $data['newContainers'][$a]['bill_of_lading'],
                    'vendor_id' => $data['newContainers'][$a]['vendor_id'],
                    'product_id' => $data['newContainers'][$a]['product_id'],
                    'discharge_port' => $data['newContainers'][$a]['discharge_port'],
                    'final_destination' => $data['newContainers'][$a]['final_destination'],
                    'isf_required' => isset($data['newContainers'][$a]['isf_required']) ? $data['newContainers'][$a]['isf_required'] : false,
                    'eta' => empty($data['newContainers'][$a]['eta']) ? null : date("Y-m-d\TH:i:s", strtotime($data['newContainers'][$a]['eta'])),
                    'bl_status' => $data['newContainers'][$a]['bl_status'],
                    'container_size' => $data['newContainers'][$a]['container_size'],
                    'latest_event' => $data['newContainers'][$a]['latest_event'],
                    'latest_event_time_and_date' => date("Y-m-d\TH:i:s", strtotime($data['newContainers'][$a]['latest_event_timestamp'])),
                    'is_active' => true,
                    'is_complete' => false,
                    'do' => $data['newContainers'][$a]['do'],
                );
                $tempObj = $this->ShipmentsModel->get_by_container_number($data['newContainers'][$a]['container_number']);
                $tmpObj = json_decode(json_encode($tempObj), true);
                if ($tmpObj !== null) {
                    if (array_key_exists('isf_required', $tmpObj) && isset($tmpObj['isf_required'])) {
                        if (!isset($data['newContainers'][$a]['isf_required']) || $tmpObj['isf_required'] !== $data['newContainers'][$a]['isf_required']) {
                            $updateData['isf_required'] = $tmpObj['isf_required'];
                        } else {
                            $updateData['isf_required'] = false;
                        }
                    }
                    if (array_key_exists('customs', $tmpObj) && isset($tmpObj['customs'])) {
                        if (!isset($data['newContainers'][$a]['customs']) || $tmpObj['customs'] !== $data['newContainers'][$a]['customs']) {
                            $updateData['customs'] = $tmpObj['customs'];
                        } else {
                            $updateData['customs'] = false;
                        }
                    }
                    if (array_key_exists('po_boolean', $tmpObj) && isset($tmpObj['po_boolean'])) {
                        if (!isset($data['newContainers'][$a]['po_boolean']) || $tmpObj['po_boolean'] !== $data['newContainers'][$a]['po_boolean']) {
                            $updateData['po_boolean'] = $tmpObj['po_boolean'];
                        } else {
                            $updateData['po_boolean'] = false;
                        }
                    }
                    if (array_key_exists('qb_rt', $tmpObj) && isset($tmpObj['qb_rt'])) {
                        if (!isset($data['newContainers'][$a]['qb_rt']) || $tmpObj['qb_rt'] !== $data['newContainers'][$a]['qb_rt']) {
                            $updateData['qb_rt'] = $tmpObj['qb_rt'];
                        } else {
                            $updateData['qb_rt'] = false;
                        }
                    }
                    if (array_key_exists('qb_ws', $tmpObj) && isset($tmpObj['qb_ws'])) {
                        if (!isset($data['newContainers'][$a]['qb_ws']) || $tmpObj['qb_ws'] !== $data['newContainers'][$a]['qb_ws']) {
                            $updateData['qb_ws'] = $tmpObj['qb_ws'];
                        } else {
                            $updateData['qb_ws'] = false;
                        }
                    }
                    if (array_key_exists('requires_payment', $tmpObj) && isset($tmpObj['requires_payment'])) {
                        if (!isset($data['newContainers'][$a]['requires_payment']) || $tmpObj['requires_payment'] !== $data['newContainers'][$a]['requires_payment']) {
                            $updateData['requires_payment'] = $tmpObj['requires_payment'];
                        } else {
                            $updateData['requires_payment'] = false;
                        }
                    }
                    if (array_key_exists('is_complete', $tmpObj) && isset($tmpObj['is_complete'])) {
                        if (!isset($data['newContainers'][$a]['is_complete']) || $tmpObj['is_complete'] !== $data['newContainers'][$a]['is_complete']) {
                            $updateData['is_complete'] = $tmpObj['is_complete'];
                        } else {
                            $updateData['is_complete'] = false;
                        }
                    }
                    if (array_key_exists('do', $tmpObj) && isset($tmpObj['do'])) {
                        if (!isset($data['newContainers'][$a]['do']) || $tmpObj['do'] !== $data['newContainers'][$a]['do']) {
                            $updateData['do'] = $tmpObj['do'];
                        } else {
                            $updateData['do'] = false;
                        }
                    }
                    $this->ShipmentsModel->update_record(array('container_number' => $data['newContainers'][$a]['container_number']), $updateData);
                } else {
                    if (isset($data['newContainers'][$a]['bill_of_lading']) && $data['newContainers'][$a]['bill_of_lading'] !== '') {
                        $updateData['container_number'] = $data['newContainers'][$a]['container_number'];
                        $this->ShipmentsModel->add_record($updateData);
                    }
                }
            }
            $this->ShipmentsModel->archiveInactiveRecords();
            $curlData = array();
            $uniqueBoLs = $this->ShipmentsModel->get_unique_records_by_BoL(1);
            for ($i = 0; $i < count($uniqueBoLs); $i++) {
                $bol = $uniqueBoLs[$i]["bill_of_lading"];
                $curlData = $this->get_lfd_and_pickup_number_from_bol($bol);
                $this->ShipmentsModel->update_record(array('bill_of_lading' => $uniqueBoLs[$i]["bill_of_lading"]),
                    array('lfd' => (empty($curlData['lfd']) ? null : date("Y-m-d", strtotime($curlData['lfd']))),
                        'pickup_number' => (empty($curlData['pickup_number']) ? null : $curlData['pickup_number'])));
            }
            $data['title'] = "Active Shipments";
            echo "Start time: $starttime" . PHP_EOL;
            $endtime = microtime(true);
            echo "End time: $endtime" . PHP_EOL;
            //execution time of the script
            $execution_time = ($endtime - $starttime); //gets run time in secs
            $execution_time = round($execution_time, 2); //makes time two decimal places long
            echo 'Total Execution Time: ' . $execution_time . ' Secs' . PHP_EOL;
        } else {
            /* else not a command line call.... */
            set_time_limit(4000);
            // Connect to gmail
            $hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
            $username = 'cargodata.libra@gmail.com';
            $password = 'Libra123$$';
            // try to connect
            $inbox = imap_open($hostname, $username, $password, null, 1) or die('Cannot connect to Gmail: ' . print_r(imap_errors()));
            $date = date("j F Y");
            $newdate = strtotime('-1 day', strtotime($date));
            $newdate = date('j F Y', $newdate);
            $emails = imap_search($inbox, 'NEW SINCE "' . $newdate . '"', SE_UID);
            if (!empty($emails)) {
                rsort($emails);
                $test = false;
                foreach ($emails as $mail) {
                    if ($test) {
                        break;
                    }

                    $msgno = imap_msgno($inbox, $mail);

                    $headerInfo = imap_headerinfo($inbox, $msgno);
                    $msgBody = imap_body($inbox, $msgno);
                    /* get information specific to this email */
                    //echo "<br/>email_number: $email_number <br/> msgNo: $msgno<br/>";
                    $overview = imap_fetch_overview($inbox, $msgno, 0) or die("can't fetch overview: " . imap_last_error());

                    $pos = strpos($overview[0]->subject, 'Update : ETA Change at Final Destination');
                    $pos2 = strpos($overview[0]->from, 'coscon@coscon.com');
                    if ($pos !== false && $pos2 !== false) {
                        $test = true;
                        $dom = new Dom;
                        $dom->load($msgBody);
                        $title = $dom->getElementsbyTag('title')->text;
                        $htmlBoL = substr($title, 0, 10);
                        echo "<hr/><h1>BoL</h1><br/>" . $htmlBoL . "<hr/>";
                        $dateSpan = $dom->getElementsbyTag('strong')[10]->text;
                        echo "<hr/><h1>DateSpan</h1><br/>" . $dateSpan . "<hr/>";
                        $newETAdate = date("Y-m-d", strtotime($dateSpan));
                        if (!empty($htmlBoL)) {
                            $this->ShipmentsModel->update_record(array('bill_of_lading' => $htmlBoL), array('eta' => $newETAdate));
                        }
                    }
                }
            }
            // colse the connection
            imap_expunge($inbox);
            imap_close($inbox);
            $this->check_for_vendor_emails();
            echo "Start time: $starttime" . PHP_EOL;
            $endtime = microtime(true);
            echo "End time: $endtime" . PHP_EOL;
            //execution time of the script
            $execution_time = ($endtime - $starttime); //gets run time in secs
            $execution_time = round($execution_time, 2); //makes time two decimal places long
            echo 'Total Execution Time: ' . $execution_time . ' Secs' . PHP_EOL;
            $data['title'] = "Active Shipments";
            $this->load->view('templates/header', $data);
            $this->load->view('shipments/index', $data);
            $this->load->view('templates/footer');
        }
    }

    public function check_for_vendor_emails()
    {
        /* connect to gmail */
        set_time_limit(4000);
        $hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
        $username = 'cargodata.libra';
        $password = 'Libra123$$';
        /* try to connect */
        $inbox = imap_open($hostname, $username, $password) or die('Cannot connect to Gmail: ' . imap_last_error());
        $subjpass = 'COSCO SHIPPING Lines report, Daily B/L Report';
        /* if emails are returned, cycle through each... */
        $failSafe = true;
        if ($inbox !== false) {
            $numMsg = imap_num_msg($inbox);
            $emails = imap_search($inbox, 'ALL', SE_UID);
            if (!$emails) {
                echo "NO NEW DATA";
                $failSafe = false;
            }
            if ($failSafe) {
                //var_dump($emails);
                /* put the newest emails on top */
                rsort($emails);
                /* for every email... */
                foreach ($emails as $email_number) {
                    $msgno = imap_msgno($inbox, $email_number);
                    $header = imap_headerinfo($inbox, $msgno);
                    //var_dump($header);
                    if ($header === false) {
                        echo "email header parsing error. vendor emails Shipments.php -sv";
                    }
                    $msgBody = imap_body($inbox, $msgno);
                    /* get information specific to this email */
                    //echo "<br/>email_number: $email_number <br/> msgNo: $msgno<br/>";
                    $overview = imap_fetch_overview($inbox, $msgno, 0) or die("can't fetch overview: " . imap_last_error());
                    if (!$overview) {
                        echo "overview failed...container vendor emails<br/>";
                        $failSafe = false;
                    }
                    if ($failSafe) {
                        $vendorAbbr = '';
                        $associatedVendorData = array();
                        $vendorMatched = false;
                        //wanda...@tjwanda.com
                        //test...@gmail.com
                        $vendors = $this->ShipmentsModel->get_all_vendor_data();
                        foreach ($vendors as $vendor) {
                            $emailHosts = explode('|', $vendor['email_addresses']);
                            foreach ($emailHosts as $vendorEmailHost) {
                                $pos = strpos($overview[0]->from, $vendorEmailHost);
                                if ($pos >= 0) $vendorMatched = true;
                            }
                            if ($vendorMatched) { 
                                $associatedVendorData = $this->ShipmentsModel->get_vendor_data_by_id($vendor['id']);
                                $vendorAbbr = $vendor['document_initials'];
                                break;
                            }
                        }
                        if ($vendorMatched) {
                            /* get mail structure */
                            $structure = imap_fetchstructure($inbox, $msgno);
                            $attachments = array();
                            /* if any attachments found... */
                            if (isset($structure->parts) && count($structure->parts)) {
                                for ($i = 0; $i < count($structure->parts); $i++) {
                                    $attachments[$i] = array('is_attachment' => false, 'filename' => '', 'name' => '', 'attachment' => '', 'file_extension' => '');
                                    if ($structure->parts[$i]->ifdparameters) {
                                        foreach ($structure->parts[$i]->dparameters as $object) {
                                            if (strtolower($object->attribute) == 'filename') {
                                                $attachments[$i]['is_attachment'] = true;
                                                $attachments[$i]['filename'] = $object->value;
                                                //echo "attachment found...".$attachments[$i]['filename']."<br/>";
                                            }
                                        }
                                    }
                                    if ($structure->parts[$i]->ifparameters) {
                                        foreach ($structure->parts[$i]->parameters as $object) {
                                            if (strtolower($object->attribute) == 'name') {
                                                $attachments[$i]['is_attachment'] = true;
                                                $attachments[$i]['name'] = $object->value;
                                                //echo "attachment found...".$attachments[$i]['name']."<br/>";
                                            }
                                        }
                                    }
                                    if ($attachments[$i]['is_attachment']) {
                                        $attachments[$i]['file_extension'] = $structure->parts[$i]->subtype;
                                        $attachments[$i]['attachment'] = imap_fetchbody($inbox, $msgno, $i + 1);
                                        if ($structure->parts[$i]->encoding == 3) {
                                            //echo "BASE64 decoding file...<br/>";
                                            /* 3 = BASE64 encoding */
                                            $attachments[$i]['attachment'] = base64_decode($attachments[$i]['attachment']);
                                        } elseif ($structure->parts[$i]->encoding == 4) {
                                            //echo "QUOTED-PRINTABLE decoding file...<br/>";
                                            /* 4 = QUOTED-PRINTABLE encoding */
                                            $attachments[$i]['attachment'] = quoted_printable_decode($attachments[$i]['attachment']);
                                        }
                                    }
                                }
                            }
                            $documentBL = '';
                            $documentCN = '';
                            $documentType = '';
                            $associatedCargoData = null;
                            $directoryStructure = $_SERVER['DOCUMENT_ROOT'] . "/vendor_documents";
                            $filename='';
                            $fullPathAndFileName='';
                            $vendorIdLabelForDocuments = '';
                            foreach ($attachments as $attachment) {
                                if ($attachment['is_attachment'] == 1) {
                                    $filename = $attachment['name'];
                                    if (empty($filename)) $filename = $attachment['filename'];
                                    if (empty($filename)) $filename = $vendorAbbr . '-' . date('mdy') . '.' . $attachment['file_extension'];
                                    $tmpFileDir="$directoryStructure/tmp/$filename";
                                    file_put_contents($tmpFileDir, $attachment['attachment']);
                                    switch (strtoupper($associatedVendorData['abbreviation'])) {
                                        case "WANDA":
                                            if      (preg_match('LB\d{2}', $filename, $match))  { $vendorIdLabelForDocuments = trim($match[0]); }
                                            else if (preg_match('LB\d{3}', $filename, $match))  { $vendorIdLabelForDocuments = trim($match[0]); }
                                            else {
                                                if (strpos(strtoupper($filename), strtoupper($attachment['file_extension']))) {
                                                    $vendorIdLabelForDocuments =trim(substr($filename,strripos($filename, ' ') + 1,
                                                                                            ((strpos(strtoupper($filename), strtoupper($attachment['file_extension'])) - 1) - (strripos($filename, ' ') + 1))));
                                                }
                                            }
                                            switch (strtoupper($attachment['file_extension'])) {
                                                case "PDF":
                                                    $documentType="Bill_of_Lading";
                                                    $pdf = new \TonchikTm\PdfToHtml\Pdf($tmpFileDir, [
                                                        'pdftohtml_path' => 'F:/xampp/htdocs/assets/poppler0.51/bin/pdftohtml.exe',
                                                        'pdfinfo_path' => 'F:/xampp/htdocs/assets/poppler0.51/bin/pdfinfo.exe'
                                                    ]);
                                                    $pdfInfo = $pdf->getInfo();
                                                    $contentFirstPage = $pdf->getHtml()->getPage(1);
                                                    $paragraphs = $dom->find('p');
                                                    if (count($paragraphs) > 86) {
                                                        if (!is_null($paragraphs[86]) && !empty($paragraphs[86])) $documentCN = trim($paragraphs[86]);
                                                        if (!is_null($paragraphs[64]) && !empty($paragraphs[64])) $documentBL = trim($paragraphs[64]);
                                                        $associatedCargoData = $this->ShipmentsModel->update_record( array('container_number' => $documentCN), array('vendor_identifier' => $vendorIdLabelForDocuments) );
                                                    }
                                                    break;
                                                case "XLS":
                                                    $documentType = "Invoice";
                                                    $associatedCargoData = $this->ShipmentsModel->get_by_vendor_specific_identifier($vendorIdLabelForDocuments);
                                                    break;
                                                default:
                                                    //otherwise, store in 'Other' documents folder
                                                    $documentType = "Other";
                                                    break;
                                            }
                                            break;
                                        default:
                                            //something i don't have a case for
                                            $documentType = strtoupper($attachment['file_extension']);
                                            break;
                                    }
                                    //generate the document storage directory structure name
                                    if (is_null($associatedCargoData) || empty($associatedCargoData)) {
                                        //save to folder for unassociated files...or maybe do a manual save or something? idk yet but i'll figure it out...
                                        $dirDate = date("mdy");
                                        $directoryStructure .= "/UNASSOCIATED_FILES/$dirDate/" . strtoupper($attachment['file_extension']) . "/";
                                    } else {
                                        $yearDigits = date('Y');
                                        $purchase_order_number = ((is_null($associatedCargoData['po']) || empty($associatedCargoData['po'])) ? ('000000') : ($associatedCargoData['po']));
                                        $associatedCargoData = $this->ShipmentsModel->update_record(array('container_number' => $documentCN), array('po' => $purchase_order_number));
                                        $directoryStructure  .= '/' . strtoupper($associatedVendorData['abbreviation']) .  
                                                                '/' . $yearDigits .  
                                                                '/' . $purchase_order_number .  
                                                                '/' . strtoupper($documentCN);  
                                        //$directoryStructure=$_SERVER['DOCUMENT_ROOT'] . "/vendor_documents";
                                        //$directoryStructure .= '/' . $associatedCargoData[] . $yearDigits . '-' . $purchase_order_number . ' ' . $documentCN . '/';
                                        //a better way to do it would be to use directories for each data piece
                                        //  ie-> for a wanda invoice from 2018 with PO 123456 and CN ABCD123456
                                        //       $directoryName=$_SERVER['DOCUMENT_ROOT'] . "/vendor_documents" .
                                        //                       "/$vendor" . "/$current_year" . "/purchse_order_number" . 
                                        //                       "/$container_number" . "/document_type" . "/$filename";
                                        $directoryStructure.=  '/' . strtoupper($documentType) . '/';
                                        $this->ShipmentsModel->set_has_documents($documentCN, true);
                                    }
                                    $fullPathAndFileName = $directoryStructure . $filename;
                                    if (!file_exists(dirname($fullPathAndFileName))) mkdir(dirname($fullPathAndFileName), 0777, true);
                                    $md5_hash = md5($attachment['attachment']);
                                    if (file_put_contents($fullPathAndFileName, $attachment['attachment'])) {
                                        $documentData = array(
                                            'filename' => $filename,
                                            'filepath' => $directoryStructure,
                                            'shipment_id' => ((is_null($associatedCargoData) || empty($associatedCargoData) || is_null($associatedCargoData['id']) || empty($associatedCargoData['id'])) ? null : $associatedCargoData['id']),
                                            'md5_hash' => $md5_hash,
                                            'identifying_label' => $vendorIdLabelForDocuments,
                                            'creation_timestamp' => date("Y-m-d H:i:s")
                                        );
                                        $newDocumentId = $this->Document_model->add_document($documentData);
                                    }
                                }
                            }
                        }
                    }
                    // Mark as Read
                    $setflagSEENresult = imap_setflag_full($inbox, $email_number, "\\Seen", ST_UID);
                    if ($setflagSEENresult === false) echo "error occurred while setting UNSEEN flag to SEEN<br/>";
                }
            }
            imap_close($inbox);
        }
    }

    public $hasCookie = false;
    public $cookies = array();

    public function get_lfd_and_pickup_number_from_bol($bol)
    {
        if (!$this->hasCookie) {
            $ch = curl_init('http://elines.coscoshipping.com/NewEBWeb/');
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            // get headers too with this line
            curl_setopt($ch, CURLOPT_HEADER, 1);
            $result = curl_exec($ch);
            // get cookie
            // multi-cookie variant contributed by @Combuster in comments
            preg_match_all('/^Set-Cookie:\s*([^;]*)/mi', $result, $matches);
            foreach ($matches[1] as $item) {
                parse_str($item, $cookie);
                $this->cookies = array_merge($this->cookies, $cookie);
            }
            //  echo "<hr/>";
            //    var_dump($cookies);
            curl_close($ch);
            $this->hasCookie = true;
        }
        $ch = curl_init();
        //$requestUrl = "http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml?language=en&page=null&token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw&uid=libra";
        $requestUrl = "http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml";
        curl_setopt($ch, CURLOPT_URL, $requestUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_ENCODING, "gzip");
        /*  $payloadArray= array(
        'formId' => 'mainForm',
        'async' => 'false',
        'global' => 'true',
        'source' => 'j_idt49',
        'process' => '@all'

        );
        $payload=json_encode($payloadArray);*/
        $cookieString = "number=$bol; numberType=BILLOFLADING; language=en_US; JSESSIONID=" . $this->cookies['JSESSIONID'] . "; number=$bol; numberType=BILLOFLADING; COSCON_ACCESS_TOKEN=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw; COSCON_ACCESS_I18N=en-US; token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw";

        curl_setopt($ch, CURLOPT_POSTFIELDS, "mainForm=mainForm&cargoTrackSearchId=BILLOFLADING&cargoTrackingPara=$bol&billRemark=&num=1&a2time=2018-04-05+23%3A30&a3time=2018-04-06+00%3A24&a5time1=&a5time2=&a7time1=&a7time2=&a9time1=&a9time2=&a10time1=&a10time2=&a11time1=&a11time2=&a12time=2018-04-28+07%3A15&a13time=2018-04-29+09%3A48&j_idt211=&cntrOrderType=&onlyFirstAndLast=false&cargoTrackingContainerInfoStatus%3A0%3AcontainerNumberFlag=0&cntrRemark=&num1=0&j_idt714=&num2=0&j_idt743=&num3=0&j_idt772=&num4=0&j_idt801=&num5=0&j_idt830=&num6=0&bkRmark=&j_idt1325=&cntrOrderType2=&onlyFirstAndLast2=false&containerNumberAll=TCNU6598472%2CTCNU6598472%2C&containerNumberAllByBookingNumber=&validateCargoTracking=false&isbillOfLadingExist=true&isbookingNumberExist=false&userId=libra&cargoTrackingRedirect=false&numberType=BILLOFLADING&containerSize=&containerTransportationMode=&bookingNumbers=0&javax.faces.ViewState=H4sIAAAAAAAAANVdW4wcV1oujz3u8dhxfEmcbOxkJ87FSTbu6arqqupyNjjjyyjDjpMh442IV2JS012eKbu7q1JVPZcgrN0HggRCAi37gBQEAgRI7AOIJx4Qu1oJEFK4REJIPC28IS4PSIiLxKXOpS7dXXXqtDOn%2BvdI7ukZ99T5zv%2F%2F57%2Bfc777L9KsF%2FjS6XvWjlUfhE63%2FrYVbN%2ByvNna333%2FB%2Bc%2B%2FOvD0syyNN91rc6y1Q5df0U6Fm77drDtdjt73tW3pOjrsLQ7J0lHoneH%2FieUjt3bcDqhLDcbA186%2B41V%2FOiu1d%2Bqv7t5z26Hb%2FzCX%2Fz4r54KXu3OSNKeF%2F3RrBd9DT6SHkQPin564Esa%2Bpu9%2Bl2rbQf1ttvz3L7dD%2BtfX7kev39xzXc92w%2F3v2bvB2u%2Bs2OFtkS%2FzkTP9aWT6bg3%2B4Ne9j%2B9UHrCCkPf2RyEdnB72wqXfHvdDiNCnE0JseT71v6qE4R73%2Fr82V%2F%2BU%2BtXDkuHVqQjgfOxjWHP7KIZz0R%2F9HI%2B3PUwAvV2RCfbX7d2bP%2BDP%2F%2BDN7%2F96We3ZqSZVelYu2sFwTtWzw6lM5hGiwjr4noEq7%2F1xqo0H0R%2F08HPCKVz5BOOu7hu%2B47VdT62Nrv2G3uet4PoNh%2Bg1xPRvJ6Lhq8Hgz4Fg1670cTqS2trqys3b%2BxFxK1PRtws4dAotVCaT4mHB55HMoCpcZgCwagk%2BgN6PUPfR9TSCiA6Pa9bv2HftQbdcJn88sUlz%2Bvu33bv2%2F1%2F%2F53XP%2Fj0rXtvnUD8270svbDoDTa7Tnuxbflb7m3fat%2BP6La449i7P%2Bpt1fe2w143ksf2jStvdvYQxxeGPnjd7YeW07f9lf5dFxF5EKQSOCSPxyKSvVpEshtWaJVRa853d1f6HXsvWWdYKFf6ob1l%2B2f%2B4dd%2B8z%2B%2B9TOtGSRcsztWd2BHwnsq%2Fdw7g96m7X%2Fy3e88e%2FyXfvhzeM38X%2FT1AD19IZRmsZgkbKhhNtQylH86kQ29jAJXGlfa8W%2FJsMtdayvl3EKBnCeC%2Bsonn%2F%2FY3x7%2Fzgcz0uwd6bGu27a676MZRWvrjnQsGGz2nDC0O3fwRJ3OqnQy%2BR3%2B3PBSoOpilZIFwaijlXfI8yaYk8yaE%2Fp2efiJzdIncj0Pc38u4UusLFK%2BnMquDvzpJwoWU5aLQ2sJfTu%2Fa0iX89fC0E%2FXnG53aFWs4VUxhyfTDpUC6Z8VPw30egFheSWf8m9HKtj199UrxK405EYR1milNotWaqRpsw8tW7RHI%2B0crpB19QKaBO%2FMohW5G8HcTn%2BU5Ya3N8n8mixevINe1iah8%2B0EyhGdIqlRrk%2BX6VcRlMeS1bQeGdYEwpHk3UwByFrE7deKuL3S9walZowooWGtfM11u7bV%2F2zB%2F%2BbffPrf%2Fxpp5TuxVvYOYZ3bD0c0G55R9M%2BXvlIE591ByIlnYO%2F40pEd1%2BlI6Vdk5jHB8NwHxMpn1NJGiJyBJpWfpiILkx%2BVyg97fG3K45vCx3%2B11EZgLEqzUFVVD0UXDuUSFxSllQx9dGRBo3dnQ%2BmEb0fukm%2F7t%2Fc9bPU%2F5tVHofRSgXO5civyf6%2Bv3N5YW3rn5upEKut3s%2Bb2o0P4bweRhSCTKRFGVYVCdrOI7OjNb01EZkyVh6Ihev29YQqaoXQqoeCtKKKwtuzp2SXqU31VUjh8qoTWQ47VnXIVpRrCpeKh3NhJzC9646IXH71gAPg%2Fd7Eooc9GKE7HPo2Bpy43GuCksEaB5YCVoYKVc8AqUMEqaZRRFGNj7%2Fp59PISiknw1FoZ8h%2BAOCa%2FGExgNDVmWFSh9lbhrZujBBf3DOAtJjIDmXsG8FYYmYHCPQMV6AxU7hk0gc6gOYFSaUFRKhpQYmqh9CIzV4LhG0A1ihFplJoTrLpbTh9AgoVTFnSYxFR1PlkAqpsNpSQSaIpP1nAKgAGTgqrBJwBATZuh8sEHateMZpn8ik%2F20XpyQyvKYA1HD8%2BMlT0SigPQxmxiwslc6uLzViTMM9WiSQ%2Bz9UIO4UjJRG7C82NqFNgEBBfP%2B%2BObaDFsW%2F0tm1liqmgpsDgKzxuhHNXZuOEZUYrbGGI%2FsxYAgP2FJYJpk7Es3a%2BJV5ssusHL8VO6mWV0E58Qf9q3u7YV2BtoeL9nhY7b30BLAsBaOItwuHdXrU5kIzZuY5ayEp3EKlYDELdmPDvEvGv717rvDHox88TzjiHzGrzMaI0CY%2BOGl72guGV%2Bp8UQ7%2F2zSAgv6KckVNi44cWqFLfKxg0vSKW4oyj12RwVGiuohviM6%2FNDK%2BZdv2P7KPTM2BoAZuZ8cWjMTEMBMDKa%2BDwZLTtmSm0HXXZkTlC8Kj0dB9xkSLMprLo5KxsT5hta4vn7OOGvSaZvwEsakIybViIn4vMEI4SCF4sTQunxkjUyHbMHvWRHaAEvvie0MHJWt7CGv1m1mS8p8MJ2Qp0W2z2Qxavel8tLAGGrJazxO9XHfECE%2BUup6LB0XAXJ59HVkgkjD5z2cf%2F%2F2aSQEbf6i1PmKceZhBYfuo8RWvzuhpc49lmYQM2%2FqXHiB2qVTZ0TP1BLahqc%2BIHaOrMVLzm9RQ2c3hLnCSRaJi7SmnxFWi4zZAqMT2KdfGq4jdaEl0EnbDV5aSZum0esXi%2BgjWNWd9XFvhQyKkYcm4hzHBJ7Mm5ExXkLfN6KwRG6xltb5jadPqJa0b7pIiyBL71esLPF7tZvW1t4M9rNPc%2B3g8Bx%2BxL5OnQCb4V%2FmuxLiz458rHd%2BW9%2B44ff%2B99fnMEfO5t8LP3Eb%2Fz0z67%2F253Pv4r3HUconnf9rbrlWe1tO%2Bd5Kz2v%2B8lrncf%2F%2Fsif%2FNEJsrHt8Pd2f0R67YWfTIV36Va930HScyNUFq4uXIpIfGnhysIlxOFLP5Xd%2Bkw2AHve3u49aXuiPa4LbzVb6ustbQHvxXzzIv%2F4FzG%2FT3bc9qBn90Pm1vBKS0Tjci%2FMeUvVI1Pu%2BcKmw384qayjP%2Fpj%2FPqD3avSV8Z4d8MJ2tsTCM99yZlUeMzG6y29UHiKAVzMZhILdw8M28Iz6dPXbctvb690Djyd4ZXxki8Q%2BWK8LNYDqkA9YBrleiBn%2FIuZ6CV1pUxxYWJia57I4xOUavDVTOeWUWTth%2BV7jIYC0xzyUNSZGVOcY8LhFolzZNMyKWN08Tt%2Fx40Tj1P0BQk%2B3%2B6H%2Fnt2z%2FLvC6zY5Jb1bu0vR%2F4BBLeApdRbfI6xMAPNrdUnN9Bao8lhoAvVOpNq4nNitGzRVIXJ7ekhyq1ZviXEpfjyKB3vb6WEVBvi1d6T%2BAgPK7SvZ%2BcrZK4F2yho%2BK3Q9KbAYDTJtZRQXby6n8VdF6W0RefxXC46EuV9x959z3VLD0U5is9asYP4TCx8NNsq%2Ft2D%2Fzz94aeN%2F%2FrnGenIijS3bQXbbbdjr6LTbQaRadhHT3hsVZpD2mZgbdn059qO5TtWP8Q%2FksO0Qmnm6%2BvRSwRNklCsfmR%2F%2FAigf5pACsSFZlwpCVN8NZ05fAVtYWP%2BTux6aBV0%2BzAnL75Az1YAxedjHRgAvlUgzgdMHf0SUogrNk1ICnErQuejhPhFwViS8jQCoHR08RbxS2OjE86rQMtEaouBGWgNRDXLhFwRL2an49QerbdU0LZHmmx0vYGH1IAWTjVjDClQ2ddaOWysqqsuIQ7QRaaZTFWqiPctRpqUXRd9A5FwuVBiZxTx3kacaDPjQeVGBdVP1pzF%2BxU0W5I54uGgsyVFljBzfCOoRdpsMDDD21dEMMu50ltBDbOQUvC2DxFKKQzM8LYOEcxqwl2tmVQexDVVljreTXh7lQihmkl5uDBRMFw%2BK5wh0A5GdOhBIWagXYtoW38hZqAON9rSn7PkxPsgw46sDtRG6o1xL7%2BCvvIcjoj3kMbmKb6E9UxBvVluwVNLNQoMHTbfD31cxUVHS0%2FgTx5Hb%2FL8ycmijt1k%2Bg9Z8B32W4uZAE%2FPUiboLNTwNC1FbbBQw0tzUNQtFmp4%2BQeK2hztuhjNqXN5TYyQVRWfJXwh96wRksrY2LH9YOr7wS%2FkZxNk8W07LM6IT9TPxc4LlxSdjNNP0z6WfpRlGf9Crz7pLbC5q9S%2FMOH5mzUKLJc74kW6mFTwUkGUVDILNby0DEWt5KwEceUfrZS98HJBlFBqRKgx1KxMbeUdzAwjVMGdPazRq6shyLGSaoir6qRNa3M7%2BFKfoMhaTedcs3GFbYhnfw4DxLXEJ0WcnKlORdbEnS0wutE%2BO1XxSZgnnIB6%2BOQ%2BnZt7Ubhy4CUr1IOYd5JifJiFqgpj6mE60afGtBceG57Zxm2qSiFgeOYTA1YLAcMraWDAzULA8FKBGLBWCBhe2gwD1gsBw8uYYcBGIWB4yTIMuBVK52jSCeeclp1%2B59ogDAvTNIcf%2BNIS2gvt%2BU7PHm1vj971rH5nEz%2Bhfp38RJ5X1u9%2BbNfpbNnh%2B5YfSs%2BS9xv5yIpVMbzcHiaymaRfCncmDadfxr0Hgbk7fSjZkexly7YoQKEmvVjNyAELb31RsNEKO0H9ozXf6Yel%2FlB1WbU8psNbQpSO0SI6jrcgQkhJXs1bMJn9B7BoJzdiBaTI4u4WZB%2FTolEaQU3NyTLvDOD5%2B3QGCu8M4AUAdAYq7wzgRQR0Bs3RjTG0kPIuPYERzLnIF4ou5UkC6sJrhw4udXDK7Xf3lx0%2FCJf6nVVrorQBrM6E0k3BSgXlqjPjnVxc7uaZkRuRlzJ3Qxy0lRjHyOcSPx470CRehWdGSPOVPIYUnrkgSJU8XhRVdaaTpC5ZUOL10ziB%2BE75GxEBePaWiICaN8OiFjrmDOHZYzLDglv8EhtXgVKe72OdOmHf3WRKlT1H8SWAhaIrhmD0%2FFzNLycnhxELpw9bkVVQeTtfuG8fYDhzlOBiogaqUlEEU8Js8bVHBtmA6mkUNn0JH5iygTPKG%2BjsE6xE3r65dONgMT%2BcGsHfzu%2B%2BIj23GNo9r2uFdrDYi4h8Of6RnNAkSYfaN668ubUXz694WkxGwasgEUZpUdAWNzSQ6qcKZin6Q7F4BIxJYXglL0JhfZzCYFbtKIWbTArDqx8QChulOlq8xzTKYjDrfZTFGpPF8KouhMUtJmp4NQ6C2sw5YCkVTFmBh7tGgZWEIBU4Pcfw%2BO2wsM9u5LL0gk7E7M0gsIis5%2B7FiVHDW4gUde5enBg1VIHWI4E%2BOggiWRZzInVhLFrBEWbFY4tfpK%2FkKomR7PNy1zrQgyy9TJ077oyUAV5oVqPAWCwS75gUm81MszQUkh0luNhmU4WHu0aB5cglVEVuMF0qBWg9RpFLZAMebiobclmQ0qpq%2B1tGOKHaa8NkCifQFKeilAgnPNxUOJm5WQVMQmiE3GoJueHhpuRmJrIUMNmhEXI3S8gNDzcldzPvTBwSyzbhmWdyJg7bOoPJLo2ISN6Vz1kRgYebiohWap35mhNE3SvEfUVUT7rPcwMFaWKLL6FQm%2FoXuGKscG3B8y7I2mI7F0DrCIpesrbg4aZrSy9JJramWS5X4OUNCLuNEnbDw03ZzUprGlBDd6Ms5wDPT6DkZuVjDajRsFEWxsMzHZTcJovcUOM7Q2GhhhomGSoLNdRow2iyUEN1gA2tzEhP4%2FifmGpQXRsjcm3mUVuk4Mv7RvN2LahmtJWTAW9BNUKt3MOb4oCvsmxsfGidDLBHjG6C0nK4CtXWtZQcykJVIKg5bIyyUO1xS82hLNQwRDZyKAvVZ2gxMpQaPF1P7ldp5EgD1ChJzr0lihIYnn0iBGaap2ncBEbpBU%2FzE3opqB%2BlfLNxJK%2FiMk6cd5sqnNevC7vRmDuf3Je6D5FP1lSOS40nTihr8CwjkbySQiTA23dqFBiD2PCMJSF2SRkS4LVBlNgyg9jwXH9C7JKCHsCbhyixc68eosSGFw0QYuulVoOvo1NUETLnFvqDLELqjfIiZA6Ei%2FkXGWelFJ7doFKq8rsswja1Mi7iztIQnjmgNGzGm9fjw6x1oMpUL20yMPnagYV5hdwL%2FOG8Qt3g8AoLV%2FgIk4EqcV3nX9LCrmpNDxBm5vRN8TnOEabByxYRphljSOFlMgjS1hhSeKVSgrRsDxmnshOyNUYVlgDgGFv8tpwnc60MqxRV%2BVFAxeQRLxZnE%2FJsXN%2B22%2FevuXsHf4qilz%2FQwd%2F9642pWYBdNkcJLm7baIq74DA%2BHvfk0BV6k%2FAFxEl1F0bv0DtfcO1n2KxgSdXo9veCgY6lOuYBel2IfJQdqzuwvWpUDj4wCMcLYaa9fg5hRHv3UQl%2FKQjctoNP8wgieQ1CKxwEuYoqPrMSnuGlxY7cHiW6sprifb5iQZzu4NPoYKGyAnCrJd3p32ChhppKVXJLYzFqqDlJJbcLL0YNNUel5HbhxaihZoXQZiVy4EnmPLQZJthQ%2BjI%2B2qlO7kDw7cAd%2BG27vh7ud%2B1g27bD4ZmMY4tnEmmEvtWzk59qXWfTt%2Fz9kcnN4gfM5k%2FusUby5%2FPpzQyZ%2F68n%2F%2F9kj5ygHizGb%2BrtICD0QJ98mamZ4CXLKAe1hIMqJwfRZF%2FjZVKWhpjeD8Ud9F7L5cpT9z4a2P7%2B4sBZJO8uD5xhvtxg8gVefovyRU%2F40uReWefzV1bbdzzuVSWaYacow8i3%2Br0Mp36CySl4SS3KKSPhlDbBCtqEwpBzeSsoy5Z9JlvgZfAoW1oJW%2FRHkS0n2q5vL6KXIWZ820umZTyK0zpF7jhapFcdZaf26%2BnUWo%2Fi1J7Zj5bQIHS6TuhEXkLybmiSv%2B%2FlXKPdMAXWKOJOKUpaEy5pQ%2Bl4xoDl0vjoveDuED3%2FLPrl0%2FlROMB7Zch5dY1iyPBCQQJZZoX8md7Z6vMNmvg8%2F%2FPj9zxc27%2BWvbvzwLPN%2BIU9b%2FHZRvadMk26yKBG1I3SW3HiGUCNrhtN3hlAjS4bGu8MoMZhjSQOyyQXwVnOjwqdkjMeujzP9hfp96zxPGkkbkEmB%2FkITe5Ux7G67tYi%2BTY0teXov19iSp5MinjwygukiGcmrOHNrH0EKS%2FzWM%2FuDxbRy1A25uSHqcg9kvmmxz2rb3cX8evwzNx0ZrwZG1CL6UTKsexCepBO65FMb5zMMiw7sZ9Hpx%2BjkiSo60Wv4utFKcEnSVyAWSFPedaW07ciFbuYvBteKb%2BdVImbeTmM6dN9kswKGLo%2F2bFCa8t3Oovxm2Gqfz%2Bd3yOZXjmXJ1fZBf1XqVgx0ylV9kEoCuB8SzGtnxiXpSyl%2F5EZmVZwORhjcPHtBzxuJcCjI44SXKH0zBD%2BpbazY685ET19u6ivqMplw0VdoGkydNQFF354vRMEvxK5RCQlrTX5LjQsXolVXM9WPLj4rCDZlW8aLTKkmRFKYTn8sTEr2K40TmTaW641xHWPFhK5gs0cjAkXrYkD3MlBOzzpkdBgzMjo%2FUaNMahgdPIoVHkMKhj1OwpViXvMY4k3wVB12FKY8hhSMEQdQTpOU3gVC4JUHUMKrzJBkDbHNXMFWwmKFbMszPZm7uApL2OEcqNZgRfAoIP4O3l56TBVz0QW5iZMTIcKHBbqsuutIqcXuey1%2B6F0atfpbNnhRvL59I%2FVTHb3wM9VdPvd%2FWXHD8KlfmfVCsJHdxeQ51EVGOZVL6YRNc99hjOXJ5IehdvW5nTD%2BL9kr01FfNRAOJSXeZsihzgVhibejkbecBDYXcSUZcfudooW%2BQNfkl1%2Fq542xtfbbs9z%2B3Y%2FrJOCyhp6fXHNdz3bD%2Fe%2FZu8HEv06I0mYYLVIxRC1877lh9I5qoJGIIhnBP52frchvZx%2FpEIKaOhG6jsllkYRHxIST6tlmtTTagjLr44mGjJjCkurpub8QkGPMTolVrx%2FxxpdvFf1HDtryJWKY81AvD%2FEngHf7bLsZxQpxkmewfKQeJ9RJA1lidFYZajihZkxuHhZrm3ef6%2BCc7pT5STu9tfUxx4bU1yCWS%2FXSKp4H%2BoSRx0jNBVhZEhtEYsO4q0vJx2EdeOm9vHJISTv2R3Ht9vhga8y5KumF%2FlEw%2FUDz%2FVDvGX%2FltuxhS3reafvhNdRW7Vd8Lw4jj1Nncj0D1DNOu8UnIIHZQ5KQC8vJ1wpLpxPcAtz1uO8HPmRnpc847XcZzT4noL93ooOjsmjJp%2FxPI96qty7q3i1btxODyOSAR6%2FWaPAmLCh9iajkywv5PGJ4oa6Y1Iz2LihbinUWmzc8FqJKW6TaUTFpawnNKKqwMBWLncmxKWsJ6WDuB4mfThlLLMLBhXlClk8ER%2B4jo9u0NH1hvgWFtbo4ntYTm5md7Gl7V8H6UuyZih%2BDxtDX%2BtgmitG9LXeYOOG1xNAccts3PA6BChuhY0bXr8Axa2yccPrHqC4m6F01gmQw%2F0udbhv7kUmUIz6YRAIajyCjrBm4YYakOjJPVu63rhC3whLVY1WKzJjCksLcVUrBJbwOKoVmvicGMOky%2BKb%2F1mji%2B%2F%2BHzu9P7njOlQqaIhlDl9VLTJdaYbAdqc4ZGN31JOO7xa8XAfpqDdyaCYuztQnIRm8NAshWYsTP7x0C8Gfm21JVJQiPqakwX1D5tvCEecC1LxtgVPJClzYS0%2FbNlVScgN4Xydht5qG0de3rf5WYdGhOuKN0Q5eJEBo1xylHTPlMR3awQsSCO20MaTwwgKCVB%2FlMtNLq4jL5327a1uBvYG0s9%2FD5c0NihIAPB4LmLndEhTDzUYovZqPHxF7HZ%2F5Tn1WcebwMFejdnxPSqOKrjpeKMKb7fb%2BHyPbhyTINwEA&javax.faces.partial.ajax=true&javax.faces.source=cargoTrckingFindButton&javax.faces.partial.execute=@all&javax.faces.partial.render=bookingNumbers billToBookingGrop billofLading_Table3 release_Information_bill release_Information_booking cargoTrackingOrderBillInformation cargoTrackingBookingOfLadingInformation cargoTrackingContainerHistory cargoTrackingContainerInfoStatus cargoTrackingContainerBillOfLadingNumber1 cargoTrackingContainerInfoByContainerNumber release_Information_booking_version release_Information_bill_version actualLoadingInfo containerInfoByBlNum containerInfoByBkgNumTable actualLoadingInfo5 documentStatus cargoTrackingAcivePictures containerNumberAll containerInfo_table3 containerInfo_table4 cargoTrackingPrintByContainer containerNumberAllByBookingNumber registerUserValidate validateCargoTracking isbillOfLadingExist isbookingNumberExist cargoTrackingContainerPictureByContainer cargoTrackingContainerHistory1 cargoTrackingOrderBillMyFocus cargoTrackingBookingMyFocus userId contaienrNoExist billChange4 bookingChange4 bookingChange3 cargoTrackingContainerHistory6 numberType containerSize containerMessage containerTab isLogin cargoTrackingBillContainer cargoTrackingBillContainer1 BillMessage BookingMessage searchSuccess searchError containerTransportationMode&cargoTrckingFindButton=cargoTrckingFindButton");
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Host: elines.coscoshipping.com',
            'Connection: keep-alive',
            'Origin: http://elines.coscoshipping.com',
            'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36',
            'Content-Type: application/x-www-form-urlencoded',
            'Accept: application/xml, text/xml, */*; q=0.01',
            'Faces-Request: partial/ajax',
            'X-Requested-With: XMLHttpRequest',
            'DNT: 1',
            'Referer: http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml?language=en&page=null&token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw&uid=libra',
            'Accept-Language: en-US,en;q=0.9',
            "Cookie: $cookieString"));

        $output = curl_exec($ch);
        if (curl_error($ch)) {
            return null;
        }
        curl_close($ch);
        //echo $output;
        if (!$this->hasCookie) {
            echo $output;
        }
        $DOM = new DOMDocument();
        libxml_use_internal_errors(true);
        $DOM->loadHTML($output);
        $table = $DOM->getElementById('containerInfoByBlNum');
        $Header = $table->getElementsByTagName('th');
        $Detail = $table->getElementsByTagName('td');
        $tableOBLstatus = $DOM->getElementById('CargoTarcking_booking');
        $TableRowOBLstatus = $tableOBLstatus->getElementsByTagName('tr');
        $DetailOBLstatus = $tableOBLstatus->getElementsByTagName('td');
        $DetailOBLstatus2 = $TableRowOBLstatus->getElementsByTagName('td');
        $y=0;$z=0;
        $testStatus='';
        foreach ($TableRowOBLstatus as $tableStatusRow) {
            $oblStatus[$y] = trim($tableStatusRow->textContent);
            $y++;
        }
        foreach ($DetailOBLstatus as $detailStatus){
            $oblStatusTd[$z] = trim($detailStatus->textContent);
            $z++;
        }
        echo '<hr/><hr/>';
        print_r($oblStatus);
        echo '<hr/><hr/>';
        print_r($oblStatusTd);
        echo '<hr/><hr/>';
        $z=0;
        foreach ($oblStatusTd as $stats){
            if (strpos(trim($stats->textContent), 'OBL Release Status')) {
                $testStatus=$oblStatusTd[$z+2]->textContext;
            }
            $z++;
        }
        echo '<hr/><hr/>';
        print_r($testStatus);
        echo '<hr/><hr/>';
        //$LabelOBLstatus = $DetailOBLstatus->getElementsByTagName('label');
        //#Get header name of the table
        foreach ($Header as $NodeHeader) {
            $aDataTableHeaderHTML[] = trim($NodeHeader->textContent);
        }
        /*    echo "<hr/>aDataTableHeaderHTML<hr/>";
        print_r($aDataTableHeaderHTML);
        echo "<hr/>";
         *///#Get row data/detail table without header name as key
        $i = 0;
        $j = 0;
        foreach ($Detail as $sNodeDetail) {
            $aDataTableDetailHTML[$j][] = trim($sNodeDetail->textContent);
            $i = $i + 1;
            $j = $i % count($aDataTableHeaderHTML) == 0 ? $j + 1 : $j;
        }
        //print_r($aDataTableDetailHTML); die();
        // print_r($aDataTableDetailHTML);
        //#Get row data/detail table with header name as key and outer array index as row number
        for ($i = 0; $i < count($aDataTableDetailHTML); $i++) {
            for ($j = 0; $j < count($aDataTableHeaderHTML); $j++) {
                if (array_key_exists($j, $aDataTableDetailHTML[$i])) {
                    $aTempData[$i][$aDataTableHeaderHTML[$j]] = $aDataTableDetailHTML[$i][$j];
                } else {
                    break;
                }
            }
        }
        $aDataTableDetailHTML = $aTempData;unset($aTempData);
        /* echo "<hr/>aDataTableDetailHTML[0]<hr/>";
        print_r($aDataTableDetailHTML[0]);
        echo "<hr/>";*/
        $return = array('lfd' => null, 'pickup_number' => null);
        if (array_key_exists('Rail LFD', $aDataTableDetailHTML[0]) && isset($aDataTableDetailHTML[0]['Rail LFD'])) {
            /*      echo "lfd<hr/>";
            echo $aDataTableDetailHTML[0]['Rail LFD'];
            echo "<hr/>";
             */$return['lfd'] = $aDataTableDetailHTML[0]['Rail LFD'];
        } elseif (array_key_exists('Depot LFD', $aDataTableDetailHTML[0]) && isset($aDataTableDetailHTML[0]['Depot LFD'])) {
            /*        echo "lfd<hr/>";
            echo $aDataTableDetailHTML[0]['Depot LFD'];
            echo "<hr/>";
             */$return['lfd'] = $aDataTableDetailHTML[0]['Depot LFD'];
        } else {
            $return['lfd'] = false;
        }
        if (array_key_exists('Pickup#', $aDataTableDetailHTML[0]) && isset($aDataTableDetailHTML[0]['Pickup#'])) {
            /*      echo "Pickup#<hr/>";
            echo $aDataTableDetailHTML[0]['Pickup#'];
            echo "<hr/>";
             */$return['pickup_number'] = $aDataTableDetailHTML[0]['Pickup#'];
        } else {
            $return['pickup_number'] = false;
        }
        unset($aDataTableDetailHTML);
        unset($aDataTableHeaderHTML);
        return $return;
    }

}
