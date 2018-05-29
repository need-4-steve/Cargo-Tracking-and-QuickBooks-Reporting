<?php

class Documents extends CI_Controller
{

/*
 * Listing of documents
 */
    public function index()
    {
        $data['documents'] = $this->Document_model->get_all_documents();

        $data['title'] = "Active Shipments";
        $this->load->view('templates/header', $data);
        $this->load->view('documents/index', $data);
        $this->load->view('templates/footer');
    }

/*
 * Adding a new document
 */
    public function add()
    {
        if (isset($_POST) && count($_POST) > 0) {
            $params = array(
                'shipment_id' => $this->input->post('shipment_id'),
                'filename' => $this->input->post('filename'),
                'filepath' => $this->input->post('filepath'),
                'creation_timestamp' => $this->input->post('creation_timestamp'),
            );

            $document_id = $this->Document_model->add_document($params);
            redirect('documents/index');
        } else {
            $this->load->model('Shipment_model');
            $data['all_shipments'] = $this->Shipment_model->get_all_shipments();

            $data['title'] = "Active Shipments";
            $this->load->view('templates/header', $data);
            $this->load->view('documents/add', $data);
            $this->load->view('templates/footer');
        }
    }

/*
 * Editing a document
 */
    public function edit($id)
    {
        // check if the document exists before trying to edit it
        $data['document'] = $this->Document_model->get_document($id);

        if (isset($data['document']['id'])) {
            if (isset($_POST) && count($_POST) > 0) {
                $params = array(
                    'shipment_id' => $this->input->post('shipment_id'),
                    'filename' => $this->input->post('filename'),
                    'filepath' => $this->input->post('filepath'),
                    'creation_timestamp' => $this->input->post('creation_timestamp'),
                );

                $this->Document_model->update_document($id, $params);
                redirect('documents/index');
            } else {
                $this->load->model('Shipment_model');
                $data['all_shipments'] = $this->Shipment_model->get_all_shipments();

                $data['title'] = "Active Shipments";
                $this->load->view('templates/header', $data);
                $this->load->view('documents/edit', $data);
                $this->load->view('templates/footer');
            }
        } else {
            show_error('The document you are trying to edit does not exist.');
        }

    }

/*
 * Deleting document
 */
    public function remove($id)
    {
        $document = $this->Document_model->get_document($id);

        // check if the document exists before trying to delete it
        if (isset($document['id'])) {
            $this->Document_model->delete_document($id);
            redirect('documents/index');
        } else {
            show_error('The document you are trying to delete does not exist.');
        }

    }

}
