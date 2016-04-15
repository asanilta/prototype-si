<?php

class TenagaAhliController extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('TenagaAhli');
	}

	public function getTenagaAhli($id = null) {
		if($id==null){
			$response['content'] = $this->TenagaAhli->get_all();
			$i = 0;
			foreach ($response['content'] as $content) {
				$j = 0;
				foreach ($this->TenagaAhli->get_bidang_by_id($content['id_ktp']) as $value) {
					$response['content'][$i]['bidang_keahlian'][$j] = $value['bidang_keahlian'];
					$j++;
				}
				$i++;
			}
		}
		else {
			$response['content'] = $this->TenagaAhli->get_by_id($id);
			$j = 0;
			foreach ($this->TenagaAhli->get_bidang_by_id($response['content']['id_ktp']) as $value) {
				$response['content']['bidang_keahlian'][$j] = $value['bidang_keahlian'];
				$j++;
			}
		}

		if($response['content'] == null) {
			$response['content'] = '';
			if($id != null) {
				$response['message'] = 'KTP dengan nomor '.$id.' tidak ditemukan';
			}
			else {
				$response['message'] = 'Tidak ada data tenaga ahli pada basis data';
			}
		}

		$this->sendJSON($response);
	}

	public function insertTenagaAhli() {
		$data['id_ktp'] = $this->input->post('id_ktp');
		$data['nama_tenaga_ahli'] = $this->input->post('nama_tenaga_ahli');
		$data['tempat_lahir'] = $this->input->post('tempat_lahir');
		list($tanggal, $bulan, $tahun) = explode("/", $this->input->post('tanggal_lahir'));
		$data['tanggal_lahir'] = $tahun.'-'.$bulan.'-'.$tanggal;
		$data['jenis_kelamin'] = $this->input->post('jenis_kelamin');
		$data['alamat'] = $this->input->post('alamat');
		list($tanggal, $bulan, $tahun) = explode("/", $this->input->post('tanggal_habis_ktp'));
		$data['tanggal_habis_ktp'] = $tahun.'-'.$bulan.'-'.$tanggal;
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
			$response['message'] = 'Data tenaga ahli berhasil dihapus';
		else
			$response['message'] = 'Data tenaga ahli tidak berhasil dihapus';

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
		$data['updated_at'] = $this->input->post('updated_at');

		$result = $this->TenagaAhli->update($data);

		if($result)
			$response['message'] = 'Data tenaga ahli berhasil diubah';
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
