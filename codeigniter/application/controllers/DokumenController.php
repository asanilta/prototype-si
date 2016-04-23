<?php

class DokumenController extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper(array('form','url','file','directory'));
		$this->load->model('Dokumen');
	}

	function index()
 	{
		$this->load->view('upload_form', array('error' => ' ' ));
	}

	function do_upload() {
		$folder = $this->input->post('path');
		if($folder == null) {
			$config['upload_path'] = './dokumen/';
		}
		else {
			$config['upload_path'] = './dokumen/'.$folder;
		}
		$config['allowed_types'] = '*';
		$config['remove_spaces'] = 'TRUE';

		$this->load->library('upload', $config);

		if (!$this->upload->do_upload()) {
			$error = array('error' => $this->upload->display_errors());
			$response['message'] = 'Dokumen tidak berhasil diunggah';
			//$this->load->view('upload_form', $error);

		}
		else {
			$data = array('upload_data' => $this->upload->data());
			$response['content'] = $data;
			
			$db['nama_dokumen'] = $data['upload_data']['file_name'];
			$db['letak_dokumen'] = str_replace('/opt/lampp/htdocs/prototype-si/codeigniter','.',$data['upload_data']['file_path']);
			$db['jenis_dokumen'] = $data['upload_data']['file_ext'];
			$db['username'] = $this->input->post('username');
			$this->Dokumen->insert_dokumen($db);
			
			$response['message'] = 'Dokumen berhasil diunggah';
			//$this->load->view('upload_success', $data);
		}

		$this->sendJSON($response);
	}

	public function getDokumen($letak_dokumen = null) {
		if($letak_dokumen == null) {
			$response['content'] = $this->Dokumen->get_all();
		}
		else {
			$response['content'] = $this->Dokumen->get_by_letak($letak_dokumen);
		}
		$this->sendJSON($response);
	}

	public function createFolder() {
		$folder = $this->input->post('letak_dokumen');
		if(!is_dir('./dokumen/'.$folder)) {
			mkdir('./dokumen/'.$folder,0755,TRUE);
			$db['nama_dokumen'] = $this->input->post('nama_dokumen');
			$db['letak_dokumen'] = $folder;
			$db['jenis_dokumen'] = 'folder';
			$db['username'] = $this->input->post('username');

			$result = $this->Dokumen->insert_dokumen($db);
			if($result) $response['message'] = 'Folder berhasil dibuat';
			else $response['message'] = 'Folder tidak berhasil dibuat';
	    }
	    else {
	    	$response['message'] = 'Folder telah ada pada direktori';
	    }
	}

	public function sendJSON($response) {
		$this->output
			->set_status_header(200)
			->set_content_type('application/json', 'utf-8')
			->set_output(json_encode($response, JSON_PRETTY_PRINT))
			->_display();
			exit;
	}
}
?>