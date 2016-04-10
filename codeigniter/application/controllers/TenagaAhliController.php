<?php

class TenagaAhliController extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('TenagaAhli');
	}
	
	public function getTenagaAhli($id = null) {
		if($id==null)
			$response['content'] = $this->TenagaAhli->get_all();
		else $response['content'] = $this->TenagaAhli->get_by_id($id);

		if($response['content'] == null) {
			$response['content'] = '';
			if($id != null)
				$response['message'] = 'KTP dengan nomor '.$id.' tidak ditemukan';
			else $response['message'] = 'Tidak ada data tenaga ahli pada basis data';
		}

		$this->sendJSON($response);
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