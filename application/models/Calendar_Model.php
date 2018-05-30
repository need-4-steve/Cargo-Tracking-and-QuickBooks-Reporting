<?php

class Calendar_Model extends CI_Model
{
    public function get_events($start, $end)
    {
        return $this->db->where("start >=", $start)->where("end <=", $end)->get("calendar_events");
    }
    
    public function add_event($data)
    {
        $this->db->insert("calendar_events", $data);
    }
    
    public function get_event($id)
    {
        return $this->db->where("ID", $id)->get("calendar_events");
    }

    public function get_event_by_md5($md5)
    {
        if (is_null($md5) || empty($md5)) return false;
        return $this->db->where("md5_container_number_and_date", $md5)->get("calendar_events");
    }
    
    public function check_md5_if_event_exists($md5){
        if (is_null($md5) || empty($md5)) return false;
        $query = $this->db->get_where('calendar_events', array('md5_container_number_and_date' => $md5));
        $rows= $query->result_array();
        if (count($rows)<=0) return false;
        return true;
    }

    public function update_event($id, $data)
    {
        $this->db->where("ID", $id)->update("calendar_events", $data);
    }
    
    public function delete_event($id)
    {
        $this->db->where("ID", $id)->delete("calendar_events");
    }

}

?>