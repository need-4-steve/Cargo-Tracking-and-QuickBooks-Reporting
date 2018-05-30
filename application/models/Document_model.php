<?php

class Document_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    /*
     * Get document by id
     */
    public function get_document($id)
    {
        return $this->db->get_where('vendor_documents', array('id' => $id))->row_array();
    }

    public function get_document_by_md5_hash ($md5_hash)
    {
        return $this->db->get_where('vendor_documents', array('md5_hash' => $md5_hash))->row_array();
    }

    public function get_document_by_filename ($filename)
    {
        return $this->db->get_where('vendor_documents', array('filename' => $filename))->row_array();
    }

    public function md5_file_exists($md5){
        if (is_null($md5) || empty($md5)) return false;
        $query = $this->db->get_where('vendor_documents', array('md5_hash' => $md5));
        $rows= $query->result_array();
        if (count($rows)<=0) return false;
        return true;
    }

    /*
     * Get all documents
     */
    public function get_all_documents()
    {
        $this->db->order_by('id', 'desc');
        return $this->db->get('vendor_documents')->result_array();
    }

    public function get_all_documents_associated_with_shipment ($shipment_id)
    {
        if (is_null($shipment_id) || empty($shipment_id)) return false;
        $query = $this->db->get_where('vendor_documents', array('shipment_id' => $shipment_id));
        $this->db->order_by('creation_timestamp', 'desc');
        $rows= $query->result_array();
        if (count($rows)<=0) return false;
        return $rows;
    }

    public function get_documents_by_type ($document_type)
    {
        if (is_null($document_type) || empty($document_type)) return false;
        $query = $this->db->get_where('vendor_documents', array('document_type' => $document_type));
        $this->db->order_by('creation_timestamp', 'desc');
        $rows= $query->result_array();
        if (count($rows)<=0) return false;
        return $rows;
    }

    public function get_all_documents_associated_with_container_number ($container_number)
    {
        if (is_null($container_number) || empty($container_number)) return false;
        $query = $this->db->get_where('shipments', array('container_number' => $container_number));
        $container= $query->row_array();
        if (is_null($container) || empty($container)) return false;
        $query2 = $this->db->get_where('vendor_documents', array('shipment_id' => $container['id']));
        $this->db->order_by('creation_timestamp', 'desc');
        $rows= $query2->result_array();
        if (count($rows)<=0) return false;
        return $rows;
    }

    /*
     * function to add new document
     */
    public function add_document($params)
    {
        $this->db->insert('vendor_documents', $params);
        return $this->db->insert_id();
    }

    /*
     * function to update document
     */
    public function update_document($id, $params)
    {
        $this->db->where('id', $id);
        return $this->db->update('vendor_documents', $params);
    }

    /*
     * function to delete document
     */
    public function delete_document($id)
    {
        return $this->db->delete('vendor_documents', array('id' => $id));
    }
}
