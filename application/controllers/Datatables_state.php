<?php
/* 
 * Generated by CRUDigniter v3.2 
 * www.crudigniter.com
 */
 
class Datatables_state extends CI_Controller{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Datatables_state_model');
    } 

    /*
     * Listing of datatables_states
     */
    function index()
    {
        $data['datatables_states'] = $this->Datatables_state_model->get_all_datatables_states();
        
        $data['_view'] = 'datatables_state/index';
        $this->load->view('layouts/main',$data);
    }

    /*
     * Adding a new datatables_state
     */
    function add()
    {   
        if(isset($_POST) && count($_POST) > 0)     
        {   
            $params = array(
				'user_id' => $this->input->post('user_id'),
				'name' => $this->input->post('name'),
				'timestamp' => $this->input->post('timestamp'),
				'state' => $this->input->post('state'),
            );
            
            $datatables_state_id = $this->Datatables_state_model->add_datatables_state($params);
            redirect('datatables_state/index');
        }
        else
        {            
            $data['_view'] = 'datatables_state/add';
            $this->load->view('layouts/main',$data);
        }
    }  

    /*
     * Editing a datatables_state
     */
    function edit($id)
    {   
        // check if the datatables_state exists before trying to edit it
        $data['datatables_state'] = $this->Datatables_state_model->get_datatables_state($id);
        
        if(isset($data['datatables_state']['id']))
        {
            if(isset($_POST) && count($_POST) > 0)     
            {   
                $params = array(
					'user_id' => $this->input->post('user_id'),
					'name' => $this->input->post('name'),
					'timestamp' => $this->input->post('timestamp'),
					'state' => $this->input->post('state'),
                );

                $this->Datatables_state_model->update_datatables_state($id,$params);            
                redirect('datatables_state/index');
            }
            else
            {
                $data['_view'] = 'datatables_state/edit';
                $this->load->view('layouts/main',$data);
            }
        }
        else
            show_error('The datatables_state you are trying to edit does not exist.');
    } 

    /*
     * Deleting datatables_state
     */
    function remove($id)
    {
        $datatables_state = $this->Datatables_state_model->get_datatables_state($id);

        // check if the datatables_state exists before trying to delete it
        if(isset($datatables_state['id']))
        {
            $this->Datatables_state_model->delete_datatables_state($id);
            redirect('datatables_state/index');
        }
        else
            show_error('The datatables_state you are trying to delete does not exist.');
    }
    
}
