<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Shipments extends CI_Controller
{
    public function index()
    {
        if(!$this->session->userdata('logged_in')){
            redirect('users/login');
        }
        redirect('shipments/getcurrent');
    }

    public function autoupdate($uname,$pw){
        if ($this->users_model->login($uname,$pw)){

        } else {
            echo "AUTHENTICATION ERROR";
        }
    }

    public function getcurrent () {
        $starttime = microtime(true);

        // Check login
        if (!$this->session->userdata('logged_in')) {
            redirect('users/login');
        }
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
        $failSafe = TRUE;
        if ($inbox !== FALSE) {
            $numMsg = imap_num_msg($inbox);
            $emails = imap_search($inbox, 'ALL', SE_UID);
            if (!$emails) {
                echo "NO NEW DATA";
                $failSafe = FALSE;
            }
            if ($failSafe) {
                //var_dump($emails);
                /* put the newest emails on top */
                rsort($emails);
                /* for every email... */
                $reportEmailFound = FALSE;
                foreach ($emails as $email_number) {
                    if ($reportEmailFound) break;
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
                        $failSafe = FALSE;
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
                                    if (empty($filename)) $filename = $attachment['filename'];
                                    if (empty($filename)) $filename = time() . ".dat";
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
                                    if (($handle = fopen("./" . $msgno . "-" . $filename, "r")) !== FALSE) {
                                        while (($recordData = fgetcsv($handle, 1000, ",")) !== FALSE) {
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
        //bill of lading	CN #	Vendor	Port of Discharge 	Destination City	Destination State	Destination Country	ETA Date/Time	ETA Time Zone	Customs Clearance Status Date/Time	Customs Clearance Status Time Zone	Customs Clearance Status	B/L Status	Latest Container Event 	Latest Container Event Date/Time	Latest Container Event Time Zone	Latest Container Event Location
        $columnNames = array("bill_of_lading", "container_number", "vendor_name", "discharge_port", "destination_city", "destination_state", "destination_country", "eta", "eta-timezone", "customs-clearance-datetime", "customs-clearance-timezone", "customs_status", "bl_status", "latest_event", "latest_event_timestamp", "latest_event_timestamp-timezone", "latest_event_location", "container_size");
        $data['newContainers'] = array();
        $unassignedContainerCount=0;
        if (count($dataRows) > 0) {
            $this->ShipmentsModel->mark_everything_inactive();
            $this->ShipmentsModel->archiveInactiveRecords();
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
                            $data['newContainers'][$c - 1][$key] = NULL;
                        }
                        //$sqlFormat = 'Y-m-d H:i:s';
                        //$data['newContainers'][$c-1][$key]=date($sqlFormat, strtotime($data['newContainers'][$c-1][$key]));
                    }else if ($key==='container_number'){
                        if ($data['newContainers'][$c - 1][$key]==='Unassigned'){
                            $unassignedContainerCount++;
                            $data['newContainers'][$c - 1][$key]=$data['newContainers'][$c - 1][$key]."[$unassignedContainerCount]";
                        }
                    }
                }
                //$testDate    = date("m/d/Y");
//                $timestampDate=date("Y-m-d H:i:s");
                
                if (!is_null($data['newContainers'][$c - 1]['eta']) && (strtotime($data['newContainers'][$c - 1]['eta']) < strtotime('2017-01-01 12:00'))){
                    $data['newContainers'][$c - 1]['eta'] = NULL;
                    $data['newContainers'][$c - 1]['status'] = NULL;
                } else {
                    $start  = strtotime($data['newContainers'][$c - 1]['eta']);
                    $end    = time(); //now
                    $diff   = $end - $start;
                    $daysDifference= floor($diff / (60 * 60 * 24));    
                   // echo '<hr/>cn:{'.$data['newContainers'][$c - 1]['container_number'].'}->daysDifferent: ' . $daysDifference . '<br/>';
                    $statusHTML ="<div class='[TYPE]'><p></p></div>";
                    $statusValue='';
                    if (abs($daysDifference) > 0 && abs($daysDifference)< 3) {
                        $statusValue="circle_red";
                    } else if (abs($daysDifference) >= 3 && abs($daysDifference)<=7) {
                        $statusValue="circle_yellow";
                    } else if (abs($daysDifference) > 7) {
                        $statusValue="circle_green";
                    }
                    $data['newContainers'][$c - 1]['status'] = str_replace("[TYPE]", $statusValue, $statusHTML);
                }
                $data['newContainers'][$c - 1]['final_destination'] = $data['newContainers'][$c - 1]['destination_city'] . ', ' . $data['newContainers'][$c - 1]['destination_state'];
                $data['newContainers'][$c - 1]['vendor_id'] = $this->ShipmentsModel->get_vendor_id_by_name($data['newContainers'][$c - 1]['vendor_name']);
                //$data['newContainers'][$c - 1]['requires_payment'] = $this->ShipmentsModel->getISFreq($data['newContainers'][$c - 1]['discharge_port']);
                //echo '<hr/>'.$data['newContainers'][$c - 1]['requires_payment'].'<hr/>';
                $data['newContainers'][$c - 1]['isf_required'] = $this->ShipmentsModel->getISFreq($data['newContainers'][$c - 1]['discharge_port']);
                $data['newContainers'][$c - 1]['latest_event_time_and_date'] = date("Y-m-d\TH:i:s", strtotime($data['newContainers'][$c - 1]['latest_event_timestamp']));
            }
        } else {
            $data['newContainers'] = FALSE;
        }
        $numObjects = count($data['newContainers']);
        for ($a = 0; $a < $numObjects; $a++) {
            $updateData = array(
                'status' => $data['newContainers'][$a]['status'],
                'bill_of_lading' => $data['newContainers'][$a]['bill_of_lading'],
                'vendor_id' => $data['newContainers'][$a]['vendor_id'],
                'discharge_port' => $data['newContainers'][$a]['discharge_port'],
                'final_destination' => $data['newContainers'][$a]['final_destination'],
                'isf_required' => $data['newContainers'][$a]['isf_required'],
                'eta' => date("Y-m-d\TH:i:s", strtotime($data['newContainers'][$a]['eta'])),//date("m/d/Y h:i A", strtotime($data['newContainers'][$a]['eta'])),
                'bl_status' => $data['newContainers'][$a]['bl_status'],
                'container_size' => $data['newContainers'][$a]['container_size'],
                'latest_event' => $data['newContainers'][$a]['latest_event'],
                'latest_event_time_and_date' => date("Y-m-d\TH:i:s", strtotime($data['newContainers'][$a]['latest_event_timestamp'])),//date("m/d/Y h:i A", strtotime($data['newContainers'][$a]['latest_event_timestamp'])),
                'is_active' => TRUE
            );
            $tempObj = $this->ShipmentsModel->get_by_container_number($data['newContainers'][$a]['container_number']);
            //      echo "<hr/>";var_dump($tempObj);echo "<hr/>";
            $tmpObj = json_decode(json_encode($tempObj), True);
            if ($tmpObj !== NULL) {
                if (array_key_exists('isf_required', $tmpObj)){
                    if ($tmpObj['isf_required'] !== $data['newContainers'][$a]['isf_required']) {
                        $updateData['isf_required'] = $tmpObj['isf_required'];
                    } else {
                        $updateData['isf_required'] = $data['newContainers'][$a]['isf_required'];
                    }
                }
                if (array_key_exists('customs', $tmpObj)){
                    if ($tmpObj['customs'] !== $data['newContainers'][$a]['customs']) {
                        $updateData['customs'] = $tmpObj['customs'];
                    } else {
                        $updateData['customs'] = $data['newContainers'][$a]['customs'];
                    }
                }
                if (array_key_exists('qb_rt', $tmpObj)){
                    if ($tmpObj['qb_rt'] !== $data['newContainers'][$a]['qb_rt']) {
                        $updateData['qb_rt'] = $tmpObj['qb_rt'];
                    } else {
                        $updateData['qb_rt'] = $data['newContainers'][$a]['qb_rt'];
                    }
                }
                if (array_key_exists('qb_ws', $tmpObj)){
                    if ($tmpObj['qb_ws'] !== $data['newContainers'][$a]['qb_ws']) {
                        $updateData['qb_ws'] = $tmpObj['qb_ws'];
                    } else {
                        $updateData['qb_ws'] = $data['newContainers'][$a]['qb_ws'];
                    }
                }
                if (array_key_exists('requires_payment', $tmpObj)){
                    if ($tmpObj['requires_payment'] !== $data['newContainers'][$a]['requires_payment']) {
                        $updateData['requires_payment'] = $tmpObj['requires_payment'];
                    } else {
                        $updateData['requires_payment'] = $data['newContainers'][$a]['requires_payment'];
                    }
                }
                $this->ShipmentsModel->update_record(array('container_number' => $data['newContainers'][$a]['container_number']), $updateData);
            } else {
                $updateData['container_number'] = $data['newContainers'][$a]['container_number'];
                $this->ShipmentsModel->add_record($updateData);
            }
        }
      /*  $this->get_lfd_and_pickup_number_from_bol();
        $lfd = $this->get_lfd_from_bol();*/
        $curlData=array();
        $uniqueBoLs = $this->ShipmentsModel->get_unique_records_by_BoL(1);
        for ($i=0; $i<count($uniqueBoLs);$i++){
            $bol = $uniqueBoLs[$i]["bill_of_lading"];
            $curlData = $this->get_lfd_and_pickup_number_from_bol($bol);
            $this->ShipmentsModel->update_record( array( 'bill_of_lading' => $uniqueBoLs[$i]["bill_of_lading"] ),
                                                                    array( 'lfd' => (empty($curlData['lfd']) ? NULL : date("Y-m-d", strtotime($curlData['lfd'])) ),
                                                                           'pickup_number' => (empty($curlData['pickup_number']) ? NULL : $curlData['pickup_number']) ) );
        }
        $data['title'] = "Active Shipments";
        echo "<p>Start time: $starttime</p>";
        $this->ShipmentsModel->archiveInactiveRecords();
        $endtime = microtime(true);
        echo "<p>End time: $endtime</p>";
        //execution time of the script
        $execution_time = ($endtime - $starttime);//gets run time in secs
        $execution_time = round($execution_time,2);//makes time two decimal places long
        echo '<b>Total Execution Time:</b> '.$execution_time.' Secs';

        $this->load->view('templates/header', $data);
        $this->load->view('shipments/index', $data);
        $this->load->view('templates/footer');
    }

/*    public function get_lfd_from_bol($bol='6160585180'){
        $ch = curl_init('http://elines.coscoshipping.com/NewEBWeb/');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        // get headers too with this line
        curl_setopt($ch, CURLOPT_HEADER, 1);
        $result = curl_exec($ch);
        // get cookie
        // multi-cookie variant contributed by @Combuster in comments
        preg_match_all('/^Set-Cookie:\s*([^;]*)/mi', $result, $matches);
        $cookies = array();
        foreach($matches[1] as $item) {
            parse_str($item, $cookie);
            $cookies = array_merge($cookies, $cookie);
        }
        //  echo "<hr/>";
        //	var_dump($cookies);
        curl_close($ch);
        $ch = curl_init();
// http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml?language=en&page=null&token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw&uid=libra

        //$requestUrl = "http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml?language=en&page=null&CARGO_TRACKING_NUMBER_TYPE=BOOKING&&CARGO_TRACKING_NUMBER=$bol&REDIRECT=1";
        $requestUrl = "http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml";
        curl_setopt($ch,CURLOPT_URL, $requestUrl);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($ch, CURLOPT_POST,           1 );
        curl_setopt($ch,CURLOPT_ENCODING , "gzip");
        //  $payloadArray= array(
        //              'formId' => 'mainForm',
        //              'async' => 'false',
        //              'global' => 'true',
        //              'source' => 'j_idt49',
        //              'process' => '@all'
        //  );
          $payload=json_encode($payloadArray);
          $cookieString ="number=$bol; numberType=BILLOFLADING; language=en_US; JSESSIONID=".$cookies['JSESSIONID']."; number=$bol; numberType=BILLOFLADING; ";//COSCON_ACCESS_TOKEN=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw; COSCON_ACCESS_I18N=en-US; token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw";
*/
   //     curl_setopt($ch, CURLOPT_POSTFIELDS,     "mainForm=mainForm&cargoTrackSearchId=BILLOFLADING&cargoTrackingPara=$bol&billRemark=&num=0&a2time=&a3time=&a5time1=&a5time2=&a7time1=&a7time2=&a9time1=&a9time2=&a10time1=&a10time2=&a11time1=&a11time2=&a12time=&a13time=&j_idt211=&cntrOrderType=&onlyFirstAndLast=false&cntrRemark=&num1=0&j_idt714=&num2=0&j_idt743=&num3=0&j_idt772=&num4=0&j_idt801=&num5=0&j_idt830=&num6=0&bkRmark=&j_idt1325=&cntrOrderType2=&onlyFirstAndLast2=false&containerNumberAll=&containerNumberAllByBookingNumber=&validateCargoTracking=false&isbillOfLadingExist=false&isbookingNumberExist=false&userId=&cargoTrackingRedirect=false&numberType=&containerSize=&containerTransportationMode=&bookingNumbers=0&javax.faces.ViewState=H4sIAAAAAAAAAM1dzW8cR3ZvUSJHpGSKlGXZa9mO17a89ibi9MfMdLftYE3JUsQsJSum1okdbLjNmTbZ0nB63N1DkYtAyCLA5pBLkI0PRpyPQwLksLcgf0C%2BsEGADZANggA5BXtOcguc5JJUdVV%2FzHRX9ZvhUPN4aPaQ09W%2F9%2BrV%2B6pXVT%2F8D2W%2BHwbK6gPnwFkbRF537bYT7t1x%2BvO1f%2F3Lv778nX88rczdUpa6vtO55bQjP9hQFqO9wA33%2FG7nsP%2BNdxXyc1p5dFZRzpC7U19GSu3BttfRbGsQKE%2F%2F6mbccNfp7a69v%2FPAbUdv%2F84%2F%2FMofrYRvducU5bBPHpkbfKo8Jk0oykKf%2FKSfao8DZY0%2Bfbj2idN2w7W2v9%2F3e24vWvvWxo3k%2FrV7gd93g%2Bjom%2B5RqPCfi6TpQFnOXn2zN9jP%2F7MfKecDt9dxAze4f9R3I%2BVK%2Fk2EPH8QtN21rXbg9aPHFFItUpacKAq8nUHkhoRlT2csWw8C52jTC6PD7%2F3kxc9%2F5PzBaeXUhnIm9L7rxiTOP6K8mScPvV5O0FbkRO5twlE32HIO3OCjv%2F%2Fzn%2F%2FBFz%2B%2BM6fMbSqL7a4ThnedfQLzYszPOiWqvkXA9Hbf3lSWQvJMJ24jUi6zb3h%2BfcsNPKfrfdfZ6bpvH%2Fb7B5QMJaTXFcKAWtfbCZzgKP3DUj%2Fw9t0YWvq3Mz3y2vTT%2BbYfuHV6WXsQHpL%2BaY7XP%2FcC74CAzPcEbfpspFzKWHt%2Fz4nWA3fLjeL3LlP5ivl3muOI6VjmH%2Bj1%2Bdz95cNUmuOev%2B77Xdfp%2Ffjl4Df%2B%2BYv%2F%2Fc855dTHyvyB0x3QnqEPzBG6FqnERprWUFPpmx%2BSxXl6c16Ah14vpTx6ibBhLRz0OFPotUtIWVu%2Fd29z4%2BZ7%2FHsEZFPwRW%2B%2F3117j%2FTDoBvdYn98bb3f7x7d9x%2B6vf%2F6s5%2F76It3H7x7nkrxo2vKq%2FX%2BYKfrtettJ9j17wdO%2ByERivqB5z76xf7u2uFetN8lw7L99g8U6zDm9kspGXMxGXM5Ml7J3V%2Bjo4SPZTvlhHC00ptFejk3zKtE9ou8irsrd%2F9cSZdGygoRisjv1dkvKnfDRBT74hWhaNDr6%2FTSIA2%2FPMSxG34vcryeG2z0PvHpUBqEAllYJHL%2Fpkju33MiR6iSuKyfDfxHG0T3jEjqRi9yd93g4k%2F%2F%2BE%2B%2B%2FN5vWXNUhXBJDZSV7Ht3B%2Fs7bvD9H3724rnf%2B7ffjrXo%2F5GfWEndiginqTIAsD9SWlUceEt9q538lb32VtfZzUT4ZYE2S9XRG9%2F%2FyS%2F9y7nPPppT5j9Wnur6baf7IaWIDO6PlcVwsLPvRZHbYUPS62ySYZ38Lf7esMLjBmSTs4XCuE%2F166l%2BP6WpUUmThCL6aytu7xA64OORkn%2B%2B%2FshUrpUPyqFP171ud2h4vjrB8DwbE9OO9OPqrTwZ9KqOj%2BWNcs7fJmbRD46Mt5iOVTWRjj1NxlVDNK6I9cs3WjXEFojFjDbYKNigwMfA1xDhozcxuQFVjJzz02b8r43P%2BKdSid4iDkcK4QwFFNuj3BjYjqg30ODENnQNRKy8jeYU2rBBbbxZObjj9nShHZ%2BwuRaoua%2BBmtMtqQU9CJQzB77XUbKfwz5UmCLlqsCp2LhDvI8bG%2Fe3763fvbmZ11dXT40lcZ8zI0qGGCOmomMNY5qssyudj8%2FGGXef5%2B5%2F%2FzhcsImbknLhDnGfnV13moqBG5Z3FB1gWFLuDVmXaxNYF3nPmqCencgeZzqsxO8cfhuNEn9WZDXeH0T9gThE5MYi8yY%2BI419XdTYRg%2FYlteJBSp2yP4mGnF7YrnpM9W8mpgcM2aqpqro5LvGgZWA1bCC1UrA6ljB6pkTJwo44gH1C%2FTyTeryxaRZOfZzQw%2B1Zk2RsziJSjbwiewCwwWmAJ8cMwo0MAX4hJtRoIMpMJBSYIApaCCloDGGYrCmqRiaSBnSjJTXpJFgDN9EqhVMohVqXrjp73o9BKEnUBZaOJlptGCygFS%2FmnqFi96ARffATjRxcsEwYZ2I1MSYBgw%2BUvtiNqpkEJYd4jMwalOaakmd4OcLqdSUawi0opwh0011tWAJFhY12Ib05Sl7wS%2BH0XJuh3bQntPbdUXJ1SfZPS%2BUdA9L%2F2oNfF5LjQOT48ZnYTnulhw3PqPCcZtDYivSSljEVp5TniEbq%2FLDTZj6ktGOLynMaberaIdlUJ8L3K7rhO42bSLYdyLP721T0UQgk09THP4nm06H2Int%2B3G3iBK19IZZmEkBTjAp%2BeJQB1w%2Fut69O9hPOgDGf4nsNfFlv2ocmBw3vuiW49bgzocJ8yxlbMAX2HE26HLc%2BGIZjtuQ48YXxHDcJIp5sUSVJYpChWXGvjokue8HHTegoUlObyNQ2VfEoZMoXfAkq0hkCrsJy2fwGZLc1ASfIZG2DdMmq0kcxR6zG7DJFKhOs2AUXmAU2gyFiS9oYbmBZgXLYdHjCLH4Ih1GbCsRPDNXQcQFb4QEfEEPI8EskW9Y6csIgfjCEUagJVfzGkwHvF6drossC1ZGBmsLZn5kYw2YJhrt%2FpyDK3vs6TR7l1TRAce2FDLMPS9AhjH%2BKqAa0EaqWO0mED9SXWm3gPiRKkrbBOJHqgdtKxk2LYsrv5YFU%2FRJnt6G5elB6s2G%2BVArwzU9Nr68D2OuDSUbxvEXaJGx0930Y4tF1aSZ%2BE9Au1DUzkBrINPOJsxTXe747cG%2B24ukSyqeaMqqyA2YoZFyA%2BY58MhEXoGVDp6LmRRtuU7Q3tvojBPRmDATPKoIbJjJv1T25pNL%2FU3Q0XzKy5QOkpTZBTbA3IjCY7AhKRnUQG0oawGmWIoDATiml9q9KPjA3XeCh0V5LM2A3Dm6RdQAhtEvGzDW8bWiBVMlPFBsGKP8Wx3i3z0ncEa%2F8TOjb3%2B4m73eUGHC80xcpexE7o3860ZfJagL4VZM5%2F420JZU4IaJ7HycrUv%2FKaoJn38cKNdEZdwfeu6jD3y%2FspJ7IS7bdsNk7V280Hcz%2Ftvj%2F179zhfq%2F%2Fz7nHJmQzm754R7bb%2FjbtI1QQMyNI5oC6ubylm6aG3g7Lr8c%2B3ACTynF5eAr7JFe5Ey960tciHQFIUWjJ%2F%2BdnHx0j%2BN0RnHN2U2TAlImwBm5gsqLNFETWDCVQoCZv7kcilerDbUCKxzgOq1AhHMLgERwTqqAtGkJi%2FtbW1Sk5e1ANMfXym0wDhhIA3UDEuCGWn8Y9hVAqPDuns1cZZ5vATM0LNUZKulxo81kaYQmmYBKVIZbFolXTFO5j4lEKnANm2patFhJmBkWs336a8T8nsnmFaTEQizKEm4YCcPaiqwdkfyapjp4O5yrg6be6gi3Zhb%2F4tK1BqqBDO%2BmgyGWSvte5ijKSQWX%2BUFI1aXYMZXdcEwG2kHNRtpEgA4cyMkFl%2BpBiO2kWbR5A5%2BmtgRUoh0codW%2BgoxI53QoVW%2BQsxIPTBa4VsybGDGcNizaSE1Ny216LoB0zUlnIHZ6sL7YIbieUE6U7PwDdMaB0Z3XulFQZzlpJvIZd5JdYZqHMjHSnkyR0nMXnwahbO3JUONT6dw1KYMNb4Ij6O2ZKjxhW0ctT063zCa5gL5B5LwxIAlKl4tLdBnEeD2gRuEJ1D4OUEIWHTiNVhCUsYhWN7tbGIuQT2ynETP099I53isy1nD1mQ5LGAKWDgYbXyeBt8hUi3lEkw8xOTii4k5uZoMNb7glqPWSyQSllUVE4svKubEkrB4tYBaQOxsKhQkihW4g52shfHSeloyaFVgwvPsQbx%2FcihShLNZ71XUQeZ4Jaw5PozFwPwbJ%2Bb8WPVc%2BTfCHrzkhdwtYVut3TwkftJoTrVsyWJSIW0YMNKeLYhl3AA%2BvRgXFOhCwPh0WwzYEALGl7WLATeEgPFF9zHgphAwvng5BtwSAsYXKseATSFgfFFyDJjEyJd5tBkHm7e8Xud6vCe5SCU%2BDpR1P9hdy7bVzxUikbt9p9fhu5rfYJ9Ye1WVSYuPvM6uG33oBCQAZvfb5cjEqhhfUB8z2U5jRXkxXhorFo0oMGhPdojk1Y%2F5CS0sHOE7RJolYPGNEQ6WjJLz3Me4F3i9zLuYeiZ0bOewrNPxDQPORzIQzsWVsyeTA5kgWBnlXa40DhfvNDVRIrpW2CRVvjKjyUnDmnbQNCgF%2BFxtToEOpQCf780pMKAU4HPGOQWN0fpQnnB9ny%2BLPcENCyYI6aUBqXy%2FuNTar%2Fi97tEtLwij9V5n08lHvSdnoSacq5MWT%2BrAxPPF4mw8yJ%2B6OLIb%2B3pumyGuQotNw1y1C4ljx%2BIofDqWzZlrBaT4dClDqpf1hSidO5t0XIUswwZvkUjY4tORbsRnUFg3GmUUSqsmRBTiMziMQsEeoakSB%2Bq0pV6skoZLLQBJyxYsO%2FqyaJ%2B1k5rDncAJL07DpBsugGiUj0dgqvyKcNUNQrdzgeGSokaqGainWdFhsHS8hHSkKoO6qF%2BJV%2FBtx4mzbboYLx6Qt2%2BuvzddzCOH7LyhvFSP3P1%2B14ncsL5P2HYt%2BTh0oM474x6oE9NHLgt%2FKO0RfBlx1iNNKWp8aXGGuiVFjS%2Fnx1CblQMfZtIkpOPLIDLSLSlqfPk6htouWYuadZiG8OCyGgdW4TsBLcxicoQRLMosujE8qdjCNyJrHJgMNb7BxFGXFnYmqLEKZYsI5cIgJPJY2O9E6P8CF2qLn4fJ%2BRulY%2BWYJ9jRm79K2f23Mf%2Fo5UcxV3hWaHW46ENDuIlgjQOTsfm4ditXnISFbHYEpCq3AAjPSatxYCWyhVWfmVLvQEeaUtS1CtnAh5vLhlblh1pjTbZnAobV9Ji2VMCQpjd0vULA8OHmAibNy%2BhI8zK6UcFufLg5uw0pu5HmgvRGBbvx4ebsbpStimWhFcITW9iqWLmFRZqc0st2Gs%2BLCD7cXESalRZ20p2NuJzhs7RMzuSGFmk6UW9VyBk%2B3FzOWhV5Huu4Uz86vniUdZlZ0WX4cPMuk2WcTKzhpFkVB%2BOze5zdslQZwtOAOburQkt86p%2Bz25axG2u8Qk%2FcFaPG6vbTI2bFqLF6z%2FRkWTFqrA4dPfNGbmgnXRKdUI7VxaAH4CzRcpnynaFHU0AWVgtmlSRELaz63ypdh57EDuOthLGTwn6sY4uWIBR6BqupsPQSzmIdu7RMosBZrObMMko4i9WL18wSzmI1uZYkYYXwqFO2e6taIg1YgwytdD9nzmB8NoYxWGpijpedQngAK6NZp1P91Wt8iMwBEyfyJB%2FwzBUhG%2FGpasbGiokShNv08qO7S%2Ffp5czGp70ZsyumSRDuL8yZrUmYjc8XZcyumHBAuL8xZ3bpBsec2fjcU8bsVqX%2BhFVvSXsMnw7lPWbAbRFsEYiUDfi0G2dDIz1llu9d1kKqG1qVc3rAQ8JGyEU6OlstuHzCjo2Q5s%2BAx6ON8A5feMh4ZxaQ4gtdGFKrgBTf1AJDWlXSDhx9wpjHgDnr4udhxuqZUhUieHQ2q3vFJAI3sktJ3L6x57YfXvcPCxt2lHyncAzIsGAinBtlp4%2BrYEVpwzZpXx7afjzHlvQOwa47cQ9dERwOEDWAolLju02enPxPsBo39kx0VS1ht0jyzg3Dm49fMi%2BAdzl3%2F1zu%2Fnl%2BT0bg0cCr05MJvchzw%2Bxu7UE4Qk6REa%2BUtBi%2FlUktuSx%2BmRFZduriVImMlHO5IxtLqV14EH4yHcqWFjLK9Nl138U%2B3SPLDer895SIu5wRZ8yOuJWO53T93Tr7NSXSriakRbly1bNcy6zQ6cf1MPTbXrxYOCQiE8bnTmcMaQAZQnz4%2FAmigRv6g6Dtrm1FR1033HPdaLrcemrf7Q3q9LLWDqfCKisjugmXgqV3pkvXhb7Tc7v1%2BDotym5nlLVmJ9%2Fnsx6bjmz%2FcqlLlewmhc%2Fd5nMadtoZ5uw6YzkvZtPpjk9lHm4DFoZyxlizG3%2FP9p1dr%2BcQ97Ke3k1rHP5mRqE9Owqf6TiRsxt4nXpyMy36flfquQJFQNLApKVAXCUgXAvJV5WrMtRY5yH00onOBDXWhD5d%2B8XGoDbDOORymZaZjhr%2BO%2BkQwJq1p2vEeLeceOQk7pZLRdU4nU75qbRTsM4h6KUlpQlqfNMJHHVThhrfrABHXXp%2BW4IaXz6eoy5ddJGgxpeb56itktO9VPn5qKl78Vy5i4twe2e21Y4qhozPs2CQNZkXCDyoV9IAbD7hq8WdXa8fXc8fBzOaVpe8Epa0lW%2BT3OByhtWEq5UbPScUYLV3agNKAVbbpzahFGC1gyqxg1elFGhs1gpffofNWtmRskjzqid8nMP4m2UnieBGWdpp9qhE1vdJbhcr1uDALXclDcCSFxDRR7gUaIHhIs7gEP71tnfg3vMITwJXNBX5JPsXxF2kXhFdugTCjy%2FzwvDrRDGmKztkgyHd9lA8mqA7L4sbgDmBbKWEbVrsMduCnUdbeAxWaFiEy4twmiqswKHwXlhII3kv7DT6C0PvRXgK7QLDVUCKdKzQg2dHkOLz%2BhlSo4AUn3fPkDaK4wNYNyQeH8ATweVlTI0kA9GAtSaBA9MzUDjH1VoaTP1A4cBa4zamZck0%2FPyvR8oKPwow%2FX72sJFLbibrsUdPxMFcPhYLfFRWyzIdXAt%2FOoGffz5NqNx3dqbNqL%2BYhrOfyK0OUwuMy2UzuTPkMnAwNWEkXjhww9DtUubc8txuR%2FBQ7XGgaMKjO1mRwT16Heeozst8fI5AmISZ8a%2F6I1V5vd4f7HS9dn2IS%2FXsFUNHFlwb98gCuVTBfCl%2B4LxtcxuljrMrQe4xWLxZPBA9KarVdZg1krUAMyAvyaMaUKggQwFdRSFDAdunXd4G7NgveRvSsAXYhrRXJMFXIsjGcd0UAyYXtZ2HH4i3RslEHbiXeeExWAgokSwDpkS%2FBojaI1s%2FPhyYggHCgU1ZPDPU2AduxwvcdjTaY9k2eOSbvbDvB1FccHrH7xSOplryel50g86ziE5xTRy4VW4gsgfoFH7ZUhZBQ4uZwNPLZqrnxXUEY2xpn7c9W8Si9PtpG18vbUOFtXI4iQWk1wlWrJRxE6aCrtAcuM8PyNy%2Bn60o0hCuUa5xYFLYWGdM6HLfF8r6iePGWjvQNOW4sVYPNC05bnwTUxy3LbUewOQDzHoAD5WXwYH5CEA4MGeYR%2F%2BaMI3yJMNTGW9gHm2xBZO30FJhLpOsBZi7sryTr5jI5oC4sZe9AOaASEZiC988GT%2BwR5Xjxpc%2F57g1OW582XSOW5fjxpdb57gNOW58mXaOuxEpT3shdaWSI9JvHnphISyQ0YbVSaS7VchwY%2FUSW%2BmWha2W%2Bha%2FGWdWMfcYLM6UGDBg9lHWwqQYUvuiTeqiZC3AvIrC9jHpHvCRDpzXlTYxTlox60QT5u7JKw7YbLqFL8JgFQdmCdkwtxJENr4AhZFtAfHjC1QY%2FtI4JR11Osx15b68qsFKTRLX3yhbejizybx0bt1gSUuEe8yyLjMyT%2F%2FGntPbFabcnhzzCrzD5y0x3jVGeSeKrGbIO3zeGONds4AUn%2F%2FFkLZGe1nkPDzJXr4SuF3XCd1tqmGDfXZiPEeJAB7EiuW2gkXV4TaJ8d8sx0%2BZvRVvs8FdOKBJk0%2FtJ%2Ft1qcAJYxYW2ND9PT49gYXo%2B24YOrtuWE9uprQQffnaGNyCOfGcWzPcGOTZB58O3OCoPvDq7O7awJsWv76RUTjDDUJWOIXs13RW3i7fzUib4XYbl8s6bzoEfrt%2F%2BP9nX8OqlfgAAA%3D%3D&javax.faces.partial.ajax=true&javax.faces.source=cargoTrckingFindButton&javax.faces.partial.execute=@all&javax.faces.partial.render=bookingNumbers billToBookingGrop billofLading_Table3 release_Information_bill release_Information_booking cargoTrackingOrderBillInformation cargoTrackingBookingOfLadingInformation cargoTrackingContainerHistory cargoTrackingContainerInfoStatus cargoTrackingContainerBillOfLadingNumber1 cargoTrackingContainerInfoByContainerNumber release_Information_booking_version release_Information_bill_version actualLoadingInfo containerInfoByBlNum containerInfoByBkgNumTable actualLoadingInfo5 documentStatus cargoTrackingAcivePictures containerNumberAll containerInfo_table3 containerInfo_table4 cargoTrackingPrintByContainer containerNumberAllByBookingNumber registerUserValidate validateCargoTracking isbillOfLadingExist isbookingNumberExist cargoTrackingContainerPictureByContainer cargoTrackingContainerHistory1 cargoTrackingOrderBillMyFocus cargoTrackingBookingMyFocus userId contaienrNoExist billChange4 bookingChange4 bookingChange3 cargoTrackingContainerHistory6 numberType containerSize containerMessage containerTab isLogin cargoTrackingBillContainer cargoTrackingBillContainer1 BillMessage BookingMessage searchSuccess searchError containerTransportationMode&cargoTrckingFindButton=cargoTrckingFindButton" );
 //       curl_setopt($ch, CURLOPT_HTTPHEADER,     array('Host: elines.coscoshipping.com','Connection: keep-alive','Origin: http://elines.coscoshipping.com',
 //           'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36',
  //          'Content-Type: application/x-www-form-urlencoded','Accept: application/xml, text/xml, */*; q=0.01','Faces-Request: partial/ajax','X-Requested-With: XMLHttpRequest',
   //         'DNT: 1','Referer: http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml','Accept-Language: en-US,en;q=0.9',
  //          'Cookie: $cookieString'));
/*
        $output=curl_exec($ch);
        if (curl_error($ch)) {
            return NULL;
        }
        curl_close($ch);
        $DOM = new DOMDocument();
        libxml_use_internal_errors(true);
        $DOM->loadHTML($output);
        $table=$DOM->getElementById('containerInfoByBlNum');
        $Header = $table->getElementsByTagName('th');
        $Detail = $table->getElementsByTagName('td');
        //#Get header name of the table
        foreach($Header as $NodeHeader) {
            $aDataTableHeaderHTML[] = trim($NodeHeader->textContent);
        }

        //#Get row data/detail table without header name as key
        $i = 0;
        $j = 0;
        foreach($Detail as $sNodeDetail) {
            $aDataTableDetailHTML[$j][] = trim($sNodeDetail->textContent);
            $i = $i + 1;
            $j = $i % count($aDataTableHeaderHTML) == 0 ? $j + 1 : $j;
        }
        //print_r($aDataTableDetailHTML); die();

        //#Get row data/detail table with header name as key and outer array index as row number
        for($i = 0; $i < count($aDataTableDetailHTML); $i++) {
            for($j = 0; $j < count($aDataTableHeaderHTML); $j++) {
                if (array_key_exists($j,$aDataTableDetailHTML[$i])) {
                    $aTempData[$i][$aDataTableHeaderHTML[$j]] = $aDataTableDetailHTML[$i][$j];
                } else{
                    break;
                }
            }
        }
        $aDataTableDetailHTML = $aTempData; unset($aTempData);
        //print_r($aDataTableDetailHTML[0]);
        if (isset($aDataTableDetailHTML[0]['Rail LFD'])) {
            echo "<hr/>";
            echo $aDataTableDetailHTML[0]['Rail LFD'];
            echo "<hr/>";
            return $aDataTableDetailHTML[0]['Rail LFD'];
        } else {
            if (isset($aDataTableDetailHTML[0]['Depot LFD'])) {
                echo "<hr/>";
                echo $aDataTableDetailHTML[0]['Depot LFD'];
                echo "<hr/>";
                return $aDataTableDetailHTML[0]['Depot LFD'];
            }
        }
        return NULL;
    }
*/
    var $hasCookie = false;
    var $cookies = array();

    public function get_lfd_and_pickup_number_from_bol($bol){
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
            //	var_dump($cookies);
            curl_close($ch);
        }
        $ch = curl_init();
        //$requestUrl = "http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml?language=en&page=null&token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw&uid=libra";
        $requestUrl = "http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml";
        curl_setopt($ch,CURLOPT_URL, $requestUrl);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($ch, CURLOPT_POST,           1 );
        curl_setopt($ch,CURLOPT_ENCODING , "gzip");
        /*  $payloadArray= array(
                      'formId' => 'mainForm',
                      'async' => 'false',
                      'global' => 'true',
                      'source' => 'j_idt49',
                      'process' => '@all'

          );
          $payload=json_encode($payloadArray);*/
          $cookieString ="number=$bol; numberType=BILLOFLADING; language=en_US; JSESSIONID=".$this->cookies['JSESSIONID']."; number=$bol; numberType=BILLOFLADING; COSCON_ACCESS_TOKEN=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw; COSCON_ACCESS_I18N=en-US; token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw";

        curl_setopt($ch, CURLOPT_POSTFIELDS,     "mainForm=mainForm&cargoTrackSearchId=BILLOFLADING&cargoTrackingPara=$bol&billRemark=&num=1&a2time=2018-04-05+23%3A30&a3time=2018-04-06+00%3A24&a5time1=&a5time2=&a7time1=&a7time2=&a9time1=&a9time2=&a10time1=&a10time2=&a11time1=&a11time2=&a12time=2018-04-28+07%3A15&a13time=2018-04-29+09%3A48&j_idt211=&cntrOrderType=&onlyFirstAndLast=false&cargoTrackingContainerInfoStatus%3A0%3AcontainerNumberFlag=0&cntrRemark=&num1=0&j_idt714=&num2=0&j_idt743=&num3=0&j_idt772=&num4=0&j_idt801=&num5=0&j_idt830=&num6=0&bkRmark=&j_idt1325=&cntrOrderType2=&onlyFirstAndLast2=false&containerNumberAll=TCNU6598472%2CTCNU6598472%2C&containerNumberAllByBookingNumber=&validateCargoTracking=false&isbillOfLadingExist=true&isbookingNumberExist=false&userId=libra&cargoTrackingRedirect=false&numberType=BILLOFLADING&containerSize=&containerTransportationMode=&bookingNumbers=0&javax.faces.ViewState=H4sIAAAAAAAAANVdW4wcV1oujz3u8dhxfEmcbOxkJ87FSTbu6arqqupyNjjjyyjDjpMh442IV2JS012eKbu7q1JVPZcgrN0HggRCAi37gBQEAgRI7AOIJx4Qu1oJEFK4REJIPC28IS4PSIiLxKXOpS7dXXXqtDOn%2BvdI7ukZ99T5zv%2F%2F57%2Bfc777L9KsF%2FjS6XvWjlUfhE63%2FrYVbN%2ByvNna333%2FB%2Bc%2B%2FOvD0syyNN91rc6y1Q5df0U6Fm77drDtdjt73tW3pOjrsLQ7J0lHoneH%2FieUjt3bcDqhLDcbA186%2B41V%2FOiu1d%2Bqv7t5z26Hb%2FzCX%2Fz4r54KXu3OSNKeF%2F3RrBd9DT6SHkQPin564Esa%2Bpu9%2Bl2rbQf1ttvz3L7dD%2BtfX7kev39xzXc92w%2F3v2bvB2u%2Bs2OFtkS%2FzkTP9aWT6bg3%2B4Ne9j%2B9UHrCCkPf2RyEdnB72wqXfHvdDiNCnE0JseT71v6qE4R73%2Fr82V%2F%2BU%2BtXDkuHVqQjgfOxjWHP7KIZz0R%2F9HI%2B3PUwAvV2RCfbX7d2bP%2BDP%2F%2BDN7%2F96We3ZqSZVelYu2sFwTtWzw6lM5hGiwjr4noEq7%2F1xqo0H0R%2F08HPCKVz5BOOu7hu%2B47VdT62Nrv2G3uet4PoNh%2Bg1xPRvJ6Lhq8Hgz4Fg1670cTqS2trqys3b%2BxFxK1PRtws4dAotVCaT4mHB55HMoCpcZgCwagk%2BgN6PUPfR9TSCiA6Pa9bv2HftQbdcJn88sUlz%2Bvu33bv2%2F1%2F%2F53XP%2Fj0rXtvnUD8270svbDoDTa7Tnuxbflb7m3fat%2BP6La449i7P%2Bpt1fe2w143ksf2jStvdvYQxxeGPnjd7YeW07f9lf5dFxF5EKQSOCSPxyKSvVpEshtWaJVRa853d1f6HXsvWWdYKFf6ob1l%2B2f%2B4dd%2B8z%2B%2B9TOtGSRcsztWd2BHwnsq%2Fdw7g96m7X%2Fy3e88e%2FyXfvhzeM38X%2FT1AD19IZRmsZgkbKhhNtQylH86kQ29jAJXGlfa8W%2FJsMtdayvl3EKBnCeC%2Bsonn%2F%2FY3x7%2Fzgcz0uwd6bGu27a676MZRWvrjnQsGGz2nDC0O3fwRJ3OqnQy%2BR3%2B3PBSoOpilZIFwaijlXfI8yaYk8yaE%2Fp2efiJzdIncj0Pc38u4UusLFK%2BnMquDvzpJwoWU5aLQ2sJfTu%2Fa0iX89fC0E%2FXnG53aFWs4VUxhyfTDpUC6Z8VPw30egFheSWf8m9HKtj199UrxK405EYR1milNotWaqRpsw8tW7RHI%2B0crpB19QKaBO%2FMohW5G8HcTn%2BU5Ya3N8n8mixevINe1iah8%2B0EyhGdIqlRrk%2BX6VcRlMeS1bQeGdYEwpHk3UwByFrE7deKuL3S9walZowooWGtfM11u7bV%2F2zB%2F%2BbffPrf%2Fxpp5TuxVvYOYZ3bD0c0G55R9M%2BXvlIE591ByIlnYO%2F40pEd1%2BlI6Vdk5jHB8NwHxMpn1NJGiJyBJpWfpiILkx%2BVyg97fG3K45vCx3%2B11EZgLEqzUFVVD0UXDuUSFxSllQx9dGRBo3dnQ%2BmEb0fukm%2F7t%2Fc9bPU%2F5tVHofRSgXO5civyf6%2Bv3N5YW3rn5upEKut3s%2Bb2o0P4bweRhSCTKRFGVYVCdrOI7OjNb01EZkyVh6Ihev29YQqaoXQqoeCtKKKwtuzp2SXqU31VUjh8qoTWQ47VnXIVpRrCpeKh3NhJzC9646IXH71gAPg%2Fd7Eooc9GKE7HPo2Bpy43GuCksEaB5YCVoYKVc8AqUMEqaZRRFGNj7%2Fp59PISiknw1FoZ8h%2BAOCa%2FGExgNDVmWFSh9lbhrZujBBf3DOAtJjIDmXsG8FYYmYHCPQMV6AxU7hk0gc6gOYFSaUFRKhpQYmqh9CIzV4LhG0A1ihFplJoTrLpbTh9AgoVTFnSYxFR1PlkAqpsNpSQSaIpP1nAKgAGTgqrBJwBATZuh8sEHateMZpn8ik%2F20XpyQyvKYA1HD8%2BMlT0SigPQxmxiwslc6uLzViTMM9WiSQ%2Bz9UIO4UjJRG7C82NqFNgEBBfP%2B%2BObaDFsW%2F0tm1liqmgpsDgKzxuhHNXZuOEZUYrbGGI%2FsxYAgP2FJYJpk7Es3a%2BJV5ssusHL8VO6mWV0E58Qf9q3u7YV2BtoeL9nhY7b30BLAsBaOItwuHdXrU5kIzZuY5ayEp3EKlYDELdmPDvEvGv717rvDHox88TzjiHzGrzMaI0CY%2BOGl72guGV%2Bp8UQ7%2F2zSAgv6KckVNi44cWqFLfKxg0vSKW4oyj12RwVGiuohviM6%2FNDK%2BZdv2P7KPTM2BoAZuZ8cWjMTEMBMDKa%2BDwZLTtmSm0HXXZkTlC8Kj0dB9xkSLMprLo5KxsT5hta4vn7OOGvSaZvwEsakIybViIn4vMEI4SCF4sTQunxkjUyHbMHvWRHaAEvvie0MHJWt7CGv1m1mS8p8MJ2Qp0W2z2Qxavel8tLAGGrJazxO9XHfECE%2BUup6LB0XAXJ59HVkgkjD5z2cf%2F%2F2aSQEbf6i1PmKceZhBYfuo8RWvzuhpc49lmYQM2%2FqXHiB2qVTZ0TP1BLahqc%2BIHaOrMVLzm9RQ2c3hLnCSRaJi7SmnxFWi4zZAqMT2KdfGq4jdaEl0EnbDV5aSZum0esXi%2BgjWNWd9XFvhQyKkYcm4hzHBJ7Mm5ExXkLfN6KwRG6xltb5jadPqJa0b7pIiyBL71esLPF7tZvW1t4M9rNPc%2B3g8Bx%2BxL5OnQCb4V%2FmuxLiz458rHd%2BW9%2B44ff%2B99fnMEfO5t8LP3Eb%2Fz0z67%2F253Pv4r3HUconnf9rbrlWe1tO%2Bd5Kz2v%2B8lrncf%2F%2Fsif%2FNEJsrHt8Pd2f0R67YWfTIV36Va930HScyNUFq4uXIpIfGnhysIlxOFLP5Xd%2Bkw2AHve3u49aXuiPa4LbzVb6ustbQHvxXzzIv%2F4FzG%2FT3bc9qBn90Pm1vBKS0Tjci%2FMeUvVI1Pu%2BcKmw384qayjP%2Fpj%2FPqD3avSV8Z4d8MJ2tsTCM99yZlUeMzG6y29UHiKAVzMZhILdw8M28Iz6dPXbctvb690Djyd4ZXxki8Q%2BWK8LNYDqkA9YBrleiBn%2FIuZ6CV1pUxxYWJia57I4xOUavDVTOeWUWTth%2BV7jIYC0xzyUNSZGVOcY8LhFolzZNMyKWN08Tt%2Fx40Tj1P0BQk%2B3%2B6H%2Fnt2z%2FLvC6zY5Jb1bu0vR%2F4BBLeApdRbfI6xMAPNrdUnN9Bao8lhoAvVOpNq4nNitGzRVIXJ7ekhyq1ZviXEpfjyKB3vb6WEVBvi1d6T%2BAgPK7SvZ%2BcrZK4F2yho%2BK3Q9KbAYDTJtZRQXby6n8VdF6W0RefxXC46EuV9x959z3VLD0U5is9asYP4TCx8NNsq%2Ft2D%2Fzz94aeN%2F%2FrnGenIijS3bQXbbbdjr6LTbQaRadhHT3hsVZpD2mZgbdn059qO5TtWP8Q%2FksO0Qmnm6%2BvRSwRNklCsfmR%2F%2FAigf5pACsSFZlwpCVN8NZ05fAVtYWP%2BTux6aBV0%2BzAnL75Az1YAxedjHRgAvlUgzgdMHf0SUogrNk1ICnErQuejhPhFwViS8jQCoHR08RbxS2OjE86rQMtEaouBGWgNRDXLhFwRL2an49QerbdU0LZHmmx0vYGH1IAWTjVjDClQ2ddaOWysqqsuIQ7QRaaZTFWqiPctRpqUXRd9A5FwuVBiZxTx3kacaDPjQeVGBdVP1pzF%2BxU0W5I54uGgsyVFljBzfCOoRdpsMDDD21dEMMu50ltBDbOQUvC2DxFKKQzM8LYOEcxqwl2tmVQexDVVljreTXh7lQihmkl5uDBRMFw%2BK5wh0A5GdOhBIWagXYtoW38hZqAON9rSn7PkxPsgw46sDtRG6o1xL7%2BCvvIcjoj3kMbmKb6E9UxBvVluwVNLNQoMHTbfD31cxUVHS0%2FgTx5Hb%2FL8ycmijt1k%2Bg9Z8B32W4uZAE%2FPUiboLNTwNC1FbbBQw0tzUNQtFmp4%2BQeK2hztuhjNqXN5TYyQVRWfJXwh96wRksrY2LH9YOr7wS%2FkZxNk8W07LM6IT9TPxc4LlxSdjNNP0z6WfpRlGf9Crz7pLbC5q9S%2FMOH5mzUKLJc74kW6mFTwUkGUVDILNby0DEWt5KwEceUfrZS98HJBlFBqRKgx1KxMbeUdzAwjVMGdPazRq6shyLGSaoir6qRNa3M7%2BFKfoMhaTedcs3GFbYhnfw4DxLXEJ0WcnKlORdbEnS0wutE%2BO1XxSZgnnIB6%2BOQ%2BnZt7Ubhy4CUr1IOYd5JifJiFqgpj6mE60afGtBceG57Zxm2qSiFgeOYTA1YLAcMraWDAzULA8FKBGLBWCBhe2gwD1gsBw8uYYcBGIWB4yTIMuBVK52jSCeeclp1%2B59ogDAvTNIcf%2BNIS2gvt%2BU7PHm1vj971rH5nEz%2Bhfp38RJ5X1u9%2BbNfpbNnh%2B5YfSs%2BS9xv5yIpVMbzcHiaymaRfCncmDadfxr0Hgbk7fSjZkexly7YoQKEmvVjNyAELb31RsNEKO0H9ozXf6Yel%2FlB1WbU8psNbQpSO0SI6jrcgQkhJXs1bMJn9B7BoJzdiBaTI4u4WZB%2FTolEaQU3NyTLvDOD5%2B3QGCu8M4AUAdAYq7wzgRQR0Bs3RjTG0kPIuPYERzLnIF4ou5UkC6sJrhw4udXDK7Xf3lx0%2FCJf6nVVrorQBrM6E0k3BSgXlqjPjnVxc7uaZkRuRlzJ3Qxy0lRjHyOcSPx470CRehWdGSPOVPIYUnrkgSJU8XhRVdaaTpC5ZUOL10ziB%2BE75GxEBePaWiICaN8OiFjrmDOHZYzLDglv8EhtXgVKe72OdOmHf3WRKlT1H8SWAhaIrhmD0%2FFzNLycnhxELpw9bkVVQeTtfuG8fYDhzlOBiogaqUlEEU8Js8bVHBtmA6mkUNn0JH5iygTPKG%2BjsE6xE3r65dONgMT%2BcGsHfzu%2B%2BIj23GNo9r2uFdrDYi4h8Of6RnNAkSYfaN668ubUXz694WkxGwasgEUZpUdAWNzSQ6qcKZin6Q7F4BIxJYXglL0JhfZzCYFbtKIWbTArDqx8QChulOlq8xzTKYjDrfZTFGpPF8KouhMUtJmp4NQ6C2sw5YCkVTFmBh7tGgZWEIBU4Pcfw%2BO2wsM9u5LL0gk7E7M0gsIis5%2B7FiVHDW4gUde5enBg1VIHWI4E%2BOggiWRZzInVhLFrBEWbFY4tfpK%2FkKomR7PNy1zrQgyy9TJ077oyUAV5oVqPAWCwS75gUm81MszQUkh0luNhmU4WHu0aB5cglVEVuMF0qBWg9RpFLZAMebiobclmQ0qpq%2B1tGOKHaa8NkCifQFKeilAgnPNxUOJm5WQVMQmiE3GoJueHhpuRmJrIUMNmhEXI3S8gNDzcldzPvTBwSyzbhmWdyJg7bOoPJLo2ISN6Vz1kRgYebiohWap35mhNE3SvEfUVUT7rPcwMFaWKLL6FQm%2FoXuGKscG3B8y7I2mI7F0DrCIpesrbg4aZrSy9JJramWS5X4OUNCLuNEnbDw03ZzUprGlBDd6Ms5wDPT6DkZuVjDajRsFEWxsMzHZTcJovcUOM7Q2GhhhomGSoLNdRow2iyUEN1gA2tzEhP4%2FifmGpQXRsjcm3mUVuk4Mv7RvN2LahmtJWTAW9BNUKt3MOb4oCvsmxsfGidDLBHjG6C0nK4CtXWtZQcykJVIKg5bIyyUO1xS82hLNQwRDZyKAvVZ2gxMpQaPF1P7ldp5EgD1ChJzr0lihIYnn0iBGaap2ncBEbpBU%2FzE3opqB%2BlfLNxJK%2FiMk6cd5sqnNevC7vRmDuf3Je6D5FP1lSOS40nTihr8CwjkbySQiTA23dqFBiD2PCMJSF2SRkS4LVBlNgyg9jwXH9C7JKCHsCbhyixc68eosSGFw0QYuulVoOvo1NUETLnFvqDLELqjfIiZA6Ei%2FkXGWelFJ7doFKq8rsswja1Mi7iztIQnjmgNGzGm9fjw6x1oMpUL20yMPnagYV5hdwL%2FOG8Qt3g8AoLV%2FgIk4EqcV3nX9LCrmpNDxBm5vRN8TnOEabByxYRphljSOFlMgjS1hhSeKVSgrRsDxmnshOyNUYVlgDgGFv8tpwnc60MqxRV%2BVFAxeQRLxZnE%2FJsXN%2B22%2FevuXsHf4qilz%2FQwd%2F9642pWYBdNkcJLm7baIq74DA%2BHvfk0BV6k%2FAFxEl1F0bv0DtfcO1n2KxgSdXo9veCgY6lOuYBel2IfJQdqzuwvWpUDj4wCMcLYaa9fg5hRHv3UQl%2FKQjctoNP8wgieQ1CKxwEuYoqPrMSnuGlxY7cHiW6sprifb5iQZzu4NPoYKGyAnCrJd3p32ChhppKVXJLYzFqqDlJJbcLL0YNNUel5HbhxaihZoXQZiVy4EnmPLQZJthQ%2BjI%2B2qlO7kDw7cAd%2BG27vh7ud%2B1g27bD4ZmMY4tnEmmEvtWzk59qXWfTt%2Fz9kcnN4gfM5k%2FusUby5%2FPpzQyZ%2F68n%2F%2F9kj5ygHizGb%2BrtICD0QJ98mamZ4CXLKAe1hIMqJwfRZF%2FjZVKWhpjeD8Ud9F7L5cpT9z4a2P7%2B4sBZJO8uD5xhvtxg8gVefovyRU%2F40uReWefzV1bbdzzuVSWaYacow8i3%2Br0Mp36CySl4SS3KKSPhlDbBCtqEwpBzeSsoy5Z9JlvgZfAoW1oJW%2FRHkS0n2q5vL6KXIWZ820umZTyK0zpF7jhapFcdZaf26%2BnUWo%2Fi1J7Zj5bQIHS6TuhEXkLybmiSv%2B%2FlXKPdMAXWKOJOKUpaEy5pQ%2Bl4xoDl0vjoveDuED3%2FLPrl0%2FlROMB7Zch5dY1iyPBCQQJZZoX8md7Z6vMNmvg8%2F%2FPj9zxc27%2BWvbvzwLPN%2BIU9b%2FHZRvadMk26yKBG1I3SW3HiGUCNrhtN3hlAjS4bGu8MoMZhjSQOyyQXwVnOjwqdkjMeujzP9hfp96zxPGkkbkEmB%2FkITe5Ux7G67tYi%2BTY0teXov19iSp5MinjwygukiGcmrOHNrH0EKS%2FzWM%2FuDxbRy1A25uSHqcg9kvmmxz2rb3cX8evwzNx0ZrwZG1CL6UTKsexCepBO65FMb5zMMiw7sZ9Hpx%2BjkiSo60Wv4utFKcEnSVyAWSFPedaW07ciFbuYvBteKb%2BdVImbeTmM6dN9kswKGLo%2F2bFCa8t3Oovxm2Gqfz%2Bd3yOZXjmXJ1fZBf1XqVgx0ylV9kEoCuB8SzGtnxiXpSyl%2F5EZmVZwORhjcPHtBzxuJcCjI44SXKH0zBD%2BpbazY685ET19u6ivqMplw0VdoGkydNQFF354vRMEvxK5RCQlrTX5LjQsXolVXM9WPLj4rCDZlW8aLTKkmRFKYTn8sTEr2K40TmTaW641xHWPFhK5gs0cjAkXrYkD3MlBOzzpkdBgzMjo%2FUaNMahgdPIoVHkMKhj1OwpViXvMY4k3wVB12FKY8hhSMEQdQTpOU3gVC4JUHUMKrzJBkDbHNXMFWwmKFbMszPZm7uApL2OEcqNZgRfAoIP4O3l56TBVz0QW5iZMTIcKHBbqsuutIqcXuey1%2B6F0atfpbNnhRvL59I%2FVTHb3wM9VdPvd%2FWXHD8KlfmfVCsJHdxeQ51EVGOZVL6YRNc99hjOXJ5IehdvW5nTD%2BL9kr01FfNRAOJSXeZsihzgVhibejkbecBDYXcSUZcfudooW%2BQNfkl1%2Fq542xtfbbs9z%2B3Y%2FrJOCyhp6fXHNdz3bD%2Fe%2FZu8HEv06I0mYYLVIxRC1877lh9I5qoJGIIhnBP52frchvZx%2FpEIKaOhG6jsllkYRHxIST6tlmtTTagjLr44mGjJjCkurpub8QkGPMTolVrx%2FxxpdvFf1HDtryJWKY81AvD%2FEngHf7bLsZxQpxkmewfKQeJ9RJA1lidFYZajihZkxuHhZrm3ef6%2BCc7pT5STu9tfUxx4bU1yCWS%2FXSKp4H%2BoSRx0jNBVhZEhtEYsO4q0vJx2EdeOm9vHJISTv2R3Ht9vhga8y5KumF%2FlEw%2FUDz%2FVDvGX%2FltuxhS3reafvhNdRW7Vd8Lw4jj1Nncj0D1DNOu8UnIIHZQ5KQC8vJ1wpLpxPcAtz1uO8HPmRnpc847XcZzT4noL93ooOjsmjJp%2FxPI96qty7q3i1btxODyOSAR6%2FWaPAmLCh9iajkywv5PGJ4oa6Y1Iz2LihbinUWmzc8FqJKW6TaUTFpawnNKKqwMBWLncmxKWsJ6WDuB4mfThlLLMLBhXlClk8ER%2B4jo9u0NH1hvgWFtbo4ntYTm5md7Gl7V8H6UuyZih%2BDxtDX%2BtgmitG9LXeYOOG1xNAccts3PA6BChuhY0bXr8Axa2yccPrHqC4m6F01gmQw%2F0udbhv7kUmUIz6YRAIajyCjrBm4YYakOjJPVu63rhC3whLVY1WKzJjCksLcVUrBJbwOKoVmvicGMOky%2BKb%2F1mji%2B%2F%2BHzu9P7njOlQqaIhlDl9VLTJdaYbAdqc4ZGN31JOO7xa8XAfpqDdyaCYuztQnIRm8NAshWYsTP7x0C8Gfm21JVJQiPqakwX1D5tvCEecC1LxtgVPJClzYS0%2FbNlVScgN4Xydht5qG0de3rf5WYdGhOuKN0Q5eJEBo1xylHTPlMR3awQsSCO20MaTwwgKCVB%2FlMtNLq4jL5327a1uBvYG0s9%2FD5c0NihIAPB4LmLndEhTDzUYovZqPHxF7HZ%2F5Tn1WcebwMFejdnxPSqOKrjpeKMKb7fb%2BHyPbhyTINwEA&javax.faces.partial.ajax=true&javax.faces.source=cargoTrckingFindButton&javax.faces.partial.execute=@all&javax.faces.partial.render=bookingNumbers billToBookingGrop billofLading_Table3 release_Information_bill release_Information_booking cargoTrackingOrderBillInformation cargoTrackingBookingOfLadingInformation cargoTrackingContainerHistory cargoTrackingContainerInfoStatus cargoTrackingContainerBillOfLadingNumber1 cargoTrackingContainerInfoByContainerNumber release_Information_booking_version release_Information_bill_version actualLoadingInfo containerInfoByBlNum containerInfoByBkgNumTable actualLoadingInfo5 documentStatus cargoTrackingAcivePictures containerNumberAll containerInfo_table3 containerInfo_table4 cargoTrackingPrintByContainer containerNumberAllByBookingNumber registerUserValidate validateCargoTracking isbillOfLadingExist isbookingNumberExist cargoTrackingContainerPictureByContainer cargoTrackingContainerHistory1 cargoTrackingOrderBillMyFocus cargoTrackingBookingMyFocus userId contaienrNoExist billChange4 bookingChange4 bookingChange3 cargoTrackingContainerHistory6 numberType containerSize containerMessage containerTab isLogin cargoTrackingBillContainer cargoTrackingBillContainer1 BillMessage BookingMessage searchSuccess searchError containerTransportationMode&cargoTrckingFindButton=cargoTrckingFindButton" );
        curl_setopt($ch, CURLOPT_HTTPHEADER,     array(
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

        $output=curl_exec($ch);
        if (curl_error($ch)) {
            return NULL;
        }
        curl_close($ch);
        //echo $output;
         $DOM = new DOMDocument();
         libxml_use_internal_errors(true);
         $DOM->loadHTML($output);
         $table=$DOM->getElementById('containerInfoByBlNum');
         $Header = $table->getElementsByTagName('th');
         $Detail = $table->getElementsByTagName('td');
         //#Get header name of the table
         foreach($Header as $NodeHeader) {
             $aDataTableHeaderHTML[] = trim($NodeHeader->textContent);
         }
    /*    echo "<hr/>aDataTableHeaderHTML<hr/>";
        print_r($aDataTableHeaderHTML);
         echo "<hr/>";
    */     //#Get row data/detail table without header name as key
         $i = 0;
         $j = 0;
         foreach($Detail as $sNodeDetail) {
             $aDataTableDetailHTML[$j][] = trim($sNodeDetail->textContent);
             $i = $i + 1;
             $j = $i % count($aDataTableHeaderHTML) == 0 ? $j + 1 : $j;
         }
         //print_r($aDataTableDetailHTML); die();
       // print_r($aDataTableDetailHTML);
         //#Get row data/detail table with header name as key and outer array index as row number
         for($i = 0; $i < count($aDataTableDetailHTML); $i++) {
             for($j = 0; $j < count($aDataTableHeaderHTML); $j++) {
                 if (array_key_exists($j,$aDataTableDetailHTML[$i])) {
                     $aTempData[$i][$aDataTableHeaderHTML[$j]] = $aDataTableDetailHTML[$i][$j];
                 } else{
                     break;
                 }
             }
         }
         $aDataTableDetailHTML = $aTempData; unset($aTempData);
       /* echo "<hr/>aDataTableDetailHTML[0]<hr/>";
        print_r($aDataTableDetailHTML[0]);
        echo "<hr/>";*/
        $return = array('lfd' => NULL, 'pickup_number' => NULL);
         if (array_key_exists('Rail LFD',$aDataTableDetailHTML[0]) && isset($aDataTableDetailHTML[0]['Rail LFD'])) {
       /*      echo "lfd<hr/>";
             echo $aDataTableDetailHTML[0]['Rail LFD'];
             echo "<hr/>";
        */     $return['lfd'] = $aDataTableDetailHTML[0]['Rail LFD'];
         } elseif (array_key_exists('Depot LFD',$aDataTableDetailHTML[0]) && isset($aDataTableDetailHTML[0]['Depot LFD'])) {
     /*        echo "lfd<hr/>";
             echo $aDataTableDetailHTML[0]['Depot LFD'];
             echo "<hr/>";
       */      $return['lfd'] = $aDataTableDetailHTML[0]['Depot LFD'];
         } else{
             $return['lfd'] =false;
         }
        if (array_key_exists('Pickup#',$aDataTableDetailHTML[0]) && isset($aDataTableDetailHTML[0]['Pickup#'])) {
      /*      echo "Pickup#<hr/>";
            echo $aDataTableDetailHTML[0]['Pickup#'];
            echo "<hr/>";
      */      $return['pickup_number'] = $aDataTableDetailHTML[0]['Pickup#'];
        } else {
            $return['pickup_number']=false;
        }
        unset($aDataTableDetailHTML);
        unset($aDataTableHeaderHTML);
        return $return;
    }

}