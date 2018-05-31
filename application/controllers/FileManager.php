<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Filemanager extends CI_Controller
{
    public function index()
    {
        $this->load->view('documents/index.php');
    }

    public function folder()
    {
        $this->load->helper('directory');
        $path = $this->input->post('path');
        $root = $this->input->post('root');
        if (!$path) {
            $path = $root;
        }
        $result = directory_map($path, 1);
        echo json_encode($result);
    }
}
