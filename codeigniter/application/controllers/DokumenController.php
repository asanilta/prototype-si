<?php

class DokumenController extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper(array('form','url','file','directory'));
		$this->load->model('Dokumen');
	}

	function do_upload($folder)  {
		$config['upload_path'] = './dokumen/'.$folder;
		$config['allowed_types'] = '*';
		$config['remove_spaces'] = 'TRUE';

		$this->load->library('upload', $config);

		if (!$this->upload->do_upload()) {
			$error = array('error' => $this->upload->display_errors());
			$response['message'] = 'Dokumen tidak berhasil diunggah';
		}
		else {
			$data = array('upload_data' => $this->upload->data());
			$response['content'] = $data;
			$response['message'] = 'Dokumen berhasil diunggah';
		}
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

	public function createFolder($folder) {
		if(!is_dir('./dokumen/'.$folder)) {
			mkdir('./dokumen/'.$folder,0755,TRUE);
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