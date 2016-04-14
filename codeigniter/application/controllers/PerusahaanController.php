<?php

class PerusahaanController extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('Perusahaan');
	}

	public function getPerusahaan($id = null) {
		if($id==null){
			$response['content'] = $this->Perusahaan->get_all();
			$i = 0;
			foreach ($response['content'] as $content) {
				$j = 0;
				foreach ($this->Perusahaan->get_bidang_by_id($content['id_perusahaan']) as $value) {
					$response['content'][$i]['bidang_perusahaan'][$j] = $value['bidang_perusahaan'];
					$j++;
				}
				$i++;
			}
		}
		else {
			$response['content'] = $this->Perusahaan->get_by_id($id);
			$j = 0;
			foreach ($this->Perusahaan->get_bidang_by_id($response['content']['id_perusahaan']) as $value) {
				$response['content']['bidang_perusahaan'][$j] = $value['bidang_perusahaan'];
				$j++;
			}
		}

		if($response['content'] == null) {
			$response['content'] = '';
			if($id != null) {
				$response['message'] = 'Perusahaan dengan ID '.$id.' tidak ditemukan';
			}
			else {
				$response['message'] = 'Tidak ada data perusahaan pada basis data';
			}
		}

		$this->sendJSON($response);
	}

	public function insertPerusahaan() {
		$data['id_perusahaan'] = $this->input->post('id_perusahaan');
		$data['nama_perusahaan'] = $this->input->post('nama_perusahaan');
		$data['alamat'] = $this->input->post('alamat');
		$data['telp'] = $this->input->post('telp');
		$data['email'] = $this->input->post('email');

		$result = $this->Perusahaan->insert($data);
		if($result)
			$response['message'] = 'Data perusahaan baru berhasil disimpan';
		else
			$response['message'] = 'Data perusahaan tidak berhasil disimpan';

		$this->sendJSON($response);
	}

	public function deletePerusahaan($id) {
		$result = $this->Perusahaan->delete($id);

		if($result)
			$response['message'] = 'Data perusahaan baru berhasil dihapus';
		else
			$response['message'] = 'Data perusahaan tidak berhasil dihapus';

		$this->sendJSON($response);
	}

	public function updatePerusahaan () {
		$data['id_perusahaan'] = $this->input->post('id_perusahaan');
		$data['nama_perusahaan'] = $this->input->post('nama_perusahaan');
		$data['alamat'] = $this->input->post('alamat');
		$data['telp'] = $this->input->post('telp');
		$data['email'] = $this->input->post('email');

		$result = $this->Perusahaan->update($data);

		if($result)
			$response['message'] = 'Data perusahaan berhasil diubah';
		else
			$response['message'] = 'Data perusahaan tidak berhasil diubah';

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
