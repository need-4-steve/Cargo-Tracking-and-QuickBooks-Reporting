<?php

/*
 * Editor server script for DB table shipments
 * Created by http://editor.datatables.net/generator
 */

// DataTables PHP library and database connection
include( "DataTables.php" );

// Alias Editor classes so they are easy to use
use
    DataTables\Editor,
    DataTables\Editor\Field,
    DataTables\Editor\Format,
    DataTables\Editor\Mjoin,
    DataTables\Editor\Options,
    DataTables\Editor\Upload,
    DataTables\Editor\Validate,
    DataTables\Editor\ValidateOptions;

// Build our Editor instance and process the data coming from _POST
Editor::inst( $db, 'shipments', 'id' )
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
            ->validator( Validate::dateFormat( 'Y-m-d H:i:s' ) )
            ->getFormatter( Format::datetime( 'Y-m-d H:i:s', 'Y-m-d H:i:s' ) )
            ->setFormatter( Format::datetime( 'Y-m-d H:i:s', 'Y-m-d H:i:s' ) ),
        Field::inst( 'shipments.lfd' )
            ->validator( Validate::dateFormat( 'd-m-y' ) )
            ->getFormatter( Format::dateSqlToFormat( 'd-m-y' ) )
            ->setFormatter( Format::dateFormatToSql( 'd-m-y' ) ),
        Field::inst( 'shipments.pickup_number' )
            ->validator( Validate::numeric() )
            ->setFormatter( Format::ifEmpty( null ) ),
        Field::inst( 'shipments.truck_date' )
            ->validator( Validate::dateFormat( 'D, j M y' ) )
            ->getFormatter( Format::dateSqlToFormat( 'D, j M y' ) )
            ->setFormatter( Format::dateFormatToSql( 'D, j M y' ) ),
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
        /*Field::inst( 'shipments.latest_event' ),
        Field::inst( 'shipments.latest_event_time_and_date' )
            ->validator( Validate::dateFormat( 'Y-m-d H:i:s' ) )
            ->getFormatter( Format::datetime( 'Y-m-d H:i:s', 'Y-m-d H:i:s' ) )
            ->setFormatter( Format::datetime( 'Y-m-d H:i:s', 'Y-m-d H:i:s' ) ),*/
        Field::inst( 'shipments.is_active' )
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
            } )
    )
    ->leftJoin( 'products', 'products.id', '=', 'shipments.product_id' )
    ->leftJoin( 'truckers', 'truckers.id', '=', 'shipments.trucker_id' )
    ->leftJoin( 'vendors', 'vendors.id', '=', 'shipments.vendor_id' )
    ->process( $_POST )
    ->json();