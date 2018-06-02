<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ajax extends CI_Controller
{
    public function shipments()
    {
        //Load our library EditorLib
        $this->load->library('EditorLib');
        //`Call the process method to process the posted data
        $this->editorlib->process($_POST);
    }

    public function save_state($name, $state)
    {
        try {
            //if the name already exist then update else insert a new row in db
            $query = "INSERT INTO datatables_states ( 'name', 'state') VALUES ($name, $state)";
            $query .= " ON DUPLICATE KEY UPDATE state=VALUES(state)"; //to avoid multiple inserts, we update the column "state" if a row with the same name exists
            $result = $this->ShipmentsModel->mysql_db_result_query($query);
            echo "saved";
        } catch (PDOException $e) {
            print "ERROR !: " . $e->getMessage() . "<br/>";
            die();
        }
    }
    public function load_state($name)
    {
        try {
            $query = "SELECT 'state' FROM 'datatables_states' WHERE 'name' LIKE $name";
            $result = $this->ShipmentsModel->mysql_db_row_query($query);
            echo $result['state'] ;
        } catch (PDOException $e) {
            print "ERROR !: " . $e->getMessage() . "<br/>";
            die();
        }
    }
}
