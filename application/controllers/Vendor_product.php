<?php
/* 
 * Generated by CRUDigniter v3.2 
 * www.crudigniter.com
 */
 
class Vendor_product extends CI_Controller{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Vendor_product_model');
    } 

    /*
     * Listing of vendor_products
     */
    function index()
    {
        $data['vendor_products'] = $this->Vendor_product_model->get_all_vendor_products();
        
        $data['_view'] = 'vendor_product/index';
        $this->load->view('layouts/main',$data);
    }

    /*
     * Adding a new vendor_product
     */
    function add()
    {   
        if(isset($_POST) && count($_POST) > 0)     
        {   
            $params = array(
				'vendor_id' => $this->input->post('vendor_id'),
				'product_id' => $this->input->post('product_id'),
            );
            
            $vendor_product_id = $this->Vendor_product_model->add_vendor_product($params);
            redirect('vendor_product/index');
        }
        else
        {
			$this->load->model('Vendor_model');
			$data['all_vendors'] = $this->Vendor_model->get_all_vendors();

			$this->load->model('Product_model');
			$data['all_products'] = $this->Product_model->get_all_products();
            
            $data['_view'] = 'vendor_product/add';
            $this->load->view('layouts/main',$data);
        }
    }  

    /*
     * Editing a vendor_product
     */
    function edit($id)
    {   
        // check if the vendor_product exists before trying to edit it
        $data['vendor_product'] = $this->Vendor_product_model->get_vendor_product($id);
        
        if(isset($data['vendor_product']['id']))
        {
            if(isset($_POST) && count($_POST) > 0)     
            {   
                $params = array(
					'vendor_id' => $this->input->post('vendor_id'),
					'product_id' => $this->input->post('product_id'),
                );

                $this->Vendor_product_model->update_vendor_product($id,$params);            
                redirect('vendor_product/index');
            }
            else
            {
				$this->load->model('Vendor_model');
				$data['all_vendors'] = $this->Vendor_model->get_all_vendors();

				$this->load->model('Product_model');
				$data['all_products'] = $this->Product_model->get_all_products();

                $data['_view'] = 'vendor_product/edit';
                $this->load->view('layouts/main',$data);
            }
        }
        else
            show_error('The vendor_product you are trying to edit does not exist.');
    } 

    /*
     * Deleting vendor_product
     */
    function remove($id)
    {
        $vendor_product = $this->Vendor_product_model->get_vendor_product($id);

        // check if the vendor_product exists before trying to delete it
        if(isset($vendor_product['id']))
        {
            $this->Vendor_product_model->delete_vendor_product($id);
            redirect('vendor_product/index');
        }
        else
            show_error('The vendor_product you are trying to delete does not exist.');
    }
    
}
