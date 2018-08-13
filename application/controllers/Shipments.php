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
                    if (is_cli()) echo "NO NEW DATA". PHP_EOL;
                    $failSafe = false;
                }
                if ($failSafe) {
                    rsort($emails);
                    $reportEmailFound = false;
                    foreach ($emails as $email_number) {
                        if (is_cli()) echo "[CHECKING EMAILS]". PHP_EOL;    
                        if ($reportEmailFound) {
                            break;
                        }
                        $msgno = imap_msgno($inbox, $email_number);
                        $header = imap_headerinfo($inbox, $msgno);
                        if ($header === false) {
                            if (is_cli()) echo "email header parsing error. line 68 Shipments.php -sv";
                        }
                        $msgBody = imap_body($inbox, $msgno);
                        $overview = imap_fetch_overview($inbox, $msgno, 0) or die("can't fetch overview: " . imap_last_error());
                        if (!$overview) {
                            if (is_cli()) echo "overview failed...container line 73<br/>";
                            $failSafe = false;
                        }
                        if ($failSafe) {
                            $pos = strpos($overview[0]->subject, 'COSCO SHIPPING Lines report, Daily B/L Report');
                            $pos2 = strpos($overview[0]->from, 'coscon@coscon.com');
                            if ($pos !== false && $pos2 !== false) {
                                if (is_cli()) echo "[DAILY_REPORT_EMAIL_FOUND]". PHP_EOL;
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
                                    if (is_cli()) echo "error occurred while setting UNSEEN flag to SEEN. line 142 Shipments.php -sv<br/>";
                                }
                            } else {
                                if (is_cli()) echo "[NOT_REPORT_EMAIL]". PHP_EOL;
                                $setflagUNSEENresult = imap_clearflag_full($inbox, $email_number,"\\Seen", ST_UID);
                                if ($setflagUNSEENresult === false) {
                                    if (is_cli()) echo "error occurred while setting UNSEEN flag. line 148 Shipments.php -sv<br/>";
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
                /*   if (is_cli()) echo "[START]". PHP_EOL;
                if (is_cli()) echo "[num]->".$num.PHP_EOL;*/
                $start = 1;
                /*  if (is_cli()) echo "dataRows[0][0]=>".$dataRows[0][0].PHP_EOL;*/
                if (strpos($dataRows[0][0], 'sep=') !== false) {
                    $start = 2;
                }

                /*  foreach ($dataRows as $key=>$value){
                if (is_cli()) echo $key.'=>';
                if (is_cli()) print_r($value);
                if ($key > 2) {break;}
                }
                if (is_cli()) echo 'start=>'.$start;
                return;*/
                for ($c = $start; $c < count($dataRows); $c++) {
                    if (is_cli()) echo "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[+++START_CONTAINER_PROCESSING+++]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]".PHP_EOL;
                    if (is_cli()) echo "[c]->" . $c . PHP_EOL;
                    $extraDigit='';
                    $completeCN='';
                    $valueCount = count($dataRows[$c]);
                    $dataRow_bol = trim(substr($dataRows[$c][0], 2, 10));
                    if (is_cli()) echo "[dataRow_bol]->" . $dataRow_bol . PHP_EOL;
                    $dataRow_CN = $dataRows[$c][1];
                    if (is_cli()) echo "[dataRow_CN ORIGINAL]->" . $dataRow_CN . PHP_EOL;
                    if ($dataRow_CN === 'Unassigned') {
                        $dataRow_CN = "[" . $dataRow_bol . "]";
                        $completeCN=$dataRow_CN;
                    } else {
                        if (strpos($dataRow_CN, '-') !== false) {
                            $lengthOfCN = strpos($dataRow_CN, '-');
                            $tempCNval = substr($dataRow_CN, 0, (($lengthOfCN > 4) ? $lengthOfCN : strlen($dataRow_CN)));
                            $dataRow_CN = $tempCNval;
                            if (is_cli()) echo "[dataRow_CN AFTER REMOVAL OF HYPHENATED NUMBER]->" . $dataRow_CN . PHP_EOL;
                            $extraDigit = substr($dataRows[$c][1],-1);
                            $completeCN=$dataRow_CN.$extraDigit;
                        }
                    }
                    if (is_cli()) echo "[dataRow_CN]->" . $dataRow_CN . PHP_EOL;
                    $data['newContainers'][$c - 1]['bill_of_lading'] = $dataRow_bol;
                    $data['newContainers'][$c - 1]['container_number'] = $completeCN;
                    $data['newContainers'][$c - 1]['latest_event'] = $dataRows[$c][13];
                    if (is_cli()) echo "[bill_of_lading]->" . $dataRow_bol . PHP_EOL;
                    if (is_cli()) echo "[container_number]->" . $dataRow_CN . PHP_EOL;
                    $containerDataExists = $this->ShipmentsModel->record_exists($dataRow_CN);
                    if (!$containerDataExists){
                        if (is_cli()) echo "[CONTAINER NUMBER IS CORRECT]=>".$dataRow_CN.PHP_EOL;
                        $containerDataExists = $this->ShipmentsModel->record_exists($completeCN);
                        if ($containerDataExists){
                            if (is_cli()) echo '[CONTAINER STORED AS]=>\t'.$completeCN . PHP_EOL;
                        } else {
                            if (is_cli()) echo '[CONTAINER NOT FOUND]'.PHP_EOL;
                        }
                    } else {
                        if ($dataRows[$c][1] !== 'Unassigned') {
                            if (is_cli()) echo "[CONTAINER NUMBER IS NOT CORRECT]=>".$dataRow_CN.PHP_EOL;
                            if (is_cli()) echo "[ADDING EXTRA DIGIT]=>".$extraDigit.PHP_EOL;
                            $this->ShipmentsModel->update_record(array('container_number' => $dataRow_CN),array('container_number' => $completeCN));
                        } else {
                            if (is_cli()) echo "[CONTAINER NUMBER UNASSIGNED]". PHP_EOL; 
                        }
                    }
                    $dataRow_CN = $completeCN;
                    if (is_cli()) echo "[NEW VALUE FOR dataRow_CN]=>".$dataRow_CN.PHP_EOL;    
                    //first, check if the container_number is already in our database, if it is, just grab the latest_event data
                    if (is_cli()) echo "[containerDataExists?]->" . $containerDataExists . PHP_EOL;
                    if ($containerDataExists) {
                        if (is_cli()) echo "[YES EXISTS]->" . $dataRow_CN . PHP_EOL;
                        $reportContainerData = array();
                        if (is_cli()) echo "[REPORT DATA FOR EXISTING CONTAINER] => ". PHP_EOL;
                        for ($d = 2; $d < count($columnNames); $d++) {
                            $key = $columnNames[$d];
                            $reportContainerData[$key] = $dataRows[$c][$d];
                            if (is_cli()) echo "[key]->" . $key . "\t[value]=>" . $reportContainerData[$key] . PHP_EOL;
                            if ($key === 'eta' || $key === 'latest_event_timestamp') {
                                if (!is_null($reportContainerData['eta']) && strlen($reportContainerData[$key]) >= 15) {
                                    $reportContainerData[$key] = trim(substr($reportContainerData[$key], 0, 16));
                                    $reportContainerData[$key] = date('m/d/Y H:II', strtotime($reportContainerData[$key]));
                                } else {
                                    $reportContainerData[$key] = null;
                                }
                            }
                        }
                        $data['newContainers'][$c - 1] = (array) $this->ShipmentsModel->get_by_container_number($dataRow_CN);
                        $updateValues['container_number']=$dataRow_CN;
                        $updateValues = $this->ShipmentsModel->get_fields_to_update('container_number, discharge_port, final_destination, vendor_id, product_id, bl_status, truck_date, latest_event, latest_event_time_and_date, eta, status, qb_ws, qb_rt, rcvd, is_complete', array('container_number' => $dataRow_CN));
                        if (is_cli()) echo 'updateValues pulled from db....'.PHP_EOL;
                        if (is_cli()) print_r($updateValues);     
                        $updateValues['final_destination'] = $reportContainerData['destination_city'] . ', ' . $reportContainerData['destination_state'];                        
                        $updateValues['discharge_port'] = $reportContainerData['discharge_port'];
                        $reportContainerData['vendor_name'] = str_replace("Limited.","Limited",$reportContainerData['vendor_name']);
                        $reportContainerData['vendor_name'] = str_replace("Ltd.","Ltd",$reportContainerData['vendor_name']);
                        $updateValues['vendor_id'] = $this->ShipmentsModel->get_vendor_id_by_name($reportContainerData['vendor_name']);
                        $updateValues['product_id'] = $this->ShipmentsModel->get_product_id_by_vendor_id($updateValues['vendor_id']);
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
                        if (is_cli()) echo "[etaDataRowString] => ". $etaDataRowString . PHP_EOL;
                        if (!is_null($etaDataRowString) && !empty($etaDataRowString) && strlen($etaDataRowString) > 11) {
/*                            if (!is_null($etaDataRowString) && strlen($etaDataRowString) >= 15) {*/
                            if (strpos($etaDataRowString, '(')!==false){
                                $etaDataRowString = trim(substr($etaDataRowString, 0, strpos($etaDataRowString, '(')));
                            }
                            $etaDataRowDate = DateTime::createFromFormat('m/d/Y G:i', $etaDataRowString);
                            if (is_cli()) echo "[ETA DATA ROW STRING]->" . $etaDataRowString . PHP_EOL;
                            if ($etaDataRowDate < new DateTime('2017-01-01 12:00')) {
                                $etaDataRowDate = null;
                            }
                            $etaDataRowDate->setTime(5, 00);
                            $nowTime = new DateTime('now'); //now
                            $nowTime->setTime(5, 00);
                            if (is_cli()) echo "[ETA DATA ROW DATE]->" . $etaDataRowDate->format('m-d-Y G:i') . PHP_EOL;
                            $diff = $nowTime->diff($etaDataRowDate); //date_diff($nowTime, $etaStrToTime);
                            if (is_cli()) echo "[NOW DATE]->" . $nowTime->format('m-d-Y G:i') . PHP_EOL;
                            if (is_cli()) echo "[DIFF]->" . $diff->days . " days." . PHP_EOL;
                            $updateValues['eta'] = $etaDataRowDate->format('Y-m-d');
                            if (is_cli()) echo "[updateValues{eta} VALUE]->" . $etaDataRowDate->format('Y-m-d') . PHP_EOL;
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
                        } else {
                            //null eta
                            $updateValues['eta'] = null;
                            $updateValues['status'] = 0;
                        }
                        /* if (!is_null($updateValues['qb_rt']) && !is_null($updateValues['qb_ws']) && $updateValues['qb_rt'] === true && $updateValues['qb_ws'] === true) {
                            $updateValues['status'] = 3;
                        }*/
                        if (is_cli()) echo "[CURRENT_STATUS] =>".$updateValues['status'].PHP_EOL;
                        $updateValues['is_complete']=false;
                        if (is_cli()) echo "[IS_COMPLETE CHECK START]".PHP_EOL;
                        if (!is_null($updateValues['rcvd']) && $updateValues['rcvd'] === true) {
                            $updateValues['status'] = 3;
                            $updateValues['is_complete']=true;
                            if (is_cli()) echo "\t[IS_COMPLETE CONDITION#1(rcvd===true?)] =>".$updateValues['is_complete']." \n\t\t=> updateValues[status] => ". $updateValues['status'] . PHP_EOL;
                        } else {
                            if (is_cli()) echo "\t[IS_COMPLETE CONDITION#1(rcvd===true?)] =>".$updateValues['is_complete']." \n\t\t=> updateValues[status] => ". $updateValues['status'] . PHP_EOL;
                        }
                        if (!is_null($updateValues['qb-rt']) && $updateValues['qb-rt'] === true && !is_null($updateValues['qb-ws']) && $updateValues['qb-ws'] === true ) {
                            $updateValues['status'] = 3;
                            $updateValues['is_complete']=true;
                            if (is_cli()) echo "\t[IS_COMPLETE CONDITION#2(qb-rt+qb-ws===true?)] =>".$updateValues['is_complete']." \n\t\t=> updateValues[status] => ". $updateValues['status'] . PHP_EOL;                            
                        } else {
                            if (is_cli()) echo "\t[IS_COMPLETE CONDITION#2(qb-rt+qb-ws===true?)] =>".$updateValues['is_complete']." \n\t\t=> updateValues[status] => ". $updateValues['status'] . PHP_EOL;                            
                        }
                        if (!is_null($updateValues['truck_date'])){
                            $truckDate = new DateTime($updateValues['truck_date']);
                            $nowTime = new DateTime('now'); //now
                            if ($truckDate <= $nowTime) {
                                $updateValues['status']=3;
                                $updateValues['is_complete']=true;
                                if (is_cli()) echo "\t[IS_COMPLETE CONDITION#3(truck_date < now_date?)] =>".$updateValues['is_complete']." \n\t\t=> updateValues[status] => ". $updateValues['status'] . PHP_EOL;                                                            
                            } else {
                                if (is_cli()) echo "\t[IS_COMPLETE CONDITION#3(truck_date < now_date?)] =>".$updateValues['is_complete']." \n\t\t=> updateValues[status] => ". $updateValues['status'] . PHP_EOL;                                                            
                            }
                        }

                        $updateValues['is_complete']= (strpos($reportContainerData['latest_event'], 'Empty Container Returned') !== false ? true : false);
                        if ($updateValues['is_complete']) $updateValues['status']=3;
                        if (is_cli()) echo "\t[IS_COMPLETE CONDITION#4(latest_event==='Empty Container Returned'?)] =>".$updateValues['is_complete']." \n\t\t=> updateValues[status] => ". $updateValues['status'] . PHP_EOL;                                                            
                        if (is_cli()) echo "{[data['newContainers'][$c - 1]}->update_record " . PHP_EOL;
                        $updateValues['latest_event']=$reportContainerData['latest_event'];
                        $updateValues['bl_status']=$reportContainerData['bl_status'];
                        if (is_cli()) print_r($updateValues);
                        if (!$updateValues['is_complete'] && strpos($dataRow_CN,'[')===false) $allContainersString.=$dataRow_CN.'+';
                        $this->ShipmentsModel->update_record(array('container_number' => $updateValues['container_number']),
                            array('latest_event_time_and_date' => (is_null($updateValues['latest_event_time_and_date']) || empty($updateValues['latest_event_time_and_date'])) ? null : $updateValues['latest_event_time_and_date'],
                                'eta' => $updateValues['eta'],
                                'status' => $updateValues['status'],
                                'discharge_port' => $updateValues['discharge_port'],
                                'final_destination' => $updateValues['final_destination'],
                                'vendor_id' => $updateValues['vendor_id'],
                                'product_id' => $updateValues['product_id'],
                                'bl_status' => $updateValues['bl_status'],
                                'latest_event' => $updateValues['latest_event'],
                                'is_complete' => $updateValues['is_complete'],
                                'is_active' => true //$updateValues['is_active']
                            )
                        );
                        $data['newContainers'][$c - 1] = $this->ShipmentsModel->get_by_container_number($updateValues['container_number']);
                        if (is_cli()) echo "data['newContainers'][$c - 1]=>".PHP_EOL;
                        if (is_cli()) print_r($data['newContainers'][$c - 1]);
                        if (is_cli()) echo "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[{{{END_CONTAINER_UPDATE}}}]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]".PHP_EOL;
                    } else {
                        //load associative array with data
                        $data['newContainers'][$c - 1]['container_number'] = $dataRow_CN;
                        $data['newContainers'][$c - 1]['bill_of_lading'] = $dataRow_bol;
                        if (strpos($dataRow_CN,'[')===false) $allContainersString.=$dataRow_CN.'+';
                        if (is_cli()) echo "[NOPE DONT EXIST]->" . $dataRows[$c][1] . PHP_EOL;
                        for ($d = 2; $d < count($columnNames); $d++) {
                            $key = $columnNames[$d];
                            $value = $dataRows[$c][$d];
                            if (is_cli()) echo "[key]->" . $key . "\t[value]=>" . $value . PHP_EOL;
                            if ($key === 'eta' || $key === 'latest_event_timestamp') {
                                if (is_cli()) echo "[ETA-KEY]->". $value . PHP_EOL;
                                if (!is_null($value)) {
                                    $data['newContainers'][$c - 1][$key] = trim(substr($value, 0, 16));
                                    //DateTime::createFromFormat('m/d/Y G:i', $etaDataRowString)
                                    $data['newContainers'][$c - 1][$key] = DateTime::createFromFormat('m/d/Y G:i', $data['newContainers'][$c - 1][$key]);
                                } else {
                                    if (is_cli()) echo "[ETA-KEY]->NULL" . PHP_EOL;
                                    $data['newContainers'][$c - 1][$key] = null;
                                }
                            } else {
                                $data['newContainers'][$c - 1][$key] = $value;
                            }
                        }
                        $statusValue = -1;
                        $etaStrToTime = null;
                        if (is_cli()) print_r($data['newContainers'][$c-1]);
                        //the process that data appropriately for a new entry
                        if (!is_null($data['newContainers'][$c - 1]['eta']) && ($data['newContainers'][$c - 1]['eta'] < new DateTime('2017-01-01 12:00'))) {
                           /* $data['newContainers'][$c - 1]['eta'] = new DateTime('now');
                            //null eta
                            //date_add($updateValues['eta'], date_interval_create_from_date_string('50 years'));
                            $data['newContainers'][$c - 1]['eta']->add(new DateInterval('P1Y'));*/
                            $data['newContainers'][$c - 1]['eta'] = null;
                            $data['newContainers'][$c - 1]['status'] = 3;
                            $statusValue = 3;
                            if (is_cli()) echo 'NULL ETA1'.PHP_EOL;
                        } else if (!is_null($data['newContainers'][$c - 1]['eta']) && !empty($data['newContainers'][$c - 1]['eta'])) {
                            $etaStrToTime = $data['newContainers'][$c - 1]['eta']; //date_create($data['newContainers'][$c - 1]['eta']);
                            $etaStrToTime->setTime(5, 00);
                            if (is_cli()) echo "[NEW ENTRY etaStrToTime]-> " . $etaStrToTime->format("Y-m-d\TH:i:s") . PHP_EOL;
                            $nowTime = new DateTime('now'); //now
                            $nowTime->setTime(5, 00);
                            $diff = $nowTime->diff($etaStrToTime); //date_diff($nowTime, $etaStrToTime);
                            if (is_cli()) echo "[NEW ENTRY nowTime]-> " . $nowTime->format("Y-m-d\TH:i:s") . PHP_EOL;
                            //if (is_cli()) echo $data['newContainers'][$c - 1]['container_number'] . "= ". $nowTime->format('Y-m-d')." - ". $etaStrToTime->format('Y-m-d') ." =  ". $nowTime->diff($etaStrToTime)->days . "days difference" . PHP_EOL;
                            if (is_cli()) echo "[NEW ENTRY diff]-> " . $diff->days . " days." . PHP_EOL;
                            if (intVal($diff->invert) === 0) {
                                if ($diff->days > 7) {
                                    $statusValue = 2;
                                } else if ($diff->days > 3) {
                                    $statusValue = 1;
                                } else {
                                    $statusValue = 0;
                                }
                                //if (is_cli()) echo $data['newContainers'][$c - 1]['container_number'] . "[statusValue]= ". $statusValue. PHP_EOL;
                                //if (is_cli()) echo $nowTime->format('m-d-y') . " to ". $etaStrToTime->format('m-d-y') . " = " . $nowTime->diff($etaStrToTime)->days . " days. statusValue=>" .$statusValue. PHP_EOL;
                            } else {
                                $statusValue = 0;
                                //if (is_cli()) echo $data['newContainers'][$c - 1]['container_number'] . "[statusValue]= ". $statusValue." <-NEGATIVE" . PHP_EOL;
                            }
                            if (is_cli()) echo "[NEW ENTRY statusValue]-> " . $statusValue . PHP_EOL;
                        } else {
                            if (is_cli()) echo 'NULL ETA2'.PHP_EOL;
                            $data['newContainers'][$c - 1]['eta'] = new DateTime('now');
                            //null eta
                            //date_add($updateValues['eta'], date_interval_create_from_date_string('50 years'));
                            /*$data['newContainers'][$c - 1]['eta']->add(new DateInterval('P1Y'));
                            $data['newContainers'][$c - 1]['eta'] = $data['newContainers'][$c - 1]['eta']->format('Y-m-d');*/
                            $data['newContainers'][$c - 1]['eta'] =null;
                            $data['newContainers'][$c - 1]['status'] = 3;
                            $statusValue = 3;
                        }
                        $data['newContainers'][$c - 1]['status'] = $statusValue;
                        $data['newContainers'][$c - 1]['final_destination'] = $data['newContainers'][$c - 1]['destination_city'] . ', ' . $data['newContainers'][$c - 1]['destination_state'];
                        $data['newContainers'][$c - 1]['vendor_name'] = str_replace("Limited.","Limited",$data['newContainers'][$c - 1]['vendor_name']);
                        $data['newContainers'][$c - 1]['vendor_name'] = str_replace("Ltd.","Ltd",$data['newContainers'][$c - 1]['vendor_name']);
                        $data['newContainers'][$c - 1]['vendor_id'] = $this->ShipmentsModel->get_vendor_id_by_name($data['newContainers'][$c - 1]['vendor_name']);
                        $data['newContainers'][$c - 1]['product_id'] = $this->ShipmentsModel->get_product_id_by_vendor_id($data['newContainers'][$c - 1]['vendor_id']);
                        $data['newContainers'][$c - 1]['isf_required'] = $this->ShipmentsModel->getISFreq($data['newContainers'][$c - 1]['discharge_port']);
                        $data['newContainers'][$c - 1]['do'] = $this->ShipmentsModel->getDOvalue($data['newContainers'][$c - 1]['destination_city']);
                        $data['newContainers'][$c - 1]['latest_event_time_and_date'] =$data['newContainers'][$c - 1]['latest_event_timestamp'];
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
                            'eta' => empty($data['newContainers'][$c - 1]['eta']) ? null : $data['newContainers'][$c - 1]['eta']->format('Y-m-d'),
                            'bl_status' => $data['newContainers'][$c - 1]['bl_status'],
                            'container_size' => $data['newContainers'][$c - 1]['container_size'],
                            'latest_event' => $data['newContainers'][$c - 1]['latest_event'],
                            'latest_event_time_and_date' =>!empty($data['newContainers'][$c - 1]['latest_event_timestamp']) ? $data['newContainers'][$c - 1]['latest_event_timestamp']->format("Y-m-d\TH:i:s"):null,
                            'is_active' => true,
                            'is_complete' => $data['newContainers'][$c - 1]['is_complete'],
                            'do' => $data['newContainers'][$c - 1]['do']);
                        $newId = $this->ShipmentsModel->add_record($updateData);
                        if (is_cli()) echo "[NEW ENTRY ADDED newId]-> " . $newId . PHP_EOL;
                        if (!is_null($data['newContainers'][$c - 1]['eta']) && !is_null($etaStrToTime) && !empty($data['newContainers'][$c - 1]['eta'])) {
                            $etaStartDate = $etaStrToTime;
                            if (is_cli()) echo "[eta]" . $data['newContainers'][$c - 1]['eta']->format("Y-m-d") . PHP_EOL;
                            if (is_cli()) echo "[etaStart]" . $etaStartDate->format('Y-m-d') . PHP_EOL;
                            date_time_set($etaStartDate, 00, 0);
                            $etaEndDate = $etaStrToTime;
                            date_time_set($etaEndDate, 23, 59);
                            if (is_cli()) echo "[etaEnd]" . $etaStartDate->format('Y-m-d') . PHP_EOL;
                            $md5CheckValue = md5($data['newContainers'][$c - 1]['container_number'] . '->ETA->' . $data['newContainers'][$c - 1]['eta']->format("Y-m-d") );
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
                        if (is_cli()) echo "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[{{{END_ADD_NEW_CONTAINER}}}]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]".PHP_EOL;
                    }
                }
                if (is_cli()) echo "[END OF FOR dataRows[c][d] LOOP]" . PHP_EOL;
                $allContainersString=substr($allContainersString,0,-1);
                if (is_cli()) echo "[START CN.CA QUERY]=> $allContainersString" . PHP_EOL;
                $this->get_cn_data($allContainersString);
                if (is_cli()) echo "[END CN.CA QUERY]" . PHP_EOL;
                if (is_cli()) echo "[START LFD+PICKUP#]" . PHP_EOL;
                $curlData = array();
                $uniqueBoLs = $this->ShipmentsModel->get_unique_records_by_BoL(1);
                for ($i = 0; $i < count($uniqueBoLs); $i++) {
                    $bol = $uniqueBoLs[$i]["bill_of_lading"];
                    if (is_cli()) echo "[LFD+PICKUP# FOR BOL]->" . $bol . PHP_EOL;
                    $curlData = $this->get_lfd_and_pickup_number_from_bol($bol);
                    $containers = $this->ShipmentsModel->get_by_bol($bol);
                    foreach ($containers as $container) {
                        if (is_cli()) echo "[UPDATING CN]->" . $container['container_number'] . PHP_EOL;
                        if (is_cli()) print_r($curlData);
                        $lfdTestValue = new DateTime($curlData['lfd']);
                        if ($lfdTestValue < new DateTime('01-01-2015')) $curlData['lfd']='';
                        $this->ShipmentsModel
                            ->update_record(array('container_number' => $container['container_number']),
                                array('lfd' => (empty($curlData['lfd']) ? null : date("Y-m-d", strtotime($curlData['lfd']))),
                                    'pickup_number' => (empty($curlData['pickup_number']) ? null : $curlData['pickup_number']),
                                    'bl_status' => (is_null($curlData['bl_status']) || empty($curlData['bl_status']) ? (is_null($container['bl_status']) || empty($container['bl_status']) ? "Not Released" : $container['bl_status'] ) : $curlData['bl_status'])));
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
                                'md5_container_number_and_date' => $md5CheckLFDValue
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
                if (is_cli()) echo "[END LFD/Pickup# LOOP]";
            } else {
                $data['newContainers'] = false;
            }
            /*[END OF LOADING CSV DATA INTO data ARRAY] */
            $this->ShipmentsModel->archiveInactiveRecords();
            $data['title'] = "Active Shipments";
            if (is_cli()) echo "Start time: $starttime" . PHP_EOL;
            $endtime = microtime(true);
            if (is_cli()) echo "End time: $endtime" . PHP_EOL;
            //execution time of the script
            $execution_time = ($endtime - $starttime); //gets run time in secs
            $execution_time = round($execution_time, 2); //makes time two decimal places long
            if (is_cli()) echo 'Total Execution Time: ' . $execution_time . ' Secs' . PHP_EOL;
        } else {
            $containers= json_decode(json_encode($this->ShipmentsModel->get_all_containers()));
            foreach ($containers as $container){
                $container->final_destination = str_replace("Texas","TX",$container->final_destination);
                $container->final_destination = str_replace("Tennessee","TN",$container->final_destination);
                $container->final_destination = str_replace("North Carolina","NC",$container->final_destination);
                $container->final_destination = str_replace("South Carolina","SC",$container->final_destination);
                $container->final_destination = str_replace("California","CA",$container->final_destination);
                $container->discharge_port = trim(str_replace("(Intended)"," ",$container->discharge_port));
                $this->ShipmentsModel->update_record(array('container_number' => $container->container_number),
                                                        array('final_destination' => $container->final_destination,'discharge_port' => $container->discharge_port)
            );
            }
            /* else not a command line call.... */
            $data['title'] = "Active Shipments";
			$endtime = microtime(true);
            $execution_time = ($endtime - $starttime); //gets run time in secs
            $execution_time = round($execution_time, 2); //makes time two decimal places long
            $data['time_taken'] =  "Start time: $starttime" . PHP_EOL;
            $data['time_taken'].=  "End time: $endtime" . PHP_EOL;
            $data['time_taken'].=  'Total Execution Time: ' . $execution_time . ' Secs' . PHP_EOL;
            $this->load->view('templates/header', $data);
            $this->check_for_eta_updates();
            $this->get_cn_data();
            $this->check_for_email_documents();
            $this->fix_inconsistencies();
            $this->load->view('shipments/index', $data);
            $this->load->view('templates/footer');
        }
    }



    public function fix_inconsistencies(){
        $yearDigits = date('y');
        $allShipments = json_decode(json_encode($this->ShipmentsModel->get_all_containers()));
        if (is_cli()) echo '[START FIXING INCONSISTENCIES]' .PHP_EOL;
        foreach($allShipments as $shipment){
            $shipmentChanges=array();
            if (is_cli()) echo '[START SHIPMENT FIXING]=>' .PHP_EOL;
            if (is_cli()) echo '[container_number]=>'.$shipment->container_number .PHP_EOL;
            if (!is_null($shipment->po) && !empty($shipment->po)&&strlen($shipment->po === 2)) {
                $shipment->po = '';
                $shipmentChanges['po']='';
            }
            if (!is_null($shipment->po) && !empty($shipment->po) && strlen($shipment->po) > 0) {
                $shipmentVendor = json_decode(json_encode($this->ShipmentsModel->get_vendor_data_by_id($shipment->vendor_id)));
                if (is_null($shipmentVendor)) continue;
                if (is_cli()) echo '[VENDOR]=>' .PHP_EOL;
                if (is_cli()) print_r($shipmentVendor);
               
                if (strpos($shipment->po,$shipmentVendor->document_initials)===false){
                    $shipment->po=$shipmentVendor->document_initials.$shipment->po;
                    if (is_cli()) echo '[EDIT shipment->po]=> ' . $shipment->po .PHP_EOL;
                    $shipmentChanges['po']=$shipment->po;
                }
                if (strpos($shipment->po,'WD'.'-'.$yearDigits)!==false){
                    if (is_cli()) echo '[FIX WANDA PO BEFORE]=> ' . $shipment->po .PHP_EOL;
                    $shipment->po=str_replace('WD'.'-'.$yearDigits,'WD'.$yearDigits,$shipment->po);
                    if (is_cli()) echo '[FIX WANDA PO AFTER]=> ' . $shipment->po .PHP_EOL;
                    $shipmentChanges['po']=$shipment->po;
                }
                if (strpos($shipment->po,'WD'.$yearDigits)!==false && strpos($shipment->po,'WD'.$yearDigits.'-')===false){
                    if (is_cli()) echo '[FIX WANDA PO BEFORE]=> ' . $shipment->po .PHP_EOL;
                    $shipment->po=str_replace('WD'.$yearDigits,'WD'.$yearDigits.'-',$shipment->po);
                    if (is_cli()) echo '[FIX WANDA PO AFTER]=> ' . $shipment->po .PHP_EOL;
                    $shipmentChanges['po']=$shipment->po;
                }
                
            }
            $documents=$this->Document_model->get_all_documents_associated_with_cn_label($shipment->container_number);
            if (is_cli()) echo '[DOCUMENTS]=> ' .PHP_EOL;
            $documentChanges=array();
            if ($documents!==false){
                $shipment->has_documents=true;
                $shipmentChanges['has_documents']=$shipment->has_documents;
                if (is_cli()) echo '[DOCUMENT[0] ID]=>' .$documents[0]['id'].PHP_EOL;
                if (is_cli()) echo '[DOCUMENT[0] PO_NUMBER]=>' .$documents[0]['po_number'].PHP_EOL;
                /*$shipment->po=$documents[0]['po_number'];
                $shipmentChanges['po']=$documents[0]['po_number'];*/
                if ($documents[0]['po_number']!=="00000"){
                    $shipment->po=$documents[0]['po_number'];
                    if (strpos($shipment->po,'WD'.$yearDigits)!==false && strpos($shipment->po,'WD'.$yearDigits.'-')===false){
                        if (is_cli()) echo '[FIX WANDA PO BEFORE]=> ' . $shipment->po .PHP_EOL;
                        $shipment->po=str_replace('WD'.$yearDigits,'WD'.$yearDigits.'-',$shipment->po);
                        if (is_cli()) echo '[FIX WANDA PO AFTER]=> ' . $shipment->po .PHP_EOL;
                        $shipmentChanges['po']=$shipment->po;
                    }
                } else {
                    if (!is_null($shipment->po) && !empty($shipment->po) && strlen($shipment->po) > 2){
                        $documentChanges['po_number']=$shipment->po;
                    }
                }
                $shipment->file_directory=$documents[0]['filepath'];
                $shipmentChanges['file_directory']=$shipment->file_directory;
                if (is_cli()) echo '[EDIT shipment->has_documents]=> ' . $shipment->has_documents .PHP_EOL;
                if (is_cli()) echo '[EDIT shipment->file_directory]=> ' . $shipment->file_directory .PHP_EOL;
                $documentChanges['shipment_id']=$shipment->id;
                $documentChanges['identifying_label']=$shipment->container_number;
                foreach($documents as $doc){
                    if (is_cli()) echo '[DOC]=> '.PHP_EOL;
                    if (is_cli()) print_r($doc);
                    $docPoNumber = $doc['po_number'];
                    if (strpos($docPoNumber,'WD'.$yearDigits)!==false && strpos($docPoNumber,'WD'.$yearDigits.'-')===false){
                        if (is_cli()) echo '[FIX WANDA DOCUMENT PO IN BEFORE]=> ' . $doc['po_number'] .PHP_EOL;
                        $doc['po_number']=str_replace('WD'.$yearDigits,'WD'.$yearDigits.'-',$docPoNumber);
                        if (is_cli()) echo '[FIX WANDA DOCUMENT PO IN AFTER]=> ' . $doc['po_number'] .PHP_EOL;
                        $documentChanges['po_number']=$doc['po_number'];
                    }
                    $this->Document_model->update_document($doc['id'],$documentChanges);
                }
            } else {
                $documents2=$this->Document_model->get_all_documents_associated_with_po($shipment->po);
                if ($documents2!==false){
                    $shipment->has_documents=true;
                    $shipmentChanges['has_documents']=$shipment->has_documents;
                    $shipment->file_directory=$documents2[0]['filepath'];
                    $shipmentChanges['file_directory']=$shipment->file_directory;
                    if (is_cli()) echo '[EDIT2 shipment->has_documents]=> ' . $shipment->has_documents .PHP_EOL;
                    if (is_cli()) echo '[EDIT2 shipment->file_directory]=> ' . $shipment->file_directory .PHP_EOL;
                    foreach($documents2 as $doc){
                        if (is_cli()) echo '[DOC2]=> '.PHP_EOL;
                        if (is_cli()) print_r($doc);
                        $this->Document_model->update_document($doc['id'],array('shipment_id'=>$shipment->id, 'identifying_label'=>$shipment->container_number));
                        if (is_cli()) echo '[EDIT2 shipment->has_documents]=> ' . $shipment->has_documents .PHP_EOL;
                    }
                } else {
                    if (strpos($shipment->po,'WD'.$yearDigits)!==false && strpos($shipment->po,'WD'.$yearDigits.'-')!==false){
                        $wrongFormattedPO= str_replace('WD'.$yearDigits.'-','WD'.$yearDigits,$shipment->po);
                        $documents3=$this->Document_model->get_all_documents_associated_with_po($wrongFormattedPO);
                        if ($documents3!==false){
                            if (is_cli()) echo '[FIX WANDA DOCUMENT PO IN BEFORE]=> ' . $wrongFormattedPO .PHP_EOL;
                            $rightFormattedPO= str_replace('WD'.$yearDigits,'WD'.$yearDigits.'-',$doc['po_number']);
                            if (is_cli()) echo '[FIX WANDA DOCUMENT PO IN AFTER]=> ' . $rightFormattedPO .PHP_EOL;
                            $shipment->has_documents=true;
                            $shipmentChanges['has_documents']=$shipment->has_documents;
                            $shipment->file_directory=$documents3[0]['filepath'];
                            $shipmentChanges['file_directory']=$shipment->file_directory;
                            if (is_cli()) echo '[EDIT3 shipment->has_documents]=> ' . $shipment->has_documents .PHP_EOL;
                            if (is_cli()) echo '[EDIT3 shipment->file_directory]=> ' . $shipment->file_directory .PHP_EOL;
                            foreach($documents3 as $doc){
                                if (is_cli()) echo '[DOC3]=> '.PHP_EOL;
                                if (is_cli()) print_r($doc);
                                $this->Document_model->update_document($doc['id'],array('shipment_id'=>$shipment->id, 'identifying_label'=>$shipment->container_number,'po_number'=>$rightFormattedPO));
                                if (is_cli()) echo '[EDIT3 shipment->has_documents]=> ' . $shipment->has_documents .PHP_EOL;
                            }
                        } else {
                            $shipmentChanges['has_documents']=false;                
                        }
                    } else {
                        $shipmentChanges['has_documents']=false;
                    }
                }
            }
            if ($shipment->has_documents){
                if (is_cli()) echo '[FIXING SHIPMENT PATH] '.$shipment->container_number.'=>' .$shipment->file_directory.PHP_EOL;
                $shipment->file_directory=trim(str_replace("/vendor_documents"," ",$shipment->file_directory));
                $shipment->file_directory=trim(str_replace($_SERVER['DOCUMENT_ROOT'],"      ",$shipment->file_directory));
                if (is_cli()) echo '[FIXED DOCUMENT PATH]=>'.$shipment->container_number.'=>' .$shipment->file_directory    .PHP_EOL;
                $shipmentChanges['file_directory']=$shipment->file_directory;
            }
            if (is_cli()) echo '[UDPATING CONTAINER]=> ' . $shipment->container_number .PHP_EOL;
            $this->ShipmentsModel->update_record(array('id'=>$shipment->id),$shipmentChanges);
            if (is_cli()) echo '[END SHIPMENT FIXING]' .PHP_EOL;
        }
        if (is_cli()) echo '[END FIXING INCONSISTENCIES]' .PHP_EOL;
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
                    if (is_cli()) echo "email_number: $mail ".PHP_EOL." msgNo: $msgno".PHP_EOL;
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
                                if (is_cli()) {
                                    echo "[CONTAINER_DATA]=>".$bolContainer['container_number']. PHP_EOL;
                                    print_r($bolContainer);
                                }
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
								echo 'attachments downloaded...' . PHP_EOL;
								print_r($vendorSender);
							}
                            /*$tmpAttachments = array();
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
                            }
                            unset($tmpAttachments);*/
                            foreach ($attachments as $attachment) {
                                $documentBL = '';
                                $documentCN = '';
                                $documentCNmultiple = array();
                                $documentType = '';
                                $associatedCargoData = null;
                                $filename = '';
                                $yearDigits = date('y');
                                $fullPathAndFileName = '';
                                $vendorIdLabelForDocuments = '';
                                $multiple_containers = false;
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
                                    if (is_cli()) echo "$tmpFileDir=>strtoupper(associatedVendorData['abbreviation'])=>".strtoupper($associatedVendorData['abbreviation']). PHP_EOL;
                                    if (strtoupper(trim($attachment['file_extension'])) === 'OCTET-STREAM') {
                                        $attachment['file_extension'] = substr($filename, strlen($filename) - 3, strlen($filename));
                                    }

                                    switch (strtoupper($vendorSender['abbreviation'])) {
                                        case null:
                                            if (is_cli()) echo "SENT INTERNALLY...." . PHP_EOL; 
                                            $vendorIdLabelForDocuments="NA";
                                            $documentType = "Document"; 
                                            $vendorIdLabelForDocuments="NA";
                                            if (preg_match_all('/' . '[A-Z]{4}[0-9]{7}/', $overview[0]->subject, $matches)) {
                                                if (is_cli()) echo $overview[0]->subject. " => preg_match result ...." . PHP_EOL; 
                                                if (is_cli()) print_r($matches[0]);
                                                $documentCNmultiple = array_unique($matches[0]);
                                                if (is_cli()) print_r($documentCNmultiple); 
                                                if (count($documentCNmultiple)>1)$multiple_containers=true; 
                                                $documentCN=$documentCNmultiple[0];
                                                if (is_cli()) echo "documentCN=>" .$documentCN . PHP_EOL; 
                                                foreach($documentCNmultiple as $resultContainer) {
                                                    $this->ShipmentsModel->update_record(array('container_number' => $resultContainer), array('vendor_identifier' => $vendorIdLabelForDocuments, 'has_documents' => true));
                                                }
                                                $associatedCargoData = json_decode(json_encode($this->ShipmentsModel->get_by_container_number($documentCN)));
                                                if (is_cli()) echo "associatedCargoData" . PHP_EOL; 
                                                if (is_cli()) print_r($associatedCargoData);
                                                //$documentCN = substr(trim($match[0]), strpos($textContent, $match[0]) + 2, strlen($match[0]));
                                                if (is_cli()) echo "documentCN => ".$documentCN.PHP_EOL;
                                                $poPlaceholder = substr($overview[0]->subject,0,strpos($overview[0]->subject,$documentCN)-1);
                                                if (is_cli()) echo "poPlaceholder => ".$poPlaceholder.PHP_EOL;
                                                $documentInitials = substr($poPlaceholder,0,2);
                                                if ($documentInitials==="JT") $documentInitials="JX";
                                                if (is_cli()) echo "documentInitials=>" .  $documentInitials . PHP_EOL; 
                                                foreach ($vendors as $vendor) {
                                                    if (strtoupper($documentInitials)===strtoupper($vendor['document_initials'])) {
                                                        $associatedVendorData=$this->ShipmentsModel->get_vendor_data_by_id($vendor['id']);
                                                        if (is_cli()) echo 'NEW VENDOR ASSOCIATION for '.$filename.': '. PHP_EOL;
                                                        if (is_cli())print_r($associatedVendorData);
                                                        break;
                                                    }
                                                }
                                            } else if (strpos($filename,"LB$yearDigits-")!==false) {
                                                if (preg_match('/LB'.$yearDigits.'-[0-9]{3}/', $filename, $match)){
                                                    $poPlaceholder = str_replace("LB","WD",$match[0]);
                                                    $associatedCargoData = json_decode(json_encode($this->ShipmentsModel->get_by_po_number($poPlaceholder)));
                                                    if (is_cli()) echo "associatedCargoData" . PHP_EOL; 
                                                    if (is_cli()) print_r($associatedCargoData);
                                                    //$documentCN = substr(trim($match[0]), strpos($textContent, $match[0]) + 2, strlen($match[0]));
                                                    if (is_cli()) echo "documentCN => ".$documentCN.PHP_EOL;
                                                    $associatedVendorData=$this->ShipmentsModel->get_vendor_id_by_initials("WD");
                                                    if (is_cli()) echo 'NEW VENDOR ASSOCIATION for '.$filename.': '. PHP_EOL;
                                                    if (is_cli())print_r($associatedVendorData);
                                                    $documentType=$attachment['file_extension'];
                                                }
                                            } else {
                                                break 2;
                                            }
                                            $yearDigits = date('y');
                                            if (strpos(strtoupper($poPlaceholder),'WD'.$yearDigits)!==false && strpos(strtoupper($poPlaceholder),'WD'.$yearDigits.'-')===false){
                                                if (is_cli()) echo '[FIX WANDA LIBRA-EMAIL DOCUMENT PO BEFORE]=> ' . $poPlaceholder .PHP_EOL;
                                                $poPlaceholder=str_replace('WD'.$yearDigits,'WD'.$yearDigits.'-',strtoupper($poPlaceholder));
                                                if (is_cli()) echo '[FIX WANDA LIBRA-EMAIL DOCUMENT PO AFTER]=> ' . $poPlaceholder .PHP_EOL;
                                            }
                                          /*if (is_cli()) echo "SENT INTERNALLY...." . PHP_EOL;
                                            $email_subject_data = $overview[0]->subject;
                                            $specifics = explode('-',$email_subject_data);
                                            $poPlaceholder=$specifics[0];
                                            for($numbernumber=1;$numbernumber<count($specifics)-1;$numbernumber++){
                                                $poPlaceholder.='-'.$specifics[$numbernumber];
                                            }
                                            $vendorIdLabelForDocuments="NA";
                                            $documentType = "Document";
                                            if (strpos($specifics[count($specifics)-1],'/')!==false) {
                                                $multiple_containers=true;
                                                $documentCNmultiple = explode($specifics[count($specifics)-1], '/');
                                                $documentCN = $documentCNmultiple[0];
                                                if (is_cli()) echo "Multiple Containers Associated...". PHP_EOL;
                                                if (is_cli()) print_r($documentCNmultiple);
                                                $associatedCargoData=json_decode(json_encode($this->ShipmentsModel->get_by_container_number($documentCNmultiple[0])));
                                                if (is_cli()) "associatedCargoData = > " . $documentCNmultiple[0]. PHP_EOL;
                                                foreach ($documentCNmultiple as $cn){
                                                    $this->ShipmentsModel->update_record(array('container_number' => $cn), array('vendor_identifier' => $vendorIdLabelForDocuments, 'has_documents' => true));
                                                }
                                            } else {
                                                $documentCN = $specifics[count($specifics)-1];
                                                if (is_cli())echo "Container =>".$documentCN. PHP_EOL;
                                                $this->ShipmentsModel->update_record(array('po' => $poPlaceholder), array('vendor_identifier' => $vendorIdLabelForDocuments, 'has_documents' => true));
                                            }
                                            if (is_cli()) echo "PO =>".$poPlaceholder.PHP_EOL;
                                            $initialsFromSpecifics=substr($specifics[0],0,2);
                                            if (is_cli()) echo "initialsFromSpecifics=>". $initialsFromSpecifics . PHP_EOL;
                                            $associatedVendorData = array('document_initials'=>$initialsFromSpecifics);
                                            if (is_cli()) echo "123123=>". $initialsFromSpecifics . PHP_EOL;*/
                                            break;
                                        case "WANDA":
                                            if (is_cli()) echo 'attachment[file_extension]=>'.strtoupper($attachment['file_extension']).PHP_EOL;
                                            $lbNumber='';
                                            if (strpos($filename,'-')===false){
                                                if (preg_match('/LB\d{2}/', $filename, $match)) {
                                                    $lbNumber = trim($match[0]);
                                                } else if (preg_match('/LB\d{3}/', $filename, $match)) {
                                                    $lbNumber = trim($match[0]);
                                                }
                                                $lbNumber = str_replace('LB','',$lbNumber);
                                                if (strlen($lbNumber)===2) $lbNumber='0'.$lbNumber;
                                            } else {
                                                if (preg_match('/' . 'LB'.$yearDigits.'-\d{3}/', $filename, $match)) {
                                                    $lbNumber = trim($match[0]);                                            
                                                } else if (preg_match('/' . 'LB'.$yearDigits.'-\d{2}/', $filename, $match)){
                                                    $lbNumber = trim($match[0]);                                            
                                                }
                                                $lbNumber = str_replace('LB'.$yearDigits.'-','',$lbNumber);
                                                if (strlen($lbNumber)===2) $lbNumber='0'.$lbNumber;
                                            }
                                            if (is_cli()) echo "lbNumber => ".$lbNumber . PHP_EOL;
                                            $poPlaceholder="WD$yearDigits-$lbNumber";
                                            switch (strtoupper($attachment['file_extension'])) {
                                                case "PDF":
                                                    if (is_cli()) echo 'wanda pdf=>'.PHP_EOL;
                                                    $documentType = "Bill_of_Lading";
                                                    /* Local Server -> */
                                                    /*$pdf = new \TonchikTm\PdfToHtml\Pdf($tmpFileDir, [
                                                        'pdftohtml_path' => 'C:/xampp/htdocs/assets/poppler0.51/bin/pdftohtml.exe',
                                                        'pdfinfo_path' => 'C:/xampp/htdocs/assets/poppler0.51/bin/pdfinfo.exe',
                                                    ]);*/
                                                    /* Di's Server ->
                                                     $pdf = new \TonchikTm\PdfToHtml\Pdf($tmpFileDir, [
                                                        'pdftohtml_path' => 'F:/xampp/htdocs/assets/poppler0.51/bin/pdftohtml.exe',
                                                        'pdfinfo_path' => 'F:/xampp/htdocs/assets/poppler0.51/bin/pdfinfo.exe',
                                                    ]);
                                                    */
                                                    /*$pdfInfo = $pdf->getInfo();
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
                                                    }*/
                                                    break;
                                                case "XLS":
                                                    if (is_cli()) echo 'wanda xls=>'.PHP_EOL;
                                                    $documentType = "Parts_List";
                                                    /*$associatedCargoData = $this->ShipmentsModel->get_by_vendor_specific_identifier($associatedVendorData['document_initials'] . $vendorIdLabelForDocuments);
                                                    if (is_null($associatedCargoData) || empty($associatedCargoData)) {
                                                        break;
                                                    }
                                                    $poPlaceholder = $associatedCargoData['po'];
                                                    $associatedCargoData = $this->ShipmentsModel->update_record(array('container_number' => $associatedCargoData['container_number'], 'has_documents' => true));
                                                    */
                                                    break;
                                                default:
                                                    //otherwise, store in 'Other' documents folder
                                                    $documentType = "Other";
                                                    break;
                                            }
                                            $associatedCargoData = json_decode(json_encode($this->ShipmentsModel->get_by_po_number($poPlaceholder,$associatedVendorData['document_initials'])),true);
                                            if (is_cli()) echo "got associatedCargoData ". PHP_EOL;
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
                                                    if (is_cli()) echo 'NEW VENDOR ASSOCIATION for '.$filename.': '. PHP_EOL;
                                                    if (is_cli())print_r($associatedVendorData);
                                                    break;
                                                }
                                            }
                                            if (is_cli()) echo "jianxin pdf=>$tmpFileDir".PHP_EOL;
                                            /* Local Server -> */
                                            $pdf = new \TonchikTm\PdfToHtml\Pdf($tmpFileDir, [
                                                'pdftohtml_path' => 'C:/xampp/htdocs/assets/poppler0.51/bin/pdftohtml.exe',
                                                'pdfinfo_path' => 'C:/xampp/htdocs/assets/poppler0.51/bin/pdfinfo.exe',
                                            ]);
                                            /* Di's server ->
                                            $pdf = new \TonchikTm\PdfToHtml\Pdf($tmpFileDir, [
                                                'pdftohtml_path' => 'F:/xampp/htdocs/assets/poppler0.51/bin/pdftohtml.exe',
                                                'pdfinfo_path' => 'F:/xampp/htdocs/assets/poppler0.51/bin/pdfinfo.exe',
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
                                                        //$poPlaceholder = substr($poPlaceholder,strlen($regexStart),strlen($poPlaceholder));
                                                        //same as above with a different function:
															//$poPlaceholder = str_replace($regexStart,'',$poPlaceHolder);
                                                        if (is_cli()){
															echo "VENDOR DOCUMENT INITIALS => ". $regexStart. PHP_EOL;
                                                            echo "PO FOUND (with vendor initials) => ". $poPlaceholder. PHP_EOL;
                                                            echo "MATCHES:".PHP_EOL;
                                                            print_r($matches);
														}
                                                        $associatedCargoData = json_decode(json_encode($this->ShipmentsModel->get_by_po_number($poPlaceholder,$associatedVendorData['document_initials'])),true);
                                                        if (is_cli()) echo "got associatedCargoData ". PHP_EOL;
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
                                   /* if (is_cli()) echo "this=>". $initialsFromSpecifics . PHP_EOL;*/
                                    //generate the document storage directory structure name
                                    if ((is_null($associatedCargoData) || empty($associatedCargoData)) && empty($documentCN)) {
                                        //if (is_cli()) echo "xx=>". $initialsFromSpecifics . PHP_EOL;
                                        $associatedCargoData = json_decode(json_encode($this->ShipmentsModel->get_by_po_number($poPlaceholder,$associatedVendorData['document_initials'])),true);
                                        if (is_cli()) echo "associatedCargoData=>" . PHP_EOL;
                                        if (is_null($associatedCargoData)){
                                            if (is_cli()) echo "null" . PHP_EOL;
                                            //save to folder for unassociated files...or maybe do a manual save or something? idk yet but i'll figure it out...
                                            /*$associatedVendorData=json_encod*/
                                            $dirDate = date("mdy");
                                            if ($attachment['file_extension'] === 'OCTET-STREAM') {
                                                $attachment['file_extension'] = 'XLS';
                                            }
                                            $directoryStructure = $_SERVER['DOCUMENT_ROOT'] . "/" . "vendor_documents/UNASSOCIATED_FILES/$dirDate/" . strtoupper($associatedVendorData['abbreviation']) . "/" . "$poPlaceholder/" . $attachment['file_extension'] . "/";
                                        }else{
                                            if (is_cli()) echo "CARGO ENTRY FOUND AT THE LAST MINUTE => ".$associatedCargoData['container_number'].PHP_EOL;
                                            if (is_cli())print_r($associatedCargoData);
                                            if (is_cli()) echo "PO NUMBER => ".$poPlaceholder.PHP_EOL;
                                            $this->ShipmentsModel->update_record(array('po' => $poPlaceholder), array('vendor_identifier' => $vendorIdLabelForDocuments, 'has_documents' => true));
                                            $documentCN=$associatedCargoData['container_number'];
                                            $directoryStructure = $_SERVER['DOCUMENT_ROOT'] . "/" . "vendor_documents/" . trim($poFolderName) . '/';
                                        }
                                    } else {
                                        /*if (is_cli()) echo "oo=>". $initialsFromSpecifics . PHP_EOL;*/
                                        $yearDigits = date('y');
                                        if (is_cli()) echo "LAST SECTION =>  ". PHP_EOL;
                                        /*if (is_cli()) echo "initialsFr1235245656856797697omSpecifics=>". $initialsFromSpecifics . PHP_EOL;*/
                                        $this->ShipmentsModel->update_record(array('container_number' => $documentCN), array('po' => $poPlaceholder));
                                        if (is_cli()) echo "container_number=>" .$documentCN. PHP_EOL;
                                        if (is_cli()) echo "PO=>" .$poPlaceholder. PHP_EOL;
                                        if (is_null($documentCN) || empty($documentCN)) $documentCN = "NO_CN";
                                        if (strpos(strtoupper($poPlaceholder),$associatedVendorData['document_initials'].$yearDigits.'-')===false) {
                                            $poFolderName = $associatedVendorData['document_initials'] . $yearDigits . '-' . $poPlaceholder . ' ' . $documentCN;
                                        } else {
                                            $poFolderName = $poPlaceholder . ' ' . $documentCN;
                                        }
                                        if (is_cli()) echo "poFolderName=>" .$poFolderName . PHP_EOL;
                                        $directoryStructure = $_SERVER['DOCUMENT_ROOT'] . "/" . "vendor_documents/" . trim($poFolderName) . '/';
                                        //a better way to do it would be to use directories for each data piece
                                        //  ie-> for a wanda invoice from 2018 with PO 123456 and CN ABCD123456
                                        //       $directoryName=$_SERVER['DOCUMENT_ROOT'] . "/vendor_documents" .
                                        //                       "/$vendor" . "/$current_year" . "/purchse_order_number" .
                                        //                       "/$container_number" . "/document_type" . "/$filename";
                                        //$directoryStructure .= '/' . strtoupper($documentType) . '/';
                                        $this->ShipmentsModel->set_has_documents($documentCN, true);
                                    }
                                    if (is_null($documentCN) || empty($documentCN)) $documentCN = "NO_CN";
                                    if (strpos(strtoupper($poPlaceholder),$associatedVendorData['document_initials'].$yearDigits.'-')===false) {
                                        $poFolderName = $associatedVendorData['document_initials'] . $yearDigits . '-' . $poPlaceholder . ' ' . $documentCN;
                                    } else {
                                        $poFolderName = $poPlaceholder . ' ' . $documentCN;
                                    }
                                    $directoryStructure = $_SERVER['DOCUMENT_ROOT'] . "/" . "vendor_documents/" . trim($poFolderName) . '/'; 
                                    $fullPathAndFileName = $directoryStructure . $filename;
                                    if (!file_exists(dirname($fullPathAndFileName))) {
                                        mkdir(dirname($fullPathAndFileName), 0777, true);
                                    }
                                    $md5_hash = md5($attachment['attachment']);
                                    if (!empty($documentCN)){
                                        $associatedCargoData = (array) json_decode(json_encode($this->ShipmentsModel->get_by_container_number($documentCN)));
                                        if (is_cli()) {
                                            echo "associatedCargoData=>" . PHP_EOL;
                                            print_r($associatedCargoData);
                                            echo 'about to add document to database' . PHP_EOL;
                                        }
                                    }
                                    if (file_put_contents($fullPathAndFileName, $attachment['attachment']) && !$this->Document_model->md5_file_exists($md5_hash)) {
                                        $documentData = array(
                                            'filename' => $filename,
                                            'filepath' => $directoryStructure,
                                            'file_extension' => $attachment['file_extension'],
                                            'shipment_id' => (is_null($associatedCargoData) ? null : $associatedCargoData['id']),
                                            'md5_hash' => $md5_hash,
                                            'identifying_label' => $documentCN,
                                            'creation_timestamp' => date("Y-m-d H:i:s"),
                                            'document_type' => $documentType,
                                            'vendor_id' => $associatedVendorData['id'],
                                            'po_number' => $poPlaceholder
                                        );
                                        $newDocumentId = $this->Document_model->add_document($documentData);
                                        $this->ShipmentsModel->update_record(array('container_number'=>$documentCN),array('file_directory'=>$poFolderName));
                                    }
                                    if ($multiple_containers){
                                        if (is_cli()) echo "round 2..." . PHP_EOL;
                                        for($counter=1;$counter<count($documentCNmultiple);$counter++){
                                            $documentCN = $documentCNmultiple[$counter];
                                            $this->ShipmentsModel->update_record(array('container_number' => $documentCN), array('po' => $poPlaceholder));
                                            if (strpos(strtoupper($poPlaceholder),$associatedVendorData['document_initials'].$yearDigits.'-')===false) {
                                                $poFolderName = $associatedVendorData['document_initials'] . $yearDigits . '-' . $poPlaceholder . ' ' . $documentCN;
                                            } else {
                                                $poFolderName = $poPlaceholder . ' ' . $documentCN;
                                            }
                                            $directoryStructure = $_SERVER['DOCUMENT_ROOT'] . "/" . "vendor_documents/" . trim($poFolderName) . '/';
                                            //a better way to do it would be to use directories for each data piece
                                            //  ie-> for a wanda invoice from 2018 with PO 123456 and CN ABCD123456
                                            //       $directoryName=$_SERVER['DOCUMENT_ROOT'] . "/vendor_documents" .
                                            //                       "/$vendor" . "/$current_year" . "/purchse_order_number" .
                                            //                       "/$container_number" . "/document_type" . "/$filename";
                                            //$directoryStructure .= '/' . strtoupper($documentType) . '/';
                                            $this->ShipmentsModel->set_has_documents($documentCN, true);
                                            $filename = str_replace('.','-'.$counter.'.',$filename);
                                            $fullPathAndFileName = $directoryStructure . $filename;
                                            if (!file_exists(dirname($fullPathAndFileName))) {
                                                mkdir(dirname($fullPathAndFileName), 0777, true);
                                            }
                                            $associatedCargoData= (array) json_decode(json_encode($this->ShipmentsModel->get_by_container_number($documentCN)));
                                            $md5_hash = md5($attachment['attachment']);
                                            if (file_put_contents($fullPathAndFileName, $attachment['attachment']) && !$this->Document_model->md5_file_exists($md5_hash.'-'.$counter)) {
                                                $documentData = array(
                                                    'filename' => $filename,
                                                    'filepath' => $directoryStructure,
                                                    'file_extension' => $attachment['file_extension'],
                                                    'shipment_id' => (is_null($associatedCargoData) ? null : $associatedCargoData['id']),
                                                    'md5_hash' => $md5_hash.'-'.$counter,
                                                    'identifying_label' => $documentCN,
                                                    'creation_timestamp' => date("Y-m-d H:i:s"),
                                                    'document_type' => $documentType,
                                                    'vendor_id' => $associatedVendorData['id'],
                                                    'po_number' => $poPlaceholder
                                                );
                                                $newDocumentId = $this->Document_model->add_document($documentData);
                                                $this->ShipmentsModel->update_record(array('container_number'=>$documentCN),array('file_directory'=>$poFolderName));
                                            }
                                        }
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

    public function get_lfd_and_pickup_number_from_bol($bol){
        $ch = curl_init();
        $requestTime = microtime(true);
        $requestUrl = "http://elines.coscoshipping.com/ebtracking/public/booking/$bol?timestamp=$requestTime";
        curl_setopt($ch, CURLOPT_URL, $requestUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_ENCODING, "gzip");
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
        if (is_cli()) "[LFD RESPONSE CN: ".$bol."]". PHP_EOL;

        curl_close($ch);
        $jsonData = json_decode($output, true);
        if (is_cli()) print_r($jsonData);
        if (!empty($jsonData['data']['content']['cargoTrackingContainer'])) {
            $return = array('lfd' => $jsonData['data']['content']['cargoTrackingContainer'][0]['lfd'], 'pickup_number' => $jsonData['data']['content']['cargoTrackingContainer'][0]['pickUpNumber'], 'bl_status' => $jsonData['data']['content']['blRealStatus']);
        } else {
            $return = array('lfd' => null, 'pickup_number' => null, 'bl_status' => $jsonData['data']['content']['blRealStatus']);
        }
		if (is_cli()) "[RETURN VALUE]". PHP_EOL;
		if (is_cli()) print_r($return);
		return $return;
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
        $allContainers = array();
        if (empty($container_numbers)){
            $containers = json_decode(json_encode($this->ShipmentsModel->get_all_containers()));
            if (is_cli()) var_dump($containers);
            foreach ($containers as $container) {
                if (strpos($container->container_number,"[")===false) {
                    $container_numbers.=substr($container->container_number,0,-1).'+';
                    $allContainers[]=$container->container_number;
                }
            }
            $container_numbers = substr($container_numbers,0,-1);
            if (is_cli()) echo "[container_numbers] => ". PHP_EOL . $container_numbers . PHP_EOL;
        } else {
            $allContainers=explode("+", $container_numbers);
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
            echo "[RESPONSE]=> ". PHP_EOL. $response . PHP_EOL ."[END RESPONSE]" . PHP_EOL;
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
            $shortenedContainerNumber = $somethingWorthwhile[0].$somethingWorthwhile[1];
            $destinationCheckValue = $somethingWorthwhile[count($somethingWorthwhile)-4];
            $fullContainerNumber='';
            if (ctype_digit($testVal) && strlen($testVal)===6 && strpos($destinationCheckValue,'PRIRUPTERBC')===false){
                foreach($allContainers as $aContainer){
                    if (strpos($aContainer,$shortenedContainerNumber)!==false) {
                        $fullContainerNumber = $aContainer;
                        break;
                    }
                }
                if (is_cli()){
                    echo "[SUCCESS]=>(shortened)".$somethingWorthwhile[0].$somethingWorthwhile[1] . "==>>>(full)".$fullContainerNumber. PHP_EOL;
                    print_r($testVal);
                    echo PHP_EOL;
                }
                $testVal=substr($testVal,0,-2);
                $testValMM = substr($testVal,0,2);
                $testValDD = substr($testVal,2,2);
                $yearDigits = date('y');
                $testVal=$testValMM. '/' . $testValDD . '/' . $yearDigits;
                $etaStrToTime = new DateTime($testVal); //date_create($data['newContainers'][$c - 1]['eta']);
                $etaStrToTime->setTime(5, 00);
                if (is_cli()) echo "[CN.CA etaStrToTime]-> " . $etaStrToTime->format("Y-m-d\TH:i:s") . PHP_EOL;
                $nowTime = new DateTime('now'); //now
                $nowTime->setTime(5, 00);
                $diff = $nowTime->diff($etaStrToTime); //date_diff($nowTime, $etaStrToTime);
                if (is_cli()) echo "[CN.CA nowTime]-> " . $nowTime->format("Y-m-d\TH:i:s") . PHP_EOL;
                //echo $data['newContainers'][$c - 1]['container_number'] . "= ". $nowTime->format('Y-m-d')." - ". $etaStrToTime->format('Y-m-d') ." =  ". $nowTime->diff($etaStrToTime)->days . "days difference" . PHP_EOL;
                if (is_cli()) echo "[CN.CA diff]-> " . $diff->days . " days." . PHP_EOL;
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
                    echo "[statusValue] => " . $statusValue . PHP_EOL.PHP_EOL;
                }
                $container = json_decode(json_encode($this->ShipmentsModel->get_by_container_number($fullContainerNumber)));
                $this->ShipmentsModel->update_record(array('container_number' => $fullContainerNumber),
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
