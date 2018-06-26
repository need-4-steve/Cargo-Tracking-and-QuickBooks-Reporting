<?php
/* 
 * Generated by CRUDigniter v3.2 
 * www.crudigniter.com
 */
 
class Calendar_event_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }
    
    /*
     * Get calendar_event by ID
     */
    function get_calendar_event($ID)
    {
        return $this->db->get_where('calendar_events',array('ID'=>$ID))->row_array();
    }
        
    /*
     * Get all calendar_events
     */
    function get_all_calendar_events()
    {
        $this->db->order_by('ID', 'desc');
        return $this->db->get('calendar_events')->result_array();
    }
        
    /*
     * function to add new calendar_event
     */
    function add_calendar_event($params)
    {
        $this->db->insert('calendar_events',$params);
        return $this->db->insert_id();
    }
    
    /*
     * function to update calendar_event
     */
    function update_calendar_event($ID,$params)
    {
        $this->db->where('ID',$ID);
        return $this->db->update('calendar_events',$params);
    }
    
    /*
     * function to delete calendar_event
     */
    function delete_calendar_event($ID)
    {
        return $this->db->delete('calendar_events',array('ID'=>$ID));
    }
}
