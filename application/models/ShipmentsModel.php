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
            $this->db->insert('archived_shipments', $r); // insert each row to another table
            $this -> db -> where('id', $r['id']);
            $this -> db -> delete('shipments');
        }
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
                    ->validator( Validate::dateFormat('m-d-Y g:i A', ValidateOptions::inst()->allowEmpty( false )))
                    ->getFormatter( Format::datetime('Y-m-d H:i:s','m-d-Y g:i A'))
                    ->setFormatter( Format::datetime('m-d-Y g:i A','Y-m-d H:i:s')),
                Field::inst( 'shipments.lfd' )
                    ->validator( Validate::dateFormat( 'm-d-y' ) )
                    ->getFormatter( Format::dateSqlToFormat( 'm-d-y' ) )
                    ->setFormatter( Format::dateFormatToSql( 'm-d-y' ) ),
                Field::inst( 'shipments.pickup_number' )
                    ->validator( Validate::numeric() )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'shipments.truck_date' )
                    ->validator( Validate::dateFormat('m-d-Y g:i A', ValidateOptions::inst()->allowEmpty( false )))
                    ->getFormatter( Format::datetime('Y-m-d H:i:s','m-d-Y g:i A'))
                    ->setFormatter( Format::datetime('m-d-Y g:i A','Y-m-d H:i:s')),
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
                    ->validator( Validate::dateFormat( 'Y-m-d H:i:s' ) )
                    ->getFormatter( Format::datetime( 'Y-m-d H:i:s', 'Y-m-d H:i:s' ) )
                    ->setFormatter( Format::datetime( 'Y-m-d H:i:s', 'Y-m-d H:i:s' ) ),*/
                Field::inst( 'shipments.container_size' )
                    ->validator( Validate::numeric() )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'shipments.is_active' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } )
            )
            ->leftJoin( 'products', 'products.id', '=', 'shipments.product_id' )
            ->leftJoin( 'truckers', 'truckers.id', '=', 'shipments.trucker_id' )
            ->leftJoin( 'vendors', 'vendors.id', '=', 'shipments.vendor_id' )
            ->process( $_POST )
            ->json();
    }

    public function mark_everything_inactive(){
        $data = array('is_active' => FALSE);
        $this->db->where('is_active', TRUE);
        $result=$this->db->update('shipments', $data);
        return $result;
    }

    public function get_vendor_id_by_name($vendorName=FALSE){
        if ($vendorName === FALSE){
            return false;
        }
        $query = $this->db->get_where('vendors', array('name' => $vendorName));
        $result= $query->row_array();
        return $result['id'];
    }

    public function getISFreq($port_of_discharge=FALSE){
        if (!$port_of_discharge)return false;
        if (strpos($port_of_discharge, 'Prince Rupert') === false) return false;
        return true;
    }

    public function get_by_container_number($container_number){
        $this->db->from('shipments');
        $this->db->where('container_number',$container_number);
        $query = $this->db->get();
        $row= $query->row();
        if (!isset($row)){
            return NULL;
        }
        return $row;
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
        return $query->result_array();
    }

    public function get_archived_records(){
        $this->db->from('archived_shipments');
        $query = $this->db->get();
        $rows= $query->result_array();
        if (count($rows)<=0) return NULL;
        return $rows;
    }

    public function record_exists($container_number=FALSE){
        if ($container_number === FALSE) {
            return FALSE;
        }
        $query = $this->db->get_where('shipments', array('container_number' => $container_number));
        if(empty($query->row_array())){
            return false;
        } else {
            return true;
        }
    }

}
