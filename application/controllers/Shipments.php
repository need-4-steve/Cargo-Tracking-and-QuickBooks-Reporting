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
        //redirect('shipments/getcurrent');
        $data['title'] = "Active Shipments";
        $this->load->view('templates/header', $data);
        $this->load->view('shipments/index', $data);
        $this->load->view('templates/footer');
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
        $allContainersString='';
        $starttime = microtime(true);
        $processComplete = false;
        if (is_cli()) {
            echo "[STARTING CLIENT PROCESS FROM CMD LINE]...";
        } else {
            // Check login
            if (!$this->session->userdata('logged_in')) {
                redirect('users/login');
            }
        }
        if (is_cli()) {
            $dataRows = array();
            set_time_limit(4000);
            $hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
            $username = 'cargodata.libra';
            $password = 'Libra123$$';
            $inbox = imap_open($hostname, $username, $password) or die('Cannot connect to Gmail: ' . imap_last_error());
            $subjpass = 'COSCO SHIPPING Lines report, Daily B/L Report';
            $failSafe = true;
            if ($inbox !== false) {
                $numMsg = imap_num_msg($inbox);
                $emails = imap_search($inbox, 'ALL', SE_UID);
                if (!$emails) {
                    echo "NO NEW DATA". PHP_EOL;
                    $failSafe = false;
                }
                if ($failSafe) {
                    rsort($emails);
                    $reportEmailFound = false;
                    foreach ($emails as $email_number) {
                        echo "[CHECKING EMAILS]". PHP_EOL;    
                        if ($reportEmailFound) {
                            break;
                        }
                        $msgno = imap_msgno($inbox, $email_number);
                        $header = imap_headerinfo($inbox, $msgno);
                        if ($header === false) {
                            echo "email header parsing error. line 68 Shipments.php -sv";
                        }
                        $msgBody = imap_body($inbox, $msgno);
                        $overview = imap_fetch_overview($inbox, $msgno, 0) or die("can't fetch overview: " . imap_last_error());
                        if (!$overview) {
                            echo "overview failed...container line 73<br/>";
                            $failSafe = false;
                        }
                        if ($failSafe) {
                            $pos = strpos($overview[0]->subject, 'COSCO SHIPPING Lines report, Daily B/L Report');
                            $pos2 = strpos($overview[0]->from, 'coscon@coscon.com');
                            if ($pos !== false && $pos2 !== false) {
                                echo "[DAILY_REPORT_EMAIL_FOUND]". PHP_EOL;
                                $reportEmailFound = true;
                                $structure = imap_fetchstructure($inbox, $msgno);
                                $attachments = array();
                                if (isset($structure->parts) && count($structure->parts)) {
                                    for ($i = 0; $i < count($structure->parts); $i++) {
                                        $attachments[$i] = array('is_attachment' => false, 'filename' => '', 'name' => '', 'attachment' => '');
                                        if ($structure->parts[$i]->ifdparameters) {
                                            foreach ($structure->parts[$i]->dparameters as $object) {
                                                if (strtolower($object->attribute) == 'filename') {
                                                    $attachments[$i]['is_attachment'] = true;
                                                    $attachments[$i]['filename'] = $object->value;
                                                }
                                            }
                                        }
                                        if ($structure->parts[$i]->ifparameters) {
                                            foreach ($structure->parts[$i]->parameters as $object) {
                                                if (strtolower($object->attribute) == 'name') {
                                                    $attachments[$i]['is_attachment'] = true;
                                                    $attachments[$i]['name'] = $object->value;
                                                }
                                            }
                                        }
                                        if ($attachments[$i]['is_attachment']) {
                                            $attachments[$i]['attachment'] = imap_fetchbody($inbox, $msgno, $i + 1);
                                            if ($structure->parts[$i]->encoding == 3) {
                                                $attachments[$i]['attachment'] = base64_decode($attachments[$i]['attachment']);
                                            } elseif ($structure->parts[$i]->encoding == 4) {
                                                $attachments[$i]['attachment'] = quoted_printable_decode($attachments[$i]['attachment']);
                                            }
                                        }
                                    }
                                }
                                foreach ($attachments as $attachment) {
                                    if ($attachment['is_attachment'] == 1) {
                                        $filename = $attachment['name'];
                                        if (empty($filename)) {
                                            $filename = $attachment['filename'];
                                        }
                                        if (empty($filename)) {
                                            $filename = time() . ".dat";
                                        }
                                        $fp = fopen("./" . $msgno . "-" . $filename, "w+");
                                        fwrite($fp, $attachment['attachment']);
                                        fclose($fp);
                                        $row = 1;
                                        if (($handle = fopen("./" . $msgno . "-" . $filename, "r")) !== false) {
                                            while (($recordData = fgetcsv($handle, 1000, ";")) !== false) {
                                                $num = count($recordData);
                                                $dataRows[$row - 1] = array();
                                                for ($c = 0; $c < $num; $c++) {
                                                    $dataRows[$row - 1][$c] = $recordData[$c];
                                                }
                                                $row++;
                                            }
                                            fclose($handle);
                                            unlink("./" . $msgno . "-" . $filename);
                                        }
                                    }
                                }
                                $setflagSEENresult = imap_setflag_full($inbox, $email_number, "\\Seen", ST_UID);
                                if ($setflagSEENresult === false) {
                                    echo "error occurred while setting UNSEEN flag to SEEN. line 142 Shipments.php -sv<br/>";
                                }
                            } else {
                                echo "[NOT_REPORT_EMAIL]". PHP_EOL;
                                $setflagUNSEENresult = imap_clearflag_full($inbox, $email_number,"\\Seen", ST_UID);
                                if ($setflagUNSEENresult === false) {
                                    echo "error occurred while setting UNSEEN flag. line 148 Shipments.php -sv<br/>";
                                }
                            }
                        }
                    }
                }
                imap_close($inbox, CL_EXPUNGE);
            }
            $columnNames = array("bill_of_lading", "container_number", "vendor_name", "discharge_port", "destination_city",
                "destination_state", "destination_country", "eta", "eta-timezone", "customs-clearance-datetime",
                "customs-clearance-timezone", "customs_status", "bl_status", "latest_event", "latest_event_timestamp",
                "latest_event_timestamp-timezone", "latest_event_location", "container_size");
            $data['newContainers'] = array();
            // $unassignedContainerCount = 0;
            /*[START OF LOADING CSV DATA INTO data ARRAY]*/
            if ($num = count($dataRows) > 0) {
                $this->ShipmentsModel->mark_everything_inactive();
                /*   echo "[START]". PHP_EOL;
                echo "[num]->".$num.PHP_EOL;*/
                $start = 1;
                /*  echo "dataRows[0][0]=>".$dataRows[0][0].PHP_EOL;*/
                if (strpos($dataRows[0][0], 'sep=') !== false) {
                    $start = 2;
                }

                /*  foreach ($dataRows as $key=>$value){
                echo $key.'=>';
                print_r($value);
                if ($key > 2) {break;}
                }
                echo 'start=>'.$start;
                return;*/
                for ($c = $start; $c < count($dataRows); $c++) {
                    echo "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[+++START_CONTAINER_PROCESSING+++]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]".PHP_EOL;
                    echo "[c]->" . $c . PHP_EOL;
                    $valueCount = count($dataRows[$c]);
                    $dataRow_bol = trim(substr($dataRows[$c][0], 2, 10));
                    echo "[dataRow_bol]->" . $dataRow_bol . PHP_EOL;
                    $dataRow_CN = $dataRows[$c][1];
                    if ($dataRow_CN === 'Unassigned') {
                        $dataRow_CN = "Unassigned [" . $dataRow_bol . "]";
                    } else {
                        $lengthOfCN = strpos($dataRow_CN, '-');
                        $tempCNval = substr($dataRow_CN, 0, (($lengthOfCN > 4) ? $lengthOfCN : strlen($dataRow_CN)));
                        $dataRow_CN = $tempCNval;
                        $allContainersString.=$dataRow_CN.'+';
                    }
                    echo "[dataRow_CN]->" . $dataRow_CN . PHP_EOL;
                    $data['newContainers'][$c - 1]['bill_of_lading'] = $dataRow_bol;
                    $data['newContainers'][$c - 1]['container_number'] = $dataRow_CN;
                    $data['newContainers'][$c - 1]['latest_event'] = $dataRows[$c][13];
                    echo "[bill_of_lading]->" . $dataRow_bol . PHP_EOL;
                    echo "[container_number]->" . $dataRow_CN . PHP_EOL;
                    $containerDataExists = $this->ShipmentsModel->record_exists($dataRow_CN);
                    //first, check if the container_number is already in our database, if it is, just grab the latest_event data
                    echo "[containerDataExists?]->" . $containerDataExists . PHP_EOL;
                    if ($containerDataExists) {
                        echo "[YES EXISTS]->" . $dataRows[$c][1] . PHP_EOL;
                        $updateValues = $this->ShipmentsModel->get_fields_to_update('container_number, latest_event_time_and_date, eta, status, qb_ws, qb_rt', array('container_number' => $dataRow_CN));
                        $etaDataRowResult = new DateTime();
                        $statusValue = -1;
                        $etaDataRowString = $dataRows[$c][7]; //05/23/2018 10:28 (Actual)
                        $latestContainerEventTimestamp = $dataRows[$c][14];
                        if (!is_null($latestContainerEventTimestamp) && strlen($latestContainerEventTimestamp) >= 15) {
                            $latestContainerEventTimestamp = trim(substr($latestContainerEventTimestamp, 0, strpos($latestContainerEventTimestamp, '(')));
                            $updateValues['latest_event_time_and_date'] = DateTime::createFromFormat('m/d/Y G:i', $latestContainerEventTimestamp);
                            if ($updateValues['latest_event_time_and_date'] < new DateTime('2017-01-01 12:00')) {
                                $updateValues['latest_event_time_and_date'] = null;
                            }

                            if (!is_null($updateValues['latest_event_time_and_date'])) {
                                $updateValues['latest_event_time_and_date'] = $updateValues['latest_event_time_and_date']->format("Y-m-d\TH:i:s");
                            }
                        } else {
                            $updateValues['latest_event_time_and_date'] = null;
                        }
                        echo "[etaDataRowString] => ". $etaDataRowString . PHP_EOL;
                        if (!is_null($etaDataRowString) && !empty($etaDataRowString) && strlen($etaDataRowString) > 11) {
/*                            if (!is_null($etaDataRowString) && strlen($etaDataRowString) >= 15) {*/
                            $etaDataRowString = trim(substr($etaDataRowString, 0, strpos($etaDataRowString, '(')));
                            $etaDataRowDate = DateTime::createFromFormat('m/d/Y G:i', $etaDataRowString);
                            echo "[ETA DATA ROW STRING]->" . $etaDataRowString . PHP_EOL;
                            if ($etaDataRowDate < new DateTime('2017-01-01 12:00')) {
                                $etaDataRowDate = null;
                            }
                            $etaDataRowDate->setTime(5, 00);
                            $nowTime = new DateTime('now'); //now
                            $nowTime->setTime(5, 00);
                            echo "[ETA DATA ROW DATE]->" . $etaDataRowDate->format('m-d-Y G:i') . PHP_EOL;
                            $diff = $nowTime->diff($etaDataRowDate); //date_diff($nowTime, $etaStrToTime);
                            echo "[NOW DATE]->" . $nowTime->format('m-d-Y G:i') . PHP_EOL;
                            echo "[DIFF]->" . $diff->days . " days." . PHP_EOL;
                            $updateValues['eta'] = $etaDataRowDate->format('Y-m-d');
                            echo "[updateValues{eta} VALUE]->" . $etaDataRowDate->format('Y-m-d') . PHP_EOL;
                            if (intVal($diff->invert) === 0) {
                                if ($diff->days > 7) {
                                    $updateValues['status'] = 2;
                                } else if ($diff->days > 3) {
                                    $updateValues['status'] = 1;
                                } else {
                                    $updateValues['status'] = 0;
                                }

                            } else {
                                //maybe change logic for dates passed
                                $updateValues['status'] = 0;
                            }
                            if (!is_null($updateValues['qb_rt']) && !is_null($updateValues['qb_ws']) && $updateValues['qb_rt'] === true && $updateValues['qb_ws'] === true) {
                                $updateValues['status'] = 3;
                            }
                        } else {
                            //null eta
                            $updateValues['eta'] = new DateTime('now');
                            //date_add($updateValues['eta'], date_interval_create_from_date_string('50 years'));
                            $updateValues['eta']->add(new DateInterval('P1Y'));
                            $updateValues['eta'] = $updateValues['eta']->format('Y-m-d');
                            $updateValues['status'] = 3;
                        }
                        echo "[STATUS]->" . $updateValues['status'] . PHP_EOL;
                        $booleanValues = $this->ShipmentsModel->get_fields_to_update('freight,isf_required,customs,po_boolean,qb_rt,qb_ws,requires_payment,do,is_complete,is_active', array('container_number' => $updateValues['container_number']));
                        $allTrue = true;
                        foreach ($booleanValues as $boolKey => $boolValue) {
                            if (strpos($boolKey, 'is_complete') === false && strpos($boolKey, 'is_active') === false) {
                                if (!$boolValue) {
                                    $allTrue = false;
                                    break;
                                }
                            }
                        }
                        $updateValues['is_complete'] = (strpos($data['newContainers'][$c - 1]['latest_event'], 'Empty Container Returned') !== false ? true : $allTrue);
                        echo "[is_complete]-> " . (int) $updateValues['is_complete'] . PHP_EOL;
                        $updateValues['is_active'] = (strpos($data['newContainers'][$c - 1]['latest_event'], 'Empty Container Returned') !== false ? true : false);
                        echo "[is_active]-> " . (int) $updateValues['is_active'] . PHP_EOL;
                        if ($allTrue) {
                            $updateValues['is_complete'] = true;
                            $updateValues['status'] = 3;
                        }
                        echo "{[data['newContainers'][$c - 1]}->update_record " . PHP_EOL;
                        print_r($updateValues);
                        $this->ShipmentsModel->update_record(array('container_number' => $updateValues['container_number']),
                            array('latest_event_time_and_date' => (is_null($updateValues['latest_event_time_and_date']) || empty($updateValues['latest_event_time_and_date'])) ? null : $updateValues['latest_event_time_and_date'],
                                'eta' => $updateValues['eta'],
                                'status' => $updateValues['status'],
                                'is_complete' => $updateValues['is_complete'],
                                'is_active' => true //$updateValues['is_active']
                            )
                        );
                        $data['newContainers'][$c - 1] = $this->ShipmentsModel->get_by_container_number($updateValues['container_number']);
                        echo "data['newContainers'][$c - 1]=>".PHP_EOL;
                        print_r($data['newContainers'][$c - 1]);
                        echo "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[{{{END_CONTAINER_UPDATE}}}]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]".PHP_EOL;
                    } else {
                        //load associative array with data
                        $data['newContainers'][$c - 1]['container_number'] = $dataRow_CN;
                        $data['newContainers'][$c - 1]['bill_of_lading'] = $dataRow_bol;
                        echo "[NOPE DONT EXIST]->" . $dataRows[$c][1] . PHP_EOL;
                        for ($d = 2; $d < count($columnNames); $d++) {
                            $key = $columnNames[$d];
                            $data['newContainers'][$c - 1][$key] = $dataRows[$c][$d];
                            echo "[key]->" . $key . "[value]=>" . $data['newContainers'][$c - 1][$key] . PHP_EOL;
                            if ($key === 'eta' || $key === 'latest_event_timestamp') {
                                if (!is_null($data['newContainers'][$c - 1]['eta']) && strlen($data['newContainers'][$c - 1][$key]) >= 15) {
                                    $data['newContainers'][$c - 1][$key] = trim(substr($data['newContainers'][$c - 1][$key], 0, 16));
                                    $data['newContainers'][$c - 1][$key] = date('m/d/Y H:II', strtotime($data['newContainers'][$c - 1][$key]));
                                } else {
                                    $data['newContainers'][$c - 1][$key] = null;
                                }
                            }
                        }
                        $statusValue = -1;
                        $etaStrToTime = null;
                        //the process that data appropriately for a new entry
                        if (!is_null($data['newContainers'][$c - 1]['eta']) && (strtotime($data['newContainers'][$c - 1]['eta']) < strtotime('2017-01-01 12:00'))) {
                            $data['newContainers'][$c - 1]['eta'] = new DateTime('now');
                            //null eta
                            //date_add($updateValues['eta'], date_interval_create_from_date_string('50 years'));
                            $data['newContainers'][$c - 1]['eta']->add(new DateInterval('P1Y'));
                            $data['newContainers'][$c - 1]['eta'] = $updateValues['eta']->format('Y-m-d');
                            $data['newContainers'][$c - 1]['status'] = 3;
                            $statusValue = 3;
                        } else if (!is_null($data['newContainers'][$c - 1]['eta']) && !empty($data['newContainers'][$c - 1]['eta']) && strlen($data['newContainers'][$c - 1]['eta'] > 11)) {
                            $etaStrToTime = new DateTime($data['newContainers'][$c - 1]['eta']); //date_create($data['newContainers'][$c - 1]['eta']);
                            $etaStrToTime->setTime(5, 00);
                            echo "[NEW ENTRY etaStrToTime]-> " . $etaStrToTime->format("Y-m-d\TH:i:s") . PHP_EOL;
                            $nowTime = new DateTime('now'); //now
                            $nowTime->setTime(5, 00);
                            $diff = $nowTime->diff($etaStrToTime); //date_diff($nowTime, $etaStrToTime);
                            echo "[NEW ENTRY nowTime]-> " . $nowTime->format("Y-m-d\TH:i:s") . PHP_EOL;
                            //echo $data['newContainers'][$c - 1]['container_number'] . "= ". $nowTime->format('Y-m-d')." - ". $etaStrToTime->format('Y-m-d') ." =  ". $nowTime->diff($etaStrToTime)->days . "days difference" . PHP_EOL;
                            echo "[NEW ENTRY diff]-> " . $diff->days . " days." . PHP_EOL;
                            if (intVal($diff->invert) === 0) {
                                if ($diff->days > 7) {
                                    $statusValue = 2;
                                } else if ($diff->days > 3) {
                                    $statusValue = 1;
                                } else {
                                    $statusValue = 0;
                                }

                                //echo $data['newContainers'][$c - 1]['container_number'] . "[statusValue]= ". $statusValue. PHP_EOL;
                                //echo $nowTime->format('m-d-y') . " to ". $etaStrToTime->format('m-d-y') . " = " . $nowTime->diff($etaStrToTime)->days . " days. statusValue=>" .$statusValue. PHP_EOL;
                            } else {
                                $statusValue = 0;
                                //echo $data['newContainers'][$c - 1]['container_number'] . "[statusValue]= ". $statusValue." <-NEGATIVE" . PHP_EOL;
                            }
                            echo "[NEW ENTRY statusValue]-> " . $statusValue . PHP_EOL;
                        } else {
                            $data['newContainers'][$c - 1]['eta'] = new DateTime('now');
                            //null eta
                            //date_add($updateValues['eta'], date_interval_create_from_date_string('50 years'));
                            $data['newContainers'][$c - 1]['eta']->add(new DateInterval('P1Y'));
                            $data['newContainers'][$c - 1]['eta'] = $data['newContainers'][$c - 1]['eta']->format('Y-m-d');
                            $data['newContainers'][$c - 1]['status'] = 3;
                            $statusValue = 3;
                        }
                        $data['newContainers'][$c - 1]['status'] = $statusValue;
                        $data['newContainers'][$c - 1]['final_destination'] = $data['newContainers'][$c - 1]['destination_city'] . ', ' . $data['newContainers'][$c - 1]['destination_state'];
                        $data['newContainers'][$c - 1]['vendor_id'] = $this->ShipmentsModel->get_vendor_id_by_name($data['newContainers'][$c - 1]['vendor_name']);
                        $data['newContainers'][$c - 1]['product_id'] = $this->ShipmentsModel->get_product_id_by_vendor_id($data['newContainers'][$c - 1]['vendor_id']);
                        $data['newContainers'][$c - 1]['isf_required'] = $this->ShipmentsModel->getISFreq($data['newContainers'][$c - 1]['discharge_port']);
                        $data['newContainers'][$c - 1]['do'] = $this->ShipmentsModel->getDOvalue($data['newContainers'][$c - 1]['destination_city']);
                        $data['newContainers'][$c - 1]['latest_event_time_and_date'] = date("Y-m-d\TH:i:s", strtotime($data['newContainers'][$c - 1]['latest_event_timestamp']));
                        $data['newContainers'][$c - 1]['is_complete'] = (strpos($data['newContainers'][$c - 1]['latest_event'], 'Empty Container Returned') !== false ? true : false);
                        $updateData = array(
                            'status' => $data['newContainers'][$c - 1]['status'],
                            'bill_of_lading' => $dataRow_bol,
                            'container_number' => $dataRow_CN,
                            'vendor_id' => $data['newContainers'][$c - 1]['vendor_id'],
                            'product_id' => $data['newContainers'][$c - 1]['product_id'],
                            'discharge_port' => $data['newContainers'][$c - 1]['discharge_port'],
                            'final_destination' => $data['newContainers'][$c - 1]['final_destination'],
                            'isf_required' => isset($data['newContainers'][$c - 1]['isf_required']) ? $data['newContainers'][$c - 1]['isf_required'] : false,
                            'eta' => empty($data['newContainers'][$c - 1]['eta']) ? null : date("Y-m-d\TH:i:s", strtotime($data['newContainers'][$c - 1]['eta'])),
                            'bl_status' => $data['newContainers'][$c - 1]['bl_status'],
                            'container_size' => $data['newContainers'][$c - 1]['container_size'],
                            'latest_event' => $data['newContainers'][$c - 1]['latest_event'],
                            'latest_event_time_and_date' => date("Y-m-d\TH:i:s", strtotime($data['newContainers'][$c - 1]['latest_event_timestamp'])),
                            'is_active' => true,
                            'is_complete' => $data['newContainers'][$c - 1]['is_complete'],
                            'do' => $data['newContainers'][$c - 1]['do']);
                        $newId = $this->ShipmentsModel->add_record($updateData);
                        echo "[NEW ENTRY ADDED newId]-> " . $newId . PHP_EOL;
                        if (!is_null($data['newContainers'][$c - 1]['eta']) && !is_null($etaStrToTime) && !empty($data['newContainers'][$c - 1]['eta'])) {
                            $etaStartDate = $etaStrToTime;
                            echo "[eta]" . $data['newContainers'][$c - 1]['eta'] . PHP_EOL;
                            echo "[etaStart]" . $etaStartDate->format('Y-m-d') . PHP_EOL;
                            date_time_set($etaStartDate, 00, 0);
                            $etaEndDate = $etaStrToTime;
                            date_time_set($etaEndDate, 23, 59);
                            echo "[etaEnd]" . $etaStartDate->format('Y-m-d') . PHP_EOL;
                            $md5CheckValue = md5($data['newContainers'][$c - 1]['container_number'] . '->ETA->' . $data['newContainers'][$c - 1]['eta']);
                            $eventData = array(
                                'title' => $data['newContainers'][$c - 1]['container_number'],
                                'event_type' => 'ETA',
                                'start' => $etaStartDate->format('Y-m-d H:i:s'),
                                'end' => $etaEndDate->format('Y-m-d H:i:s'),
                                'description' => 'Estimated Time of Arrival for Container #: ' . $data['newContainers'][$c - 1]['container_number'] . '. Times/Dates Subject to Change...',
                                'shipment_id' => $newId,
                                'md5_container_number_and_date' => $md5CheckValue,
                            );
                            if (!$this->Calendar_Model->check_md5_if_event_exists($md5CheckValue)) {
                                $this->Calendar_Model->add_event($eventData);
                            } else {
                                $existingEvent = $this->Calendar_Model->get_event_by_md5($md5CheckValue);
                                $this->Calendar_Model->update_event($existingEvent['ID'], $eventData);
                            }
                        }
                        echo "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[{{{END_ADD_NEW_CONTAINER}}}]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]".PHP_EOL;
                    }
                }
                echo "[END OF FOR dataRows[c][d] LOOP]" . PHP_EOL;
                $allContainersString=substr($allContainersString,0,-1);
                echo "[START CN.CA QUERY]=> $allContainersString" . PHP_EOL;
                $this->get_cn_data($allContainersString);
                echo "[END CN.CA QUERY]" . PHP_EOL;
                echo "[START LFD+PICKUP#]" . PHP_EOL;
                $curlData = array();
                $uniqueBoLs = $this->ShipmentsModel->get_unique_records_by_BoL(1);
                for ($i = 0; $i < count($uniqueBoLs); $i++) {
                    $bol = $uniqueBoLs[$i]["bill_of_lading"];
                    echo "[LFD+PICKUP# FOR BOL]->" . $bol . PHP_EOL;
                    $curlData = $this->get_lfd_and_pickup_number_from_bol($bol);
                    $containers = $this->ShipmentsModel->get_by_bol($bol);
                    foreach ($containers as $container) {
                        echo "[UPDATING CN]->" . $container['container_number'] . PHP_EOL;
                        $this->ShipmentsModel
                            ->update_record(array('container_number' => $container['container_number']),
                                array('lfd' => (empty($curlData['lfd']) ? null : date("Y-m-d", strtotime($curlData['lfd']))),
                                    'pickup_number' => (empty($curlData['pickup_number']) ? null : $curlData['pickup_number']),
                                    'bl_status' => (is_null($curlData['bl_status']) || !array_key_exists('bl_status', $curlData) || empty($curlData['bl_status']) ? null : $curlData['bl_status'])));
                        if (!is_null($curlData['lfd']) && !empty($curlData['lfd'])) {
                            $lfdStartDate = new DateTime($curlData['lfd']);
                            date_time_set($lfdStartDate, 00, 0);
                            $lfdEndDate = new DateTime($curlData['lfd']);
                            date_time_set($lfdEndDate, 23, 59);
                            $md5CheckLFDValue = md5($container['container_number'] . '->LFD->' . $curlData['lfd']);
                            $lfdEventData = array(
                                'title' => $container['container_number'],
                                'event_type' => 'LFD',
                                'start' => $lfdStartDate->format('Y-m-d H:i:s'),
                                'end' => $lfdEndDate->format('Y-m-d H:i:s'),
                                'description' => 'Last Free Day for Container #: ' . $container['container_number'] . '. Times/Dates Subject to Change...',
                                'shipment_id' => $container['id'],
                                'md5_container_number_and_date' => $md5CheckLFDValue,
                            );
                            if (!$this->Calendar_Model->check_md5_if_event_exists($md5CheckLFDValue)) {
                                $this->Calendar_Model->add_event($lfdEventData);
                            } else {
                                $existingEvent = $this->Calendar_Model->get_event_by_md5($md5CheckLFDValue);
                                $this->Calendar_Model->update_event($existingEvent['ID'], $lfdEventData);
                            }
                        }
                    }
                }
                echo "[END LFD/Pickup# LOOP]";
            } else {
                $data['newContainers'] = false;
            }
            /*[END OF LOADING CSV DATA INTO data ARRAY] */
            $this->ShipmentsModel->archiveInactiveRecords();
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
            $data['title'] = "Active Shipments";
            $this->load->view('templates/header', $data);
            $this->check_for_eta_updates();
            $this->get_cn_data();
            $this->check_for_email_documents();
            $this->load->view('shipments/index', $data);
            $endtime = microtime(true);
            $execution_time = ($endtime - $starttime); //gets run time in secs
            $execution_time = round($execution_time, 2); //makes time two decimal places long
            echo "Start time: $starttime" . PHP_EOL;
            echo "End time: $endtime" . PHP_EOL;
            echo 'Total Execution Time: ' . $execution_time . ' Secs' . PHP_EOL;
            $this->load->view('templates/footer');
        }
    }

    public function check_for_eta_updates(){
        $starttime = microtime(true);
        set_time_limit(4000);
        // Connect to gmail
        $hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
        $username = 'cargodata.libra@gmail.com';
        $password = 'Libra123$$';
        // try to connect
        $inbox = imap_open($hostname, $username, $password) or die('Cannot connect to Gmail: ' . imap_last_error());
        /* if emails are returned, cycle through each... */
        $failsafe = true;
        if ($inbox !== false) {
            $numMsg = imap_num_msg($inbox);
            $emails = imap_search($inbox, 'UNSEEN', SE_UID);
			
            if (is_cli()) echo "CHECK UNSEEN EMAILS WITH SUBJECT {'ETA Change at Final Destination'}". PHP_EOL;
            $emails = imap_search($inbox, 'UNSEEN', SE_UID);
            if (!$emails) {
                $failsafe=false;
            }
            if ($failsafe){
                if (is_cli()) echo 'EMAILS FOUND  ' . PHP_EOL;
                rsort($emails);
                foreach ($emails as $mail) {
                    $outputResult = '';
                    $msgno = imap_msgno($inbox, $mail);
                    if (is_cli()) echo "[START_OF_MAIL_PROCESSING]=>msgno($msgno)" . PHP_EOL;
                    $headerInfo = imap_headerinfo($inbox, $msgno);
                    $msgBody = imap_body($inbox, $msgno);
                    /* get information specific to this email */
                    if (is_cli()) echo "<br/>email_number: $mail <br/> msgNo: $msgno<br/>";
                    $overview = imap_fetch_overview($inbox, $msgno, 0) or die("can't fetch overview: " . imap_last_error());
                    $pos = strpos($overview[0]->subject, 'Update : ETA Change at Final Destination');
                    $pos2 = strpos($overview[0]->from, 'coscon@coscon.com');
                    if ($pos !== false && $pos2 !== false) {
                        if (is_cli()) echo "[FOUND ETA EMAIL]" . PHP_EOL;
                        $dom = new Dom;
                        $dom->load($msgBody);
                        $title = $dom->getElementsbyTag('title')->text;
                        if (is_cli()) echo "[htmlBoL]=>" . substr($title, 0, 10) . PHP_EOL;
                        $htmlBoL = substr($title, 0, 10);
                        if (is_cli()) echo "<hr/><h1>BoL</h1><br/>" . $htmlBoL . "<hr/>";
                        $dateSpan = $dom->getElementsbyTag('strong')[10]->text;
                        if (is_cli()) echo "[dateSpan]=>". $dateSpan . PHP_EOL;
                        if (is_cli()) echo "<hr/><h1>DateSpan</h1><br/>" . $dateSpan . "<hr/>";
                        $newETAdate = date("Y-m-d", strtotime($dateSpan));
                        if (is_cli()) echo "[newETAdate]=>" . $newETAdate . PHP_EOL;
                        if (!empty($htmlBoL)) {
                            $this->ShipmentsModel->update_record(array('bill_of_lading' => $htmlBoL), array('eta' => $newETAdate));
                            $outputResult .= 'BOL: ' . $htmlBoL . ' ETA Updated to ' . $newETAdate . '<hr/>';
                            if (is_cli()) echo "[outputResult] => " . $outputResult . PHP_EOL;
                            $bolContainerData = $this->ShipmentsModel->get_by_bol($htmlBoL);
                            foreach ($bolContainerData as $bolContainer) {
                                if (is_cli()) echo "[CONTAINER_DATA]=>".$bolContainer['container_number']. PHP_EOL;
                                print_r($bolContainer);
                            }
                        }
                        // Mark as Read
                        $setflagSEENresult = imap_setflag_full($inbox, $mail, "\\SEEN", ST_UID);
                        if ($setflagSEENresult === false) {
                            if (is_cli()) echo "[ERROR]=> error occurred while setting flag to SEEN".PHP_EOL;
                        } else {
                            if (is_cli()) echo "[MAIL FLAGGED AS 'SEEN']" . PHP_EOL;
                        }
                    } else {
                        // Mark as UnRead
                        $setflagUNSEENresult = imap_clearflag_full($inbox, $mail,"\\Seen", ST_UID);
                        if ($setflagUNSEENresult === false) {
                            if (is_cli()) echo "[ERROR]=> error occurred while setting flag to UNSEEN".PHP_EOL;
                        } else {
                            if (is_cli()) echo "[MAIL FLAGGED AS 'UNSEEN']" . PHP_EOL;
                        }
                    }
                    if (is_cli()) echo "[END_OF_MAIL_PROCESSING]=>msgno($msgno)" . PHP_EOL;
                }
            } else {
                if (is_cli()) echo "NO NEW DATA from ETA emails" . PHP_EOL;
            }
        }
        // close the connection
        imap_expunge($inbox);
        imap_close($inbox);
        
        if (is_cli()) echo "Start time: $starttime" . PHP_EOL;
        $endtime = microtime(true);
        if (is_cli()) echo "End time: $endtime" . PHP_EOL;
        //$data['emailData']=$emailData;
        $data['title'] = "Active Shipments";
        /*$this->load->view('templates/header', $data);
        $this->load->view('shipments/index', $data);
        $this->load->view('templates/footer');*/
        //execution time of the script
        $execution_time = ($endtime - $starttime); //gets run time in secs
        $execution_time = round($execution_time, 2); //makes time two decimal places long
        if (is_cli()) echo 'Total Execution Time: ' . $execution_time . ' Secs' . PHP_EOL;
    }

    public function check_for_email_documents() {
        /* connect to gmail */
        set_time_limit(4000);
        $hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
        $username = 'cargodata.libra';
        $password = 'Libra123$$';
        /* try to connect */
        $inbox = imap_open($hostname, $username, $password) or die('Cannot connect to Gmail: ' . imap_last_error());
        /* if emails are returned, cycle through each... */
        $failSafe = true;
        if ($inbox !== false) {
            $numMsg = imap_num_msg($inbox);
            $emails = imap_search($inbox, 'UNSEEN', SE_UID);
            /*var_dump($emails);*/
            if (!$emails) {
                if (is_cli()) echo "NO NEW DATA from vendor emails" . PHP_EOL;
                $failSafe = false;
            }
            if ($failSafe) {
                //var_dump($emails);
                /* put the newest emails on top */
                rsort($emails);
                /* for every email... */
                $vendorMatched = false;
                $attachmentCounter = 0;
                foreach ($emails as $email_number) {
                    $msgno = imap_msgno($inbox, $email_number);
                    $header = imap_headerinfo($inbox, $msgno);
                    //var_dump($header);
                    if ($header === false) {
                        if (is_cli()) echo "email header parsing error. vendor emails Shipments.php -sv";
                    }
                    $msgBody = imap_body($inbox, $msgno);
                    /* get information specific to this email */
                    if (is_cli()) echo "<br/>email_number: $email_number <br/> msgNo: $msgno<br/>";
                    $overview = imap_fetch_overview($inbox, $msgno, 0) or die("can't fetch overview: " . imap_last_error());
                    if (!$overview) {
                        if (is_cli()) echo "overview failed...container vendor emails<br/>";
                        $failSafe = false;
                    }
                    if ($failSafe) {
                        $vendorAbbr = '';
                        $associatedVendorData = array();
                        $vendorSender= array();
                        $vendorMatched = false;
                        //wanda...@tjwanda.com
                        //test...@gmail.com
                        $vendors = $this->ShipmentsModel->get_all_vendor_data();
                        if (is_cli()){
							print_r($vendors);
							echo '$overview[0]->subject->'. $overview[0]->subject . PHP_EOL;
							echo '$overview[0]->from->'. $overview[0]->from . PHP_EOL;
						}
                        foreach ($vendors as $vendor) {
                            if (is_cli()){
								echo $vendor['name']. "->".PHP_EOL;
								echo "vendor[email_addresses]->".PHP_EOL;
								print_r($vendor['email_addresses']);
							}
                            if (!$vendorMatched) {
                                if (is_null($vendor['email_addresses']) || empty($vendor['email_addresses'])) {
                                    continue;
                                }
                                $emailHosts = explode('|', $vendor['email_addresses']);
                                foreach ($emailHosts as $vendorEmailHost) {
                                    if (empty($vendorEmailHost)) {
                                        break;
                                    }

                                    $emailPos = strpos($overview[0]->from, $vendorEmailHost);
                                    if (is_cli()) {
										echo "emailPos=>".PHP_EOL;
										var_dump($emailPos);
										echo "strpos(overview[0]->from: '". $overview[0]->from ."', vendorEmailHost:'$vendorEmailHost')==emailPos => $emailPos" . PHP_EOL;
									}
                                    if (!$emailPos === false) {
                                        $vendorMatched = true;
                                        $associatedVendorData = $this->ShipmentsModel->get_vendor_data_by_id($vendor['id']);
                                        $vendorSender=$this->ShipmentsModel->get_vendor_data_by_id($vendor['id']);
                                        $vendorAbbr=$vendorSender['abbreviation'];
                                        //  echo 'vendorMatched=>true'. PHP_EOL;
                                        // var_dump($vendor);
                                        break 2;
                                    }
                                }
                            }
                        }
                        if (!$vendorMatched) {
                            $setflagUNSEENresult = imap_clearflag_full($inbox, $email_number,"\\Seen", ST_UID);
                            if ($setflagUNSEENresult === false) {
                                if (is_cli()) echo "[ERROR]=> error occurred while setting flag to UNSEEN".PHP_EOL;
                            } else {
                                if (is_cli()) echo "[MAIL FLAGGED AS 'UNSEEN']" . PHP_EOL;
                            }
                            continue;
                        } else {
							if (is_cli()) {
								echo 'Into part 2';
								print_r($associatedVendorData);
							}
                            // Mark as Read
                            $setflagSEENresult = imap_setflag_full($inbox, $email_number, "\\Seen", ST_UID);
                            if ($setflagSEENresult === false) {
                                if (is_cli()) echo "error occurred while setting UNSEEN flag to SEEN<br/>";
                            }
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
                                                if (is_cli()) echo "attachment found...".$attachments[$i]['filename']."<br/>";
                                            }
                                        }
                                    }
                                    if ($structure->parts[$i]->ifparameters) {
                                        foreach ($structure->parts[$i]->parameters as $object) {
                                            if (strtolower($object->attribute) == 'name') {
                                                $attachments[$i]['is_attachment'] = true;
                                                $attachments[$i]['name'] = $object->value;
                                                if (is_cli()) echo "attachment found...".$attachments[$i]['name']."<br/>";
                                            }
                                        }
                                    }
                                    if ($attachments[$i]['is_attachment']) {
                                        $attachments[$i]['file_extension'] = $structure->parts[$i]->subtype;
                                        $attachments[$i]['attachment'] = imap_fetchbody($inbox, $msgno, $i + 1);
                                        if ($structure->parts[$i]->encoding == 3) {
                                            if (is_cli()) echo "BASE64 decoding file...<br/>";
                                            /* 3 = BASE64 encoding */
                                            $attachments[$i]['attachment'] = base64_decode($attachments[$i]['attachment']);
                                        } elseif ($structure->parts[$i]->encoding == 4) {
                                            if (is_cli()) echo "QUOTED-PRINTABLE decoding file...<br/>";
                                            /* 4 = QUOTED-PRINTABLE encoding */
                                            $attachments[$i]['attachment'] = quoted_printable_decode($attachments[$i]['attachment']);
                                        }
                                    }
                                }
                            } else {
                                continue;
                            }
							if (is_cli()) {
								echo 'attachments dopwnloaded...' . PHP_EOL;
								print_r($vendorSender);
							}
                            $tmpAttachments = array();
                            $newAttachments = array();
                            /*foreach ($attachments as $attachment) {
                            if (strtoupper($attachment['file_extension'])==='OCTET-STREAM' || strtoupper($attachment['file_extension'])==='XLS'){
                            $tmpAttachments[]=$attachment;
                            } else {
                            $newAttachments[]=$attachment;
                            }
                            }*/
                            /* foreach ($tmpAttachments as $tmpAttachment){
                            $newAttachments[]=$tmpAttachment;
                            }*/
                            unset($tmpAttachments);
                            foreach ($attachments as $attachment) {
                                $documentBL = '';
                                $documentCN = '';
                                $documentType = '';
                                $associatedCargoData = null;
                                $filename = '';
                                $fullPathAndFileName = '';
                                $vendorIdLabelForDocuments = '';
                                $directoryStructure = $_SERVER['DOCUMENT_ROOT'] . "/vendor_documents";
                                $poPlaceholder = '00000';
                                if ($attachment['is_attachment'] == 1) {
                                    $md5_test = md5($attachment['attachment']);
                                    $fileExistsInDB = $this->Document_model->md5_file_exists($md5_test);
                                    if ($fileExistsInDB) {
                                        continue;
                                    }
                                    $filename = $attachment['filename'];
                                    if (empty($filename)) {
                                        $filename = $attachment['filename'];
                                    }
                                    if (empty($filename)) {
                                        $filename = $vendorAbbr . '-' . date('mdy') . '.' . $attachment['file_extension'];
                                    }
                                    $tmpFileDir = "$directoryStructure/tmp/$filename";
                                    if (!file_exists(dirname($tmpFileDir))) {
                                        mkdir(dirname($tmpFileDir), 0777, true);
                                    }
                                    file_put_contents($tmpFileDir, $attachment['attachment']);
                                    echo "$tmpFileDir=>strtoupper(associatedVendorData['abbreviation'])=>".strtoupper($associatedVendorData['abbreviation']). PHP_EOL;
                                    if (strtoupper(trim($attachment['file_extension'])) === 'OCTET-STREAM') {
                                        $attachment['file_extension'] = substr($filename, strlen($filename) - 3, strlen($filename));
                                    }

                                    switch (strtoupper($vendorSender['abbreviation'])) {
                                        case "WANDA":
                                            if (is_cli()) echo 'attachment[file_extension]=>'.strtoupper($attachment['file_extension']).PHP_EOL;
                                            if (preg_match('/LB\d{2}/', $filename, $match)) {
                                                $vendorIdLabelForDocuments = trim($match[0]);
                                            } else if (preg_match('/LB\d{3}/', $filename, $match)) {
                                                $vendorIdLabelForDocuments = trim($match[0]);
                                            } else {
                                                if (strpos(strtoupper($filename), strtoupper($attachment['file_extension']))) {
                                                    $vendorIdLabelForDocuments = trim(substr($filename, strripos($filename, ' ') + 1,
                                                        ((strpos(strtoupper($filename), strtoupper($attachment['file_extension'])) - 1) - (strripos($filename, ' ') + 1))));
                                                }
                                            }
                                            if (is_cli()) echo "vendorIdLabelForDocuments => ".$vendorIdLabelForDocuments . PHP_EOL;
                                            switch (strtoupper($attachment['file_extension'])) {
                                                case "PDF":
                                                    if (is_cli()) echo 'wanda pdf=>'.PHP_EOL;
                                                    $documentType = "Bill_of_Lading";
                                                    /* Local Server -> */
                                                    $pdf = new \TonchikTm\PdfToHtml\Pdf($tmpFileDir, [
                                                        'pdftohtml_path' => 'F:/xampp/htdocs/assets/poppler0.51/bin/pdftohtml.exe',
                                                        'pdfinfo_path' => 'F:/xampp/htdocs/assets/poppler0.51/bin/pdfinfo.exe',
                                                    ]);
                                                    /* Di's Server ->
                                                     $pdf = new \TonchikTm\PdfToHtml\Pdf($tmpFileDir, [
                                                        'pdftohtml_path' => 'C:/xampp/htdocs/assets/poppler0.51/bin/pdftohtml.exe',
                                                        'pdfinfo_path' => 'C:/xampp/htdocs/assets/poppler0.51/bin/pdfinfo.exe',
                                                    ]);
                                                    */
                                                    $pdfInfo = $pdf->getInfo();
                                                    $html = $pdf->getHtmlContent();
                                                    if (is_cli()){
														echo "var_dump of html".PHP_EOL;
														var_dump($html);
													}
                                                    $DOM = new DOMDocument();
                                                    libxml_use_internal_errors(true);
                                                    if (!empty($html)) {
                                                        $DOM->loadHTML($html);
                                                        $paragraphs = $DOM->getElementsByTagName('p');
                                                        $count = 0;
                                                        foreach ($paragraphs as $p) {
                                                            $textContent = $p->textContent;
                                                            if (is_cli()) echo "paragraphs[$count]: " . $textContent . PHP_EOL;
                                                            if (preg_match('/' . '\d{10}/', $textContent, $match)) {
                                                                if (strpos(trim($textContent), $match[0]) === 0 && strlen(trim($textContent) === 10)) {
                                                                    $documentBL = trim($match[0]);
                                                                    if (is_cli()) echo "documentBL => ".$documentBL.PHP_EOL;
                                                                }
                                                            } else if (preg_match('/' . '--[A-Z]{4}[0-9]{7}/', $textContent, $match)) {
                                                                $documentCN = substr(trim($match[0]), strpos($textContent, $match[0]) + 2, strlen($match[0]));
                                                                if (is_cli()) echo "documentCN => ".$documentCN.PHP_EOL;
                                                            }
                                                            $count++;
                                                        }
                                                        $associatedCargoData = $this->ShipmentsModel->update_record(array('container_number' => $documentCN), array('vendor_identifier' => $associatedVendorData['document_initials'] . $vendorIdLabelForDocuments, 'has_documents' => true));
                                                        $poPlaceholder = $associatedCargoData['po'];
                                                        break;
                                                    } else {
                                                        break;
                                                    }
                                                    break;
                                                case "XLS":
                                                    if (is_cli()) echo 'wanda xls=>'.PHP_EOL;
                                                    $documentType = "Parts_List";
                                                    $associatedCargoData = $this->ShipmentsModel->get_by_vendor_specific_identifier($associatedVendorData['document_initials'] . $vendorIdLabelForDocuments);
                                                    if (is_null($associatedCargoData) || empty($associatedCargoData)) {
                                                        break;
                                                    }
                                                    $poPlaceholder = $associatedCargoData['po'];
                                                    $associatedCargoData = $this->ShipmentsModel->update_record(array('container_number' => $associatedCargoData['container_number'], 'has_documents' => true));
                                                    break;
                                                default:
                                                    //otherwise, store in 'Other' documents folder
                                                    $documentType = "Other";
                                                    break;
                                            }
                                            break;
                                        case "JIANXIN":
                                            $fileDataArray = explode('-',substr($filename,0,strpos($filename,'.')));
                                            $productType = $fileDataArray[3];
                                            $documentType = $fileDataArray[2];
                                            $vendorIdLabelForDocuments='JT'.date('y').'LB'.$fileDataArray[1];
                                            switch(strtolower($documentType)){
                                                case 'iv':
                                                case 'in':
                                                    $documentType="Invoice";
                                                    break;
                                                case 'pl':
                                                    $documentType='Parts_List';
                                                    break;
                                                default:
                                                    $documentType='Other';
                                                    break;
                                            }
                                            foreach ($vendors as $vendor) {
                                                $vendorProduct = $this->ShipmentsModel->get_vendor_associated_product($vendor['id']);
                                                if (strpos(strtolower($vendorProduct['product_name']),strtolower($productType))!==false){
                                                    $associatedVendorData=$this->ShipmentsModel->get_vendor_data_by_id($vendor['id']);
                                                    echo 'NEW VENDOR ASSOCIATION for '.$filename.': '. PHP_EOL;
                                                    print_r($associatedVendorData);
                                                    break;
                                                }
                                            }
                                            if (is_cli()) echo "jianxin pdf=>$tmpFileDir".PHP_EOL;
                                            /* Local Server -> */
                                            $pdf = new \TonchikTm\PdfToHtml\Pdf($tmpFileDir, [
                                                'pdftohtml_path' => 'F:/xampp/htdocs/assets/poppler0.51/bin/pdftohtml.exe',
                                                'pdfinfo_path' => 'F:/xampp/htdocs/assets/poppler0.51/bin/pdfinfo.exe',
                                            ]);
                                            /* Di's server ->
                                            $pdf = new \TonchikTm\PdfToHtml\Pdf($tmpFileDir, [
                                                'pdftohtml_path' => 'C:/xampp/htdocs/assets/poppler0.51/bin/pdftohtml.exe',
                                                'pdfinfo_path' => 'C:/xampp/htdocs/assets/poppler0.51/bin/pdfinfo.exe',
                                            ]);*/
                                            $pdfInfo = $pdf->getInfo();
                                            $contentFirstPage = $pdf->getHtml()->getPage(1);
                                            $html = $pdf->getHtmlContent();
                                            if (is_cli()){
												echo "var_dump of html".PHP_EOL;
												var_dump($html);
											}
                                            $DOM = new DOMDocument();
                                            libxml_use_internal_errors(true);
                                            if (!empty($html)) {
                                                $DOM->loadHTML($html);
                                                $paragraphs = $DOM->getElementsByTagName('p');
                                                $count = 0;
                                                foreach ($paragraphs as $p) {
                                                    $textContent = $p->textContent;
                                                    if (is_cli()) echo "paragraphs[$count]: " . $textContent . PHP_EOL;
                                                    $regexStart = $associatedVendorData['document_initials'];
                                                    if (preg_match('/' . $regexStart . '[0-9]{5}/', $textContent, $match)){
                                                        $poPlaceholder = trim($match[0]);
                                                        $poPlaceholder = substr($poPlaceholder,strlen($regexStart),strlen($poPlaceholder));
                                                        //same as above with a different function:
															//$poPlaceholder = str_replace($regexStart,'',$poPlaceHolder);
                                                        if (is_cli()){
															echo "VENDOR DOCUMENT INITIALS => ". $regexStart. PHP_EOL;
															echo "PO FOUND (without vendor initials) => ". $poPlaceholder. PHP_EOL;
														}
                                                        $associatedCargoData = json_decode(json_encode($this->ShipmentsModel->get_by_po_number($poPlaceholder,$associatedVendorData['document_initials'])),true);
                                                        if (!is_null($associatedCargoData)) {
                                                            if (is_cli()) {
																echo "CARGO ENTRY FOUND => ".PHP_EOL;
																print_r($associatedCargoData);
															}
                                                            $this->ShipmentsModel->update_record(array('po' => $poPlaceholder), array('vendor_identifier' => $vendorIdLabelForDocuments, 'has_documents' => true));
                                                            $documentCN=$associatedCargoData['container_number'];
                                                            if (is_cli()) echo "documentCN-> $documentCN". PHP_EOL;
                                                        } else {
                                                            if (is_cli()) echo 'NO CARGO DATA FOUND...'. PHP_EOL;
                                                        }
                                                        break;
                                                    }
                                                    $count++;    
                                                }
                                                break;
                                            } else {
                                                break;
                                            }
                                        default:
                                            //something i don't have a case for
                                            $documentType = "Unassociated Document";
                                            break;
                                    }
                                    //generate the document storage directory structure name
                                    if (is_null($associatedCargoData) || empty($associatedCargoData)) {
                                        $associatedCargoData = json_decode(json_encode($this->ShipmentsModel->get_by_po_number($poPlaceholder,$associatedVendorData['document_initials'])),true);
                                        if (is_null($associatedCargoData)){
                                            //save to folder for unassociated files...or maybe do a manual save or something? idk yet but i'll figure it out...
                                            $dirDate = date("mdy");
                                            if ($attachment['file_extension'] === 'OCTET-STREAM') {
                                                $attachment['file_extension'] = 'XLS';
                                            }
                                            $directoryStructure = $_SERVER['DOCUMENT_ROOT'] . "/" . "vendor_documents/UNASSOCIATED_FILES/$dirDate/" . strtoupper($associatedVendorData['abbreviation']) . "/" . "$poPlaceholder/" . $attachment['file_extension'] . "/";
                                        }else{
                                            if (is_cli()) echo "CARGO ENTRY FOUND AT THE LAST MINUTE => ".$associatedCargoData['container_number'].PHP_EOL;
                                            if (is_cli()) echo "PO NUMBER => ".$poPlaceholder.PHP_EOL;
                                            $this->ShipmentsModel->update_record(array('po' => $poPlaceholder), array('vendor_identifier' => $vendorIdLabelForDocuments, 'has_documents' => true));
                                            $documentCN=$associatedCargoData['container_number'];
                                            $yearDigits = date('y');
                                            $poFolderName = $associatedVendorData['document_initials'] . $yearDigits . '-' . $poPlaceholder . ' ' . $documentCN;
                                            $directoryStructure = $_SERVER['DOCUMENT_ROOT'] . "/" . "vendor_documents/" . trim($poFolderName) . '/';
                                        }
                                    } else {
                                        $yearDigits = date('y');
                                        if (is_cli()) echo "LAST SECTION =>  ". PHP_EOL;
                                        $this->ShipmentsModel->update_record(array('container_number' => $documentCN), array('po' => $poPlaceholder));
                                        $poFolderName = $associatedVendorData['document_initials'] . $yearDigits . '-' . $poPlaceholder . ' ' . $documentCN;
                                        $directoryStructure = $_SERVER['DOCUMENT_ROOT'] . "/" . "vendor_documents/" . trim($poFolderName) . '/';
                                        //a better way to do it would be to use directories for each data piece
                                        //  ie-> for a wanda invoice from 2018 with PO 123456 and CN ABCD123456
                                        //       $directoryName=$_SERVER['DOCUMENT_ROOT'] . "/vendor_documents" .
                                        //                       "/$vendor" . "/$current_year" . "/purchse_order_number" .
                                        //                       "/$container_number" . "/document_type" . "/$filename";
                                        //$directoryStructure .= '/' . strtoupper($documentType) . '/';
                                        $this->ShipmentsModel->set_has_documents($documentCN, true);
                                    }
                                    $fullPathAndFileName = $directoryStructure . $filename;
                                    if (!file_exists(dirname($fullPathAndFileName))) {
                                        mkdir(dirname($fullPathAndFileName), 0777, true);
                                    }

                                    $md5_hash = md5($attachment['attachment']);
                                    if (file_put_contents($fullPathAndFileName, $attachment['attachment'])) {
                                        $documentData = array(
                                            'filename' => $filename,
                                            'filepath' => $directoryStructure,
                                            'file_extension' => $attachment['file_extension'],
                                            'shipment_id' => (is_null($associatedCargoData) ? null : $associatedCargoData['id']),
                                            'md5_hash' => $md5_hash,
                                            'identifying_label' => $vendorIdLabelForDocuments,
                                            'creation_timestamp' => date("Y-m-d H:i:s"),
                                            'document_type' => $documentType,
                                            'vendor_id' => $associatedVendorData['id'],
                                            'po_number' => $poPlaceholder
                                        );
                                        $newDocumentId = $this->Document_model->add_document($documentData);
                                    }
                                    unlink($tmpFileDir);
                                    unset($tmpFileDir);
                                    $attachmentCounter++;
                                }
                            }
                        }
                    }

                }
            }
            imap_close($inbox);
        }
    }

    public function get_lfd_and_pickup_number_from_bol($bol)
    {
        /*if (!$this->hasCookie) {
        $ch = curl_init('http://elines.coscoshipping.com/NewEB/home.html');
        $ch = curl_init('http://elines.coscoshipping.com/ebusiness/cargoTracking');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
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
        print_r($this->cookies);
        return;*/
		
        $ch = curl_init();
        //$requestUrl = "http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml?language=en&page=null&token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjU5MDEyNDgsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI5YmNmMGFjNS1hNDI5LTQ5MDAtYjg5NS1hZjZmZmRmMmZjZGEiLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.JcMTTo0T-qHKkOko0SU5j5Gios_bVxhqtjFZoP5-GGwuyioA-b2JaRhC8SMxGlT2bMszSIqauZKCHEuZbdKjOderxE6C1gCN8i1UP6G_QggOYybhep514oG9nTwDGuPMVO6WU_o_9ZrgjBzi4Hfsy98uJcAEEe1uiX4GdzJPRR_gpbCOodhyoYHRybsDNH8EfZVikKFnDBY8fLmGPyA8kBiCxEIHd-WWvdAyWdCLZoMRkUYd5lyeImNuNROZWHS12q67YszJgyhrGJ1UYLBITqfCuus1z0CFnZ9RyxxvxpuIrAIgab6TquL4Hau11WRXcHiVLhhKAog2Cyhib5a6gw&uid=libra";
        $requestTime = microtime(true);
        $requestUrl = "http://elines.coscoshipping.com/ebtracking/public/booking/$bol?timestamp=$requestTime";
        curl_setopt($ch, CURLOPT_URL, $requestUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        /* curl_setopt($ch, CURLOPT_POST, 1);*/
        curl_setopt($ch, CURLOPT_ENCODING, "gzip");
        /*  $payloadArray= array(
        'formId' => 'mainForm',
        'async' => 'false',
        'global' => 'true',
        'source' => 'j_idt49',
        'process' => '@all'
        );
        $payload=json_encode($payloadArray);
        $cookieString = "number=$bol; numberType=BOOKING; language=en_US; JSESSIONID=" . $this->cookies['JSESSIONID'] . "; COSCON_ACCESS_I18N=en-US; ";
         */
        /*curl_setopt($ch, CURLOPT_POSTFIELDS, "login-form-type=pwd&url=%40b%26URL%40b%26&state=quickLogin&username=libra38654&password=Eddi1009&x=42&y=9");

         *GET http://elines.coscoshipping.com/ebtracking/public/booking/6185516940?timestamp=1529998661200 HTTP/1.1
         *  Host: elines.coscoshipping.com
         * Connection: keep-alive
         * Accept:
         * DNT: 1
         * language: en_US
         * sys: eb
         * Authorization: bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MzAwNDE3MzMsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI0YTQzMWRmYS0xZDMyLTRkOGItOTAyMy0xZDc1ZDZkNTg2YTciLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.YGbPZsRfIalMvL25GqFaR9n3J1i_OddZXVfRsdw5Ooolu_C--YgdQvsiseODuyx8gUFOkaD7ufivNjybUVCmnr1kKLC4ZJObuLtztMpQh6oTjzaJzCHlNyK-bDlZqsRJn51NoUSK5VPTs6DRzNX0h1tIo6ctF5yYUB_DvJ7L6yXraLusUHussMHaGa_nqB3Oy2IZFdofSvAFPLYap6kwtXUhMxRrDaNgDbP35OrAAbij4_sdjSG3ZnmfttrZWrDA7aMbO1Ie3xDG_-saTrsfzSSH4icsUhhIHZR8mg_bDTIR-k0idUzoo1Nc2IiVUONSzY2SI0YDIJ7zhN31VX9jQw
         * User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36
         * Referer: http://elines.coscoshipping.com/ebusiness/cargoTracking
         * Accept-Encoding: gzip, deflate
         * Accept-Language: en-US,en;q=0.9

         */
		 curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Host: elines.coscoshipping.com',
            'Connection: keep-alive',
            'Accept: */*; q=0.01',
            'DNT: 1',
            'language: en_US',
            'sys: eb',
            'Authorization: bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MzAwNDE3MzMsInVzZXJfbmFtZSI6ImxpYnJhIiwic2NvcGUiOlsicmVhZCJdLCJhdXRob3JpdGllcyI6WyJST0xFX1NBUF9Vc2VyIl0sInN5cyI6ImViIiwiYXVkIjpbIm1vYmlsZS1yZXNvdXJjZSJdLCJqdGkiOiI0YTQzMWRmYS0xZDMyLTRkOGItOTAyMy0xZDc1ZDZkNTg2YTciLCJjbGllbnRTb3VyY2UiOiJwYyIsImNsaWVudF9pZCI6Im0xIn0.YGbPZsRfIalMvL25GqFaR9n3J1i_OddZXVfRsdw5Ooolu_C--YgdQvsiseODuyx8gUFOkaD7ufivNjybUVCmnr1kKLC4ZJObuLtztMpQh6oTjzaJzCHlNyK-bDlZqsRJn51NoUSK5VPTs6DRzNX0h1tIo6ctF5yYUB_DvJ7L6yXraLusUHussMHaGa_nqB3Oy2IZFdofSvAFPLYap6kwtXUhMxRrDaNgDbP35OrAAbij4_sdjSG3ZnmfttrZWrDA7aMbO1Ie3xDG_-saTrsfzSSH4icsUhhIHZR8mg_bDTIR-k0idUzoo1Nc2IiVUONSzY2SI0YDIJ7zhN31VX9jQw',
            'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36',
            'Referer: http://elines.coscoshipping.com/ebusiness/cargoTracking',
            'Accept-Encoding: gzip, deflate',
            'Accept-Language: en-US,en;q=0.9'));
            
        $output = curl_exec($ch);
        if (curl_error($ch)) {
            return null;
        }

        curl_close($ch);
        $jsonData = json_decode($output, true);
        if (is_cli()) print_r($jsonData);
        if (!empty($jsonData['data']['content']['cargoTrackingContainer'])) {
            $return = array('lfd' => $jsonData['data']['content']['cargoTrackingContainer'][0]['lfd'], 'pickup_number' => $jsonData['data']['content']['cargoTrackingContainer'][0]['pickUpNumber'], 'bl_status' => $jsonData['data']['content']['blRealStatus']);
            return $return;
        } else {
            $return = array('lfd' => null, 'pickup_number' => null, 'bl_status' => $jsonData['data']['content']['blRealStatus']);
            return $return;
        }

        //echo "OUTPUT:".PHP_EOL. $output . "ENDOUTPUT" . PHP_EOL;
        /* if (!$this->hasCookie) echo $output;*/
        /*$DOM = new DOMDocument();
    libxml_use_internal_errors(true);
    $DOM->loadHTML($output);
    $table = $DOM->getElementById('containerInfoByBlNum');
    $Header = $table->getElementsByTagName('th');
    $Detail = $table->getElementsByTagName('td');
    $allTds = $DOM->getElementsByTagName('td');
    $oblStatus =$allTds[241];
    $count=0;
    $return = array('lfd' => null, 'pickup_number' => null, 'bl_status' => null);
    foreach($allTds as $td) {
    $textContent = $td->textContent;
    // echo "allTds[$count]: " . $textContent . PHP_EOL;
    $oblTextPos=strpos($textContent,'OBL Release Status');
    $oblTextLen=strlen($textContent);
    if ($oblTextPos===1 && $oblTextLen===19) {
    //echo "FOUND: allTds[$count]: " . $textContent .PHP_EOL. "strpos(OBL Release Status)=>" . $oblTextPos . PHP_EOL . "strlen(textContent)=>" . $oblTextLen . PHP_EOL;
    $oblIdx = $count+2;
    $oblStatusValue = $allTds[$oblIdx]->textContent;
    $return['bl_status'] = trim($oblStatusValue);
    //echo "RESULT: allTds[$oblIdx]: " . $oblStatusValue .PHP_EOL;
    break;
    }
    $count++;
    }
    unset($allTds);
    //#Get header name of the table
    foreach ($Header as $NodeHeader) $aDataTableHeaderHTML[] = trim($NodeHeader->textContent);
    //#Get row data/detail table without header name as key
    $i = 0;
    $j = 0;
    foreach ($Detail as $sNodeDetail) {
    $aDataTableDetailHTML[$j][] = trim($sNodeDetail->textContent);
    $i = $i + 1;
    $j = $i % count($aDataTableHeaderHTML) == 0 ? $j + 1 : $j;
    }
    //#Get row data/detail table with header name as key and outer array index as row number
    for ($i = 0; $i < count($aDataTableDetailHTML); $i++) {
    for ($j = 0; $j < count($aDataTableHeaderHTML); $j++) {
    if (array_key_exists($j, $aDataTableDetailHTML[$i]))    $aTempData[$i][$aDataTableHeaderHTML[$j]] = $aDataTableDetailHTML[$i][$j];
    else                                                    break;
    }
    }
    $aDataTableDetailHTML = $aTempData;
    unset($aTempData);
    if (array_key_exists('Rail LFD', $aDataTableDetailHTML[0]) && isset($aDataTableDetailHTML[0]['Rail LFD']))              $return['lfd'] = $aDataTableDetailHTML[0]['Rail LFD'];
    elseif (array_key_exists('Depot LFD', $aDataTableDetailHTML[0]) && isset($aDataTableDetailHTML[0]['Depot LFD']))    $return['lfd'] = $aDataTableDetailHTML[0]['Depot LFD'];
    else                                                                                                                $return['lfd'] = false;
    if (array_key_exists('Pickup#', $aDataTableDetailHTML[0]) && isset($aDataTableDetailHTML[0]['Pickup#']))    $return['pickup_number'] = $aDataTableDetailHTML[0]['Pickup#'];
    else                                                                                                        $return['pickup_number'] = false;
    unset($aDataTableDetailHTML);
    unset($aDataTableHeaderHTML);
    print_r($return);
    return $return;*/
    }


    public function get_cn_data($container_numbers=''){
        /*  http://automate.cn.ca/ecomsrvc/velocity/Tracing/english/TracingDirect_DirectAccess?&UserID=libra38654&Password=Eddi1009&Function=STI&Format=HH&EquipmentID=CBHU411055  */
        /*Host: automate.cn.ca
        Connection: keep-alive
        Upgrade-Insecure-Requests: 1
        User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36
        DNT: 1
        Accept: cURL/PHP
        Accept-Encoding: gzip, deflate
        Accept-Language: en-US,en;q=0.9
        */
        if (empty($container_numbers)){
            $containers = json_decode(json_encode($this->ShipmentsModel->get_all_containers()));
            var_dump($containers);
            foreach ($containers as $container)if (strpos($container->container_number,"Unassigned")===false) $container_numbers.=$container->container_number.'+';
            $container_numbers = substr($container_numbers,0,-1);
            echo "[container_numbers] => ". PHP_EOL . $container_numbers . PHP_EOL;
        }
        if (is_cli()){
            echo "[START]->get_cn_data". PHP_EOL;
        }
        $ch = curl_init();
        $requestTime = microtime(true);
        $requestUrl = "http://automate.cn.ca/ecomsrvc/velocity/Tracing/english/TracingDirect_DirectAccess?&UserID=libra38654&Password=Eddi1009&Function=STI&Format=H&EquipmentID=$container_numbers";
        curl_setopt($ch, CURLOPT_URL, $requestUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    	curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Host: automate.cn.ca',
            'Connection: keep-alive',
            'Upgrade-Insecure-Requests: 1',
            'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',
            'DNT: 1',
            'Accept: cURL/PHP',
            'Accept-Encoding: gzip, deflate',
            'Accept-Language: en-US,en;q=0.9'
            ));
            
        $response = curl_exec($ch);
        if (curl_error($ch)) {
            return null;
        }

        if (is_cli()){
            echo "[RESPONSE]=> ". PHP_EOL. $response . PHP_EOL;
        }
        $dataArray = explode("\n", $response);
        if (is_cli()){
            echo "[dataArray]=> ". PHP_EOL;
            print_r($dataArray);
        }
        $rowData=array();
        $usefulData=array();
        foreach($dataArray as $key=>$value){
            $rowData[$key]=preg_split('/\s+/', $value);
            if (count($rowData[$key])>6){
                $usefulData[]=preg_split('/\s+/', $value);
            }
        }
        if (is_cli()){
            echo "[rowData]=> ". PHP_EOL;
            print_r($rowData);
        }
        if (is_cli()){
            echo "[usefulData]=> ". PHP_EOL;
            print_r($usefulData);
        }
        foreach($usefulData as $somethingWorthwhile){
            $testVal = $somethingWorthwhile[count($somethingWorthwhile)-2];
            if (ctype_digit($testVal) && strlen($testVal)===6){
                if (is_cli()){
                    echo "[SUCCESS]=>".$somethingWorthwhile[0].$somethingWorthwhile[1]. PHP_EOL;
                    print_r($testVal);
                }
                $etaStrToTime = new DateTime($testVal); //date_create($data['newContainers'][$c - 1]['eta']);
                $etaStrToTime->setTime(5, 00);
                echo "[CN.CA etaStrToTime]-> " . $etaStrToTime->format("Y-m-d\TH:i:s") . PHP_EOL;
                $nowTime = new DateTime('now'); //now
                $nowTime->setTime(5, 00);
                $diff = $nowTime->diff($etaStrToTime); //date_diff($nowTime, $etaStrToTime);
                echo "[CN.CA nowTime]-> " . $nowTime->format("Y-m-d\TH:i:s") . PHP_EOL;
                //echo $data['newContainers'][$c - 1]['container_number'] . "= ". $nowTime->format('Y-m-d')." - ". $etaStrToTime->format('Y-m-d') ." =  ". $nowTime->diff($etaStrToTime)->days . "days difference" . PHP_EOL;
                echo "[CN.CA diff]-> " . $diff->days . " days." . PHP_EOL;
                $statusValue = 0;
                if (intVal($diff->invert) === 0) {
                    if ($diff->days > 7) {
                        $statusValue = 2;
                    } else if ($diff->days > 3) {
                        $statusValue = 1;
                    } else {
                        $statusValue = 0;
                    }
                } else {
                    $statusValue = 0;
                } 
                if (is_cli()){
                    echo "[statusValue] => " . $statusValue . PHP_EOL;
                }
                $this->ShipmentsModel->update_record(array('container_number' => $somethingWorthwhile[0].$somethingWorthwhile[1]),
                array('eta' => $etaStrToTime->format("Y-m-d"),'status' => $statusValue));
            }
        }
    }


    /*
    protected $cookies = array();
    protected $hasCookies = false;
    public function query_cn_ca_site($container_number) {*/
        /*****
         * REQUEST #1:  LOGIN
         */
        /*if (is_cli()){
            echo "[GETTING COOKIES FROM WWW.CN.CA]". PHP_EOL . "[RESULT?]=>" . PHP_EOL;
        }
        if (!$this->hasCookies){
            ob_start();
           $out = fopen('php://output', 'w');
            $ch = curl_init('https://ecprod.cn.ca/pkmslogin.form');
            curl_setopt($ch, CURLOPT_VERBOSE, true);
            curl_setopt($ch, CURLOPT_STDERR, $out);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_POST, 1);
           curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Host: ecprod.cn.ca',
                'Connection: keep-alive',
                'Content-Length: 105',
                'Cache-Control: max-age=0',
                'Origin: https://ecprod.cn.ca',
                'DNT: 1',
                'Content-Type: application/x-www-form-urlencoded',
                'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/67.0.3396.99 Safari/537.36',
                'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,* /*;q=0.8',
                'Referer: https://ecprod.cn.ca/quick_login_en.html',
                'Accept-Encoding: gzip, deflate',
                'Accept-Language: en-US,en;q=0.9'
            ));
            curl_setopt($ch, CURLOPT_PROXY, '127.0.0.1:8888');

            curl_setopt($ch, CURLOPT_CAINFO, $_SERVER['DOCUMENT_ROOT'] . "/" . "_certs/cn_ca.crt");
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0); 
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); 
            $rndX = rand(1, 42);
            $rndY = rand(1, 9);
            curl_setopt($ch, CURLOPT_POSTFIELDS, "login-form-type=pwd&url=%40b%26URL%40b%26&state=quickLogin&username=libra38654&password=Eddi1009&x=$rndX&y=$rndY");
            $response = curl_exec($ch);
            /*fclose($out);
            $data = ob_get_clean();
            $data .= PHP_EOL . $response . PHP_EOL;
            if (is_cli())echo $data;
            if (is_cli()) echo "[RESPONSE]=>" .PHP_EOL. $response . PHP_EOL;
            // get cookie
            // multi-cookie variant contributed by @Combuster in comments
            /*preg_match_all('/^Set-Cookie:\s*([^;]*)/mi', $response, $matches);
            foreach ($matches[1] as $item) {
                $this->hasCookies=true;
                parse_str($item, $cookie);
                $this->cookies = array_merge($this->cookies, $cookie);
            }
            if (is_cli()){
                echo '[COOKIES]=>'.PHP_EOL;
                var_dump($this->cookies);
            }
            curl_close($ch);
        }
        /*****
         * REQUEST #2:  GET DATA
         *  GET https://ecprod.cn.ca/velocity/TripPlan/english/TP_TripPlan?list=true&railcars=CBHU411055 HTTP/1.1
            Host: ecprod.cn.ca
            Connection: keep-alive
            Upgrade-Insecure-Requests: 1
            DNT: 1
            User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36
            Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8
            Referer: https://ecprod.cn.ca/velocity/TripPlan/english/Common_DisplayPage?url=TP_INDEX&list=true&railcars=CBHU411055
            Accept-Encoding: gzip, deflate
            Accept-Language: en-US,en;q=0.9
            Cookie: PD-S-SESSION-ID=1_2_1_BiLIa88IidKfvin7-10+VzcsVCKeaDkoz3UUfHQ9e1ts6TOl; Path=/; Secure; HttpOnly


         *
        /*if (empty($this->cookies)){
            echo "[ERROR] => no cookies were grabbed, so probably didn't authenticate properly...". PHP_EOL . "[QUITTING...]". PHP_EOL;
            return;
        }
        if (is_cli()){
            echo "[SENDING DATA REQUEST]". PHP_EOL;
        }
       /* ob_start();
        $out = fopen('php://output', 'w');
        $ch = curl_init("https://ecprod.cn.ca/velocity/TripPlan/english/TP_TripPlan?list=true&railcars=$container_number");
        /*curl_setopt($ch, CURLOPT_VERBOSE, true);
        curl_setopt($ch, CURLOPT_STDERR, $out);
        curl_setopt($ch, CURLOPT_PROXY, '127.0.0.1:8888');

        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0); 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); 
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Host: ecprod.cn.ca',
            'Connection: keep-alive',
            'DNT: 1',
            'User-Agent: Chrome/67.0.3396.99 Safari/537.36',
            'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8',
            'Referer: https://ecprod.cn.ca/velocity/TripPlan/english/Common_DisplayPage?url=TP_INDEX&list=true&railcars='.$container_number,
            'Accept-Encoding: gzip, deflate',
            'Accept-Language: en-US,en;q=0.9'
        ));
        $result = curl_exec($ch);
        /*fclose($out);
        $data = ob_get_clean();
        $data .= PHP_EOL . $result . PHP_EOL;
        if (is_cli()) echo $data;  
        curl_close($ch);
        if (is_cli()){
            echo "[RESULT] => " . PHP_EOL . $result . PHP_EOL;
        }
        $tdData = explode("<td nowrap>",$result);
        if (is_cli()){
            echo "[tdData] => " . PHP_EOL;
            var_dump($tdData);
        }
        if (count($tdData) < 6) {
            return null;
        }
        $etaDate = substr($tdData[5],0,strpos($tdData[5],"</td>"));
        if (is_cli()){
            echo "[etaDate] => " . $etaDate . PHP_EOL;
        }
        $etaStrToTime = new DateTime($etaDate); //date_create($data['newContainers'][$c - 1]['eta']);
        $etaStrToTime->setTime(5, 00);
        echo "[CN.CA etaStrToTime]-> " . $etaStrToTime->format("Y-m-d\TH:i:s") . PHP_EOL;
        $nowTime = new DateTime('now'); //now
        $nowTime->setTime(5, 00);
        $diff = $nowTime->diff($etaStrToTime); //date_diff($nowTime, $etaStrToTime);
        echo "[CN.CA nowTime]-> " . $nowTime->format("Y-m-d\TH:i:s") . PHP_EOL;
        //echo $data['newContainers'][$c - 1]['container_number'] . "= ". $nowTime->format('Y-m-d')." - ". $etaStrToTime->format('Y-m-d') ." =  ". $nowTime->diff($etaStrToTime)->days . "days difference" . PHP_EOL;
        echo "[CN.CA diff]-> " . $diff->days . " days." . PHP_EOL;
        $statusValue = 0;
        if (intVal($diff->invert) === 0) {
            if ($diff->days > 7) {
                $statusValue = 2;
            } else if ($diff->days > 3) {
                $statusValue = 1;
            } else {
                $statusValue = 0;
            }
        } else {
            $statusValue = 0;
        } 
        if (is_cli()){
            echo "[statusValue] => " . $statusValue . PHP_EOL;
        }
        $returnData = array('eta'=>$etaStrToTime, 'status'=>$statusValue);
        return $returnData;
    }*/


}
