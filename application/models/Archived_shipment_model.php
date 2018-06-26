<?php
/* 
 * Generated by CRUDigniter v3.2 
 * www.crudigniter.com
 */
 
class Archived_shipment_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }
    
    /*
     * Get archived_shipment by id
     */
    function get_archived_shipment($id)
    {
        return $this->db->get_where('archived_shipments',array('id'=>$id))->row_array();
    }
    
    /*
     * Get all archived_shipments count
     */
    function get_all_archived_shipments_count()
    {
        $this->db->from('archived_shipments');
        return $this->db->count_all_results();
    }
        
    /*
     * Get all archived_shipments
     */
    function get_all_archived_shipments($params = array())
    {
        $this->db->order_by('id', 'desc');
        if(isset($params) && !empty($params))
        {
            $this->db->limit($params['limit'], $params['offset']);
        }
        return $this->db->get('archived_shipments')->result_array();
    }
        
    /*
     * function to add new archived_shipment
     */
    function add_archived_shipment($params)
    {
        $this->db->insert('archived_shipments',$params);
        return $this->db->insert_id();
    }
    
    /*
     * function to update archived_shipment
     */
    function update_archived_shipment($id,$params)
    {
        $this->db->where('id',$id);
        return $this->db->update('archived_shipments',$params);
    }
    
    /*
     * function to delete archived_shipment
     */
    function delete_archived_shipment($id)
    {
        return $this->db->delete('archived_shipments',array('id'=>$id));
    }
}
