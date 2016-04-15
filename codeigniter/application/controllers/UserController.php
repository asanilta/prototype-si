<?php

class UserController extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('User');
		$this->load->model('Tender');
	}
	
	public function getUser($username = null) {
		if($username == null) {
			$response['content'] = $this->User->get_all();
		}
		else {
			$response['content'] = $this->User->get_by_username($username);
			$response['content']['tender'] = $this->User->get_tender_by_username($username);

			foreach ($response['content']['tender'] as &$tender) {
				$temp = $this->Tender->get_tim_by_id($tender['id_tender']);
				$j = 0;
				foreach($temp as $temp2) {
					$name = $this->User->get_by_username($temp2['username']);
					$tender['tim'][$j] = $name['nama_lengkap'];
					$j++;
				}
				$j = 0;
				foreach($temp as $temp2) {
					$bidang = $this->Tender->get_bidang_by_id($temp2['id_tender']);
					$tender['bidang_tender'][$j] = $bidang;
					$j++;
				}

			}
			$response['content']['reminder'] = $this->User->get_reminder_by_username($username);
		}
		
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

	public function sendJSON($response) {
		$this->output
			->set_status_header(200)
			->set_content_type('application/json', 'utf-8')
			->set_output(json_encode($response, JSON_PRETTY_PRINT))
			->_display();
			exit;
	}
}