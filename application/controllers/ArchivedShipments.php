<?php

defined('BASEPATH') or exit('No direct script access allowed');
use PHPHtmlParser\Dom;

class Shipments extends CI_Controller
{
    public function index() {
        if (!$this->session->userdata('logged_in')) {
            redirect('users/login');
        }
        $data['title'] = "Archived Shipments";
        $this->load->view('templates/archived_shipments_header', $data);
        $this->load->view('shipments/index', $data);
        $this->load->view('templates/footer');
    }

}