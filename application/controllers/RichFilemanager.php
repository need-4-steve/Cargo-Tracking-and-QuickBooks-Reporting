<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RichFilemanager extends CI_Controller {
    public function __construct(){
		parent::__construct();		
		$this->load->library('RichFilemanagerLib','richfilemanagerlib');
    }
    
	public function index()
	{     
        $this->load->view('richfilemanager');
    }
    
    public function localAPI()
	{               
        
       $this->richfilemanagerlib->local()->run(); 
    }
    
    public function s3API()
	{
        $this->richfilemanagerlib->s3()->run();        
    }

}
