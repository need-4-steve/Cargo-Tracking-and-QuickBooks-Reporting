<?php
use
    DataTables\Editor,
    DataTables\Editor\Field,
    DataTables\Editor\Format,
    DataTables\Editor\Mjoin,
    DataTables\Editor\Options,
    DataTables\Editor\Upload,
    DataTables\Editor\Validate,
    DataTables\Editor\ValidateOptions;

class ShipmentsModel extends CI_Model
{
    private $editorDb = null;
    const INACTIVE_RECORDS_ONLY=0;
    const ACTIVE_RECORDS_ONLY=1;
    const ALL_RECORDS=2;

    public function __construct() {
        $this->load->database();
    }

    public function init($editorDb)
    {
        $this->editorDb = $editorDb;
    }

    public function archiveInactiveRecords() {
        $q = $this->db->get_where('shipments', array('is_active' => false))->result_array();
        foreach ($q as $r) { // loop over results
            if ($this->exists_in_archive($r['container_number'])) {
                $this->db->where('container_number', $r['container_number']);
                $result=$this->db->update('archived_shipments', $r);
            } else {
                $query = $this->db->get_where('shipments', array('container_number' => $r['container_number']));
                $row= $query->row_array();
                $this->db->insert('archived_shipments', $row);
            }
            $this->db->where('container_number', $r['container_number'])->delete('shipments');
        }
    }

    public function exists_in_archive($container_number){
        if (is_null($container_number) || empty($container_number)) return false;
        $q = $this->db->get_where('archived_shipments', array('container_number' => $container_number))->result_array();
        if (count($q)<=0) return false;
        return true;
    }

    public function getShipments($post)
    {
        // Build our Editor instance and process the data coming from _POST
        Editor::inst( $this->editorDb, 'shipments', 'id' )
            ->fields(
                Field::inst( 'shipments.status' )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'shipments.po' )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'shipments.product_id' )
                    ->setFormatter( Format::ifEmpty( null ) )
                    ->options( Options::inst()
                        ->table( 'products' )
                        ->value( 'id' )
                        ->label( 'product_name' )
                    )
                    ->validator( 'Validate::dbValues' ),
                Field::inst( 'products.product_name' ),
                Field::inst( 'shipments.container_number' ),
                Field::inst( 'shipments.bill_of_lading' )
                    ->validator( Validate::numeric() ),
                Field::inst( 'shipments.vendor_id' )
                    ->options( Options::inst()
                        ->table( 'vendors' )
                        ->value( 'id' )
                        ->label( 'abbreviation' )
                    )
                    ->validator( 'Validate::dbValues' ),
                Field::inst( 'vendors.abbreviation' ),
                Field::inst( 'shipments.discharge_port' )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'shipments.final_destination' )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'shipments.eta' )
                    ->validator( Validate::dateFormat( 'm-d-Y' ) )
                    ->getFormatter( Format::datetime( 'Y-m-d', 'm-d-Y' ) )
                    ->setFormatter( Format::datetime('m-d-Y', 'Y-m-d' ) ),
                Field::inst( 'shipments.lfd' )
                    ->validator( Validate::dateFormat( 'm-d-Y' ) )
                    ->getFormatter( Format::datetime( 'Y-m-d', 'm-d-Y' ) )
                    ->setFormatter( Format::datetime('m-d-Y', 'Y-m-d' ) ),
                Field::inst( 'shipments.pickup_number' )
                    ->validator( Validate::numeric() )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'shipments.truck_date' )
                    ->validator( Validate::dateFormat('m-d-Y g:i A') )
                    ->getFormatter( Format::datetime('Y-m-d H:i:s','m-d-Y g:i A') )
                    ->setFormatter( Format::datetime('m-d-Y g:i A','Y-m-d H:i:s') ),
                Field::inst( 'shipments.trucker_id' )
                    ->options( Options::inst()
                        ->table( 'truckers' )
                        ->value( 'id' )
                        ->label( 'trucker_name' )
                    )
                    ->validator( 'Validate::dbValues' ),
                Field::inst( 'truckers.trucker_name' ),
                Field::inst( 'shipments.bl_status' ),
                Field::inst( 'shipments.freight' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'shipments.isf_required' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'shipments.customs' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'shipments.po_boolean' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'shipments.qb_rt' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'shipments.qb_ws' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'shipments.requires_payment' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                /*Field::inst( 'shipments.latest_event' ),
                Field::inst( 'shipments.latest_event_time_and_date' )
                    ->validator( Validate::dateFormat( 'Y-m/d H:i:s' ) )
                    ->getFormatter( Format::datetime( 'Y-m/d H:i:s', 'Y-m/d H:i:s' ) )
                    ->setFormatter( Format::datetime( 'Y-m/d H:i:s', 'Y-m/d H:i:s' ) ),*/
                Field::inst( 'shipments.container_size' )
                    ->validator( Validate::numeric() )
                    ->setFormatter( Format::ifEmpty( null ) ),
                    Field::inst( 'shipments.do' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'shipments.has_documents' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'shipments.is_complete' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                    Field::inst( 'shipments.latest_event' )
            )
            ->leftJoin( 'products', 'products.id', '=', 'shipments.product_id' )
            ->leftJoin( 'truckers', 'truckers.id', '=', 'shipments.trucker_id' )
            ->leftJoin( 'vendors', 'vendors.id', '=', 'shipments.vendor_id' )
            ->process( $_POST )
            ->json();
    }

    public function mysql_db_result_query($query) {
        $query = $this->db->query($query);
        return $query->result_array();
    }

    public function mysql_db_row_query($query) {
        $query = $this->db->query($query);
        return $query->row_array();
    }

    public function generic_crud_db_function($action, $table, $conditions, $data ){
        //INSERT SQL Query | SELECT | UPDATE | DELETE
        /*switch (strtoupper($action)) {
            case "INSERT":
                break;
            case "SELECT":
                break;
            case "UPDATE":
                break;
            case "DELETE":
                break;
        }*/
        $this->db->order_by('id', 'desc');
        return $this->db->get('vendors')->result_array();
    }

    public function get_product_id_by_vendor_id($vendor_id){
        if (!isset($vendor_id) || empty($vendor_id)) return NULL;
        $query = $this->db->get_where('vendor_products', array('vendor_id' => $vendor_id));
        $result= $query->row_array();
        if (!isset($result) || empty($result) || !array_key_exists('product_id',$result)) return NULL;
        return $result['product_id'];
    }

    public function mark_everything_inactive(){
        $data = array('is_active' => FALSE);
        $this->db->where('is_active', TRUE);
        $result=$this->db->update('shipments', $data);
        return $result;
    }

    public function set_has_documents($container_number= false, $hasDocuments=true){
        if (is_null($container_number) || empty($container_number) || $container_number === FALSE) return false;
        $this->db->set('has_documents', $hasDocuments);
        $this->db->where('container_number', $container_number);
        $this->db->update('shipments');
        return $this->db->affected_rows();
    }


    public function get_vendor_id_by_name($vendorName=FALSE){
        if ($vendorName === FALSE) return false;
        $query = $this->db->get_where('vendors', array('name' => $vendorName));
        $result= $query->row_array();
        return $result['id'];
    }

    public function get_vendor_associated_product($vendorId=FALSE){
        if ($vendorId === FALSE) return false;
        $query = $this->db->get_where('vendor_products', array('vendor_id' => $vendorId));
        $result= $query->row_array();
        $query2 = $this->db->get_where('products', array('id' => $result['product_id']));
        $result2= $query2->row_array();
        return $result2;
    }

    public function get_vendor_email_list_by_shortname($vendor_abbreviation=FALSE){
        if ($vendor_abbreviation === FALSE) return false;
        $query = $this->db->get_where('vendors', array('abbreviation' => $vendor_abbreviation));
        $result= $query->row_array();
        return $result['email_addresses'];
    }

    public function get_all_vendor_data(){
        $this->db->order_by('id', 'desc');
        return $this->db->get('vendors')->result_array();
    }
    
    public function get_vendor_data_by_id($vendor_id){
        if (!isset($vendor_id) || empty($vendor_id)) return null;
        $query = $this->db->get_where('vendors', array('id' => $vendor_id));
        $result= $query->row_array();
        if (!isset($result) || empty($result)) return NULL;
        return $result;
    }

    public function container_has_files($container_number){
        if (is_null($container_number) || empty($container_number)) return false;
        $query = $this->db->get_where('vendor_documents', array('container_number' => $container_number));
        $rows= $query->result_array();
        if (count($rows)<=0) return false;
        return true;
    }

    public function getISFreq($port_of_discharge=FALSE){
        if (!$port_of_discharge) return false;
        if (strpos($port_of_discharge, 'Prince Rupert') === false) return false;
        return true;
    }
    public function getDOvalue($destination=FALSE){
        if (!$destination) return false;
        if (strpos($destination, 'Memphis') === false) return false;
        return true;
    }

    public function get_by_id($id){
        if (!isset($id) || $id < 0) return null;
        $query = $this->db->get_where('shipments', array('id' => $id));
        $result= $query->row_array();
        if (!isset($result) || empty($result)) return NULL;
        return $result;
    }

    public function get_fields_to_update($selectString,$whereArray){
        $this->db->select( is_null($selectString || empty($selectString)) ? '*' : $selectString );
        $query = $this->db->get_where('shipments', $whereArray);
        $result= $query->row_array();
        if (!isset($result) || empty($result)) return NULL;
        return $result;
    }

    public function get_by_container_number($container_number){
        if (!strpos($container_number,'Unassigned')){
            $this->db->from('shipments');
            $this->db->where('container_number',$container_number);
            $query = $this->db->get();
            $row= $query->row();
            if (!isset($row)) return NULL;
            return $row;
        } else {
            return NULL;
        }
    }
    
    
    public function get_by_po_number($po_number){
        $this->db->from('shipments');
        $this->db->where('po',$po_number);
        $query = $this->db->get();
        $row= $query->row();
        if (!isset($row)) return NULL;
        return $row;
    }

    public function get_by_bol($bol){
        if (!is_null($bol) && !empty($bol)){
            $this->db->from('shipments');
            $this->db->where('bill_of_lading',$bol);
            $query = $this->db->get();
            $results= $query->result_array();
            if (is_null($results) || empty($results)) return NULL;
            return $results;
        } else {
            return NULL;
        }
    }

    public function get_by_vendor_specific_identifier($vendor_identifier=false){
        if (!isset($vendor_identifier) || empty($vendor_identifier)) return null;
        $query = $this->db->get_where('shipments', array('vendor_identifier' => $vendor_identifier));
        $result= $query->row_array();
        if (!isset($result) || empty($result)) return NULL;
        return $result;
    }

    public function update_record($where=array(),$data=array()){
        $this->db->where($where);
        $this->db->update('shipments',$data);
        return $this->db->affected_rows();
    }

    public function add_record($data){
        $this->db->insert('shipments',$data);
        return $this->db->insert_id();
    }

    public function get_unique_records_by_BoL($activeInactiveOrBoth=self::ACTIVE_RECORDS_ONLY){
        $this->db->select('bill_of_lading');
        $this->db->distinct();
        switch ($activeInactiveOrBoth) {
            case self::ACTIVE_RECORDS_ONLY:
                $query = $this->db->get_where('shipments', array('is_active' => self::ACTIVE_RECORDS_ONLY));
                break;
            case self::INACTIVE_RECORDS_ONLY:
                $query = $this->db->get_where('shipments', array('is_active' => self::INACTIVE_RECORDS_ONLY));
                break;
            case self::ALL_RECORDS:
                $query = $this->db->get('shipments');
                break;
            default:
                $query = $this->db->get_where('shipments', array('is_active' => self::ACTIVE_RECORDS_ONLY));
                break;
        }
        $results= $query->result_array();
        return $results;
    }

    public function get_archived_records(){
        $this->db->from('archived_shipments');
        $query = $this->db->get();
        $rows= $query->result_array();
        if (count($rows)<=0) return NULL;
        return $rows;
    }

    public function record_exists($container_number=FALSE){
        if ($container_number === FALSE) return FALSE;
        $query = $this->db->get_where('shipments', array('container_number' => $container_number));
        if(empty($query->row_array())) return false;
        else return true;
    }

}
