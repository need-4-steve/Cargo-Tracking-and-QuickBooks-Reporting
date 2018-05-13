<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class EditorLib {

    private $CI = null;

    function __construct()
    {
        $this->CI = &get_instance();
    }

    public function process($post)
    {
        // DataTables PHP library
        require dirname(__FILE__).'/php/DataTables.php';
        //echo dirname(__FILE__).'/php/DataTables.php';
        //Load the model which will give us our data
        $this->CI->load->model('ShipmentsModel');

        //Pass the database object to the model
        $this->CI->ShipmentsModel->init($db);

        //Let the model produce the data
        $this->CI->ShipmentsModel->getShipments($post);
    }
}