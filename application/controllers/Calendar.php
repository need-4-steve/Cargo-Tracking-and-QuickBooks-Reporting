<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Calendar extends CI_Controller {

    public function __construct() {
        Parent::__construct();
    }

    public function index() {
        $this->load->view('templates/header');
        $this->load->view("calendar/index.php", array('title'=>"Libra Cargo Event Calendar"));
        $this->load->view('templates/footer');
    }

    public function get_events() {
        // Our Start and End Dates
        $start = $this->input->get("start");
        $end = $this->input->get("end");
        $startdt = new DateTime('now'); // setup a local datetime
        $startdt->setTimestamp($start); // Set the date based on timestamp
        $start_format = $startdt->format('Y-m-d H:i:s');
        $enddt = new DateTime('now'); // setup a local datetime
        $enddt->setTimestamp($end); // Set the date based on timestamp
        $end_format = $enddt->format('Y-m-d H:i:s');

        $events = $this->Calendar_Model->get_events($start_format, $end_format);
        $data_events = array();
        foreach ($events as $r) {
            $data_events[] = array(
                "id" => $r['ID'],
                "title" => $r['title'],
                "event_type" => $r['event_type'],
                "description" => $r['description'],
                "end" => $r['end'],
                "start" => $r['start'],
                "shipment_id" => $r['shipment_id'],
                "md5" => $r['md5_container_number_and_date']
            );
        }
        echo json_encode(array("events" => $data_events));
        exit();
    }

    public function add_event() {
        /* Our calendar data */
        $name = $this->input->post("name", true);
        $event_type = ((null !== $this->input->post("event_type", true)) ? $this->input->post("event_type", true) : 'N/A');
        $desc = $this->input->post("description", true);
        $start_date = $this->input->post("start_date", true);
        $end_date = $this->input->post("end_date", true);
        $shipment_id = $this->input->post("shipment_id", true);
        $shipment_data = $this->ShipmentsModel->get_by_id($shipment_id);
        $md5 = md5($shipment_data['container_number'] . '->'. strtoupper($event_type) .'->' . $shipment_data['lfd']);;
        unset($shipment_data);

        if (!empty($start_date)) {
            $sd = DateTime::createFromFormat("Y/m/d H:i", $start_date);
            $start_date = $sd->format('Y-m-d H:i:s');
            $start_date_timestamp = $sd->getTimestamp();
        } else {
            $start_date = date("Y-m-d H:i:s", time());
            $start_date_timestamp = time();
        }
        if (!empty($end_date)) {
            $ed = DateTime::createFromFormat("Y/m/d H:i", $end_date);
            $end_date = $ed->format('Y-m-d H:i:s');
            $end_date_timestamp = $ed->getTimestamp();
        } else {
            $end_date = date("Y-m-d H:i:s", time());
            $end_date_timestamp = time();
        }

        $this->Calendar_Model->add_event(array(
            "title" => $name, "event_type" => $event_type, "description" => $desc, 
            "start" => $start_date, "end" => $end_date, "shipment_id" => $shipment_id, "md5" => $md5
        ));
        redirect(site_url("calendar"));
    }

    public function edit_event() {
        $eventid = intval($this->input->post("eventid"));
        $event = $this->Calendar_Model->get_event($eventid);
        if ($event->num_rows() == 0) {
            echo "Invalid Event";
            exit();
        }
        $event->row();
        /* Our calendar data */
        $name = $this->common->nohtml($this->input->post("name"));
        $event_type = $this->common->nohtml($this->input->post("event_type"));
        $desc = $this->common->nohtml($this->input->post("description"));
        $start_date = $this->common->nohtml($this->input->post("start_date"));
        $end_date = $this->common->nohtml($this->input->post("end_date"));
        $shipment_id = $this->common->nohtml($this->input->post("shipment_id"));
        $shipment_data = $this->ShipmentsModel->get_by_id($shipment_id);
        $md5 = md5($shipment_data['container_number'] . '->'. strtoupper($event_type) .'->' . $shipment_data['lfd']);;
        unset($shipment_data);
        $delete = intval($this->input->post("delete"));

        if (!$delete) {
            if (!empty($start_date)) {
                $sd = DateTime::createFromFormat("Y/m/d H:i", $start_date);
                $start_date = $sd->format('Y-m-d H:i:s');
                $start_date_timestamp = $sd->getTimestamp();
            } else {
                $start_date = date("Y-m-d H:i:s", time());
                $start_date_timestamp = time();
            }
            if (!empty($end_date)) {
                $ed = DateTime::createFromFormat("Y/m/d H:i", $end_date);
                $end_date = $ed->format('Y-m-d H:i:s');
                $end_date_timestamp = $ed->getTimestamp();
            } else {
                $end_date = date("Y-m-d H:i:s", time());
                $end_date_timestamp = time();
            }
            $this->Calendar_Model->update_event($eventid, array(
                "title" => $name, "event_type" => $event_type, "description" => $desc, 
                "start" => $start_date, "end" => $end_date, "shipment_id" => $shipment_id, "md5" => $md5
            ));
        } else {
            $this->Calendar_Model->delete_event($eventid);
        }
        redirect(site_url("calendar"));
    }

}
