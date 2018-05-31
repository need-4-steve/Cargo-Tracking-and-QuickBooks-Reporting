<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class File extends CI_Controller
{
    public function deleteFile()
    {
        $this->load->helper('file');
        $pathFile = $this->input->post('pathFile');
        $result = array();
        //    echo $pathFile;die();
        $check = unlink("." . $pathFile);
        if ($check) {
            $result['status'] = "success";
            $result['message'] = "Delete success";
        } else {
            $result['status'] = "error";
            $result['message'] = "Delete error";
        }
        echo json_encode($result);
    }

    public function upload()
    {
        $config['upload_path'] = './' . $this->input->post('path');
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = '1024';
        $config['max_width'] = '1024';
        $config['max_height'] = '768';

        $this->load->library('upload', $config);
        $result = array();
        $nameInput = $this->input->post('name');
        if (!$this->upload->do_upload($nameInput)) {
            $result['status'] = "error";
        } else {
            $result['status'] = "success";
        }
        echo json_encode($result);
    }

    public function renameFile()
    {
        $path = $this->input->post('path');

        $oldname = $this->input->post('oldname');
        $newname = $this->input->post('newname');
        $extention = $this->input->post('extention');
        $oldFile = './' . $path . '/' . $oldname . $extention;
        $newFile = './' . $path . '/' . $newname . $extention;

        $check = rename($oldFile, $newFile);
        if ($check) {
            $result['status'] = "success";
            $result['message'] = "Rename file success";
        } else {
            $result['status'] = "error";
            $result['message'] = "Rename file error";
        }

        echo json_encode($result);
    }

    public function _delTree($dir)
    {
        $files = array_diff(scandir($dir), array('.', '..'));
        foreach ($files as $file) {
            (is_dir("$dir/$file")) ? $this->_delTree("$dir/$file") : unlink("$dir/$file");
        }
        return rmdir($dir);
    }

    public function deleteFolder()
    {
        $this->load->helper('file');
        $pathFolder = $this->input->post('pathFolder');
        $result = array();

        $check = $this->_delTree("." . $pathFolder);

        if ($check) {
            $result['status'] = "success";
            $result['message'] = "Delete success";
        } else {
            $result['status'] = "error";
            $result['message'] = "Delete error";
        }
        echo json_encode($result);
    }

    public function renameFolder()
    {
        $path = $this->input->post('path');
        $oldname = $this->input->post('oldname');
        $newname = $this->input->post('newname');

        $oldFolder = './' . $path . '/' . $oldname;
        $newFolder = './' . $path . '/' . $newname;

        $check = rename($oldFolder, $newFolder);
        if ($check) {
            $result['status'] = "success";
            $result['message'] = "Rename folder success";
        } else {
            $result['status'] = "error";
            $result['message'] = "Rename folder error";
        }

        echo json_encode($result);
    }
    public function createFolder()
    {
        $path = $this->input->post('path');
        $name = $this->input->post('name');

        $pathFolder = "./" . $path . "/" . $name; 
        //create the folder if it's not already exists
        if (!is_dir($pathFolder)) {
            $check = mkdir($pathFolder, 0755, true);
            if ($check) {
                $result['status'] = "success";
                $result['message'] = "Create folder success";
            } else {
                $result['status'] = "error";
                $result['message'] = "Delete error";
            }
        } else {
            $result['status'] = "error";
            $result['message'] = "Folder already exists";
        }

        echo json_encode($result);
    }

}
