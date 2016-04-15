<?php

class UserController extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('User');
	}
	
	public function getUser($username = null) {
		if($username == null) 
			$response['content'] = $this->User->get_all();
		else
			$response['content'] = $this->User->get_by_username($username);

		if($response['content'] == null) {
			$response['content'] = '';
			if($username != null) {
				$response['message'] = 'User dengan username '.$username.' tidak ditemukan';
			}
			else {
				$response['message'] = 'Tidak ada data user pada basis data';
			}
		}

		$this->sendJSON($response);
	}

	public function getTender($username) {
		
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