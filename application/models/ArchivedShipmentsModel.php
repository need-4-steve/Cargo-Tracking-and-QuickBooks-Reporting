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

class ArchivedShipmentsModel extends CI_Model
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
    public function getShipments($post)
    {
        // Build our Editor instance and process the data coming from _POST
        Editor::inst( $this->editorDb, 'archived_shipments', 'id' )
            ->fields(
                Field::inst( 'archived_shipments.status' )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'archived_shipments.po' )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'archived_shipments.product_id' )
                    ->setFormatter( Format::ifEmpty( null ) )
                    ->options( Options::inst()
                        ->table( 'products' )
                        ->value( 'id' )
                        ->label( 'product_name' )
                    )
                    ->validator( 'Validate::dbValues' ),
                Field::inst( 'products.product_name' ),
                Field::inst( 'archived_shipments.container_number' ),
                Field::inst( 'archived_shipments.bill_of_lading' )
                    ->validator( Validate::numeric() ),
                Field::inst( 'archived_shipments.vendor_id' )
                    ->options( Options::inst()
                        ->table( 'vendors' )
                        ->value( 'id' )
                        ->label( 'abbreviation' )
                    )
                    ->validator( 'Validate::dbValues' ),
                Field::inst( 'vendors.abbreviation' ),
                Field::inst( 'archived_shipments.discharge_port' )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'archived_shipments.final_destination' )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'archived_shipments.eta' )
                    ->validator( Validate::dateFormat( 'm-d-Y' ) )
                    ->getFormatter( Format::datetime( 'Y-m-d', 'm-d-Y' ) )
                    ->setFormatter( Format::datetime('m-d-Y', 'Y-m-d' ) ),
                Field::inst( 'archived_shipments.lfd' )
                    ->validator( Validate::dateFormat( 'm-d-Y' ) )
                    ->getFormatter( Format::datetime( 'Y-m-d', 'm-d-Y' ) )
                    ->setFormatter( Format::datetime('m-d-Y', 'Y-m-d' ) ),
                Field::inst( 'archived_shipments.pickup_number' )
                    ->validator( Validate::numeric() )
                    ->setFormatter( Format::ifEmpty( null ) ),
                Field::inst( 'archived_shipments.truck_date' )
                    ->validator( Validate::dateFormat('m-d-Y g:i A') )
                    ->getFormatter( Format::datetime('Y-m-d H:i:s','m-d-Y g:i A') )
                    ->setFormatter( Format::datetime('m-d-Y g:i A','Y-m-d H:i:s') ),
                Field::inst( 'archived_shipments.trucker_id' )
                    ->options( Options::inst()
                        ->table( 'truckers' )
                        ->value( 'id' )
                        ->label( 'trucker_name' )
                    )
                    ->validator( 'Validate::dbValues' ),
                Field::inst( 'truckers.trucker_name' ),
                Field::inst( 'archived_shipments.bl_status' ),
                Field::inst( 'archived_shipments.freight' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'archived_shipments.isf_required' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'archived_shipments.customs' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'archived_shipments.po_boolean' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'archived_shipments.qb_rt' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'archived_shipments.qb_ws' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'archived_shipments.requires_payment' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                /*Field::inst( 'archived_shipments.latest_event' ),
                Field::inst( 'archived_shipments.latest_event_time_and_date' )
                    ->validator( Validate::dateFormat( 'Y-m/d H:i:s' ) )
                    ->getFormatter( Format::datetime( 'Y-m/d H:i:s', 'Y-m/d H:i:s' ) )
                    ->setFormatter( Format::datetime( 'Y-m/d H:i:s', 'Y-m/d H:i:s' ) ),*/
                Field::inst( 'archived_shipments.container_size' )
                    ->validator( Validate::numeric() )
                    ->setFormatter( Format::ifEmpty( null ) ),
                    Field::inst( 'archived_shipments.do' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'archived_shipments.has_documents' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                Field::inst( 'archived_shipments.is_complete' )
                    ->getFormatter(
                        function ( $val, $data ) {
                            return $val ? 1  : 0;
                        } )
                    ->setFormatter( function ( $val, $data, $opts ) {
                        return ! $val ? 0 : 1;
                    } ),
                    Field::inst( 'archived_shipments.directory_name' ),
                    Field::inst( 'archived_shipments.latest_event' )
            )
            ->leftJoin( 'products', 'products.id', '=', 'archived_shipments.product_id' )
            ->leftJoin( 'truckers', 'truckers.id', '=', 'archived_shipments.trucker_id' )
            ->leftJoin( 'vendors', 'vendors.id', '=', 'archived_shipments.vendor_id' )
            ->process( $_POST )
            ->json();
    }
}