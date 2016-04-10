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

	public function insertTenagaAhli() {
		$data['id_ktp'] = $this->input->post('id_ktp');
		$data['nama_tenaga_ahli'] = $this->input->post('nama_tenaga_ahli');
		$data['tempat_lahir'] = $this->input->post('tempat_lahir');
		$data['tanggal_lahir'] = $this->input->post('tanggal_lahir');
		$data['jenis_kelamin'] = $this->input->post('jenis_kelamin');
		$data['alamat'] = $this->input->post('alamat');
		$data['tanggal_habis_ktp'] = $this->input->post('tanggal_habis_ktp');
		$data['telp'] = $this->input->post('telp');
		$data['email'] = $this->input->post('email');

		$result = $this->TenagaAhli->insert($data);
		if($result)
			$response['message'] = 'Data tenaga ahli baru berhasil disimpan';
		else
			$response['message'] = 'Data tenaga ahli tidak berhasil disimpan';

		$this->sendJSON($response);
	}

	public function deleteTenagaAhli($id) {
		$result = $this->TenagaAhli->delete($id);

		if($result)
			$response['message'] = 'Data tenaga ahli baru berhasil disimpan';
		else
			$response['message'] = 'Data tenaga ahli tidak berhasil disimpan';

		$this->sendJSON($response);
	}

	public function updateTenagaAhli () {
		$data['id_ktp'] = $this->input->post('id_ktp');
		$data['nama_tenaga_ahli'] = $this->input->post('nama_tenaga_ahli');
		$data['tempat_lahir'] = $this->input->post('tempat_lahir');
		$data['tanggal_lahir'] = $this->input->post('tanggal_lahir');
		$data['jenis_kelamin'] = $this->input->post('jenis_kelamin');
		$data['alamat'] = $this->input->post('alamat');
		$data['tanggal_habis_ktp'] = $this->input->post('tanggal_habis_ktp');
		$data['telp'] = $this->input->post('telp');
		$data['email'] = $this->input->post('email');

		$result = $this->TenagaAhli->update($data['id_ktp'], $data);

		if($result)
			$response['message'] = 'Data tenaga ahli baru berhasil diubah';
		else
			$response['message'] = 'Data tenaga ahli tidak berhasil diubah';

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