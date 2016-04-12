<?php

class TenderController extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('Tender');
		$this->load->model('TenagaAhli');
	}
	
	public function getTender($id = null) {
		if($id==null){
			$response['content'] = $this->Tender->get_all();
			$i = 0;
			foreach ($response['content'] as $content) {
				$j = 0;
				foreach ($this->Tender->get_bidang_by_id($content['id_tender']) as $value) {
					$response['content'][$i]['bidang_tender'][$j] = $value['bidang_tender'];
					$j++;
				}
				$i++;
			}
		}
		else {
			$response['content'] = $this->Tender->get_by_id($id);
			$j = 0;
			foreach ($this->Tender->get_bidang_by_id($response['content']['id_tender']) as $value) {
				$response['content']['bidang_tender'][$j] = $value['bidang_tender'];
				$j++;
			}
		}

		if($response['content'] == null) {
			$response['content'] = '';
			if($id != null) {
				$response['message'] = 'Tender dengan nomor '.$id.' tidak ditemukan';
			}
			else {
				$response['message'] = 'Tidak ada data tender pada basis data';
			}
		}
		$this->sendJSON($response);
	}

	public function insertTender() {
		$data['id_tender'] = $this->input->post('id_tender');
		$data['nama_tender'] = $this->input->post('nama_tender');
		$data['status'] = $this->input->post('status');
		$data['instansi_pengada'] = $this->input->post('instansi_pengada');
		$data['url'] = $this->input->post('url');
		$data['tenggat_prakualifikasi'] = $this->input->post('tenggat_prakualifikasi');
		$data['tenggat_akhir'] = $this->input->post('tenggat_akhir');
		$data['id_perusahaan'] = $this->input->post('id_perusahaan');

		$result = $this->TenagaAhli->insert($data);
		if($result)
			$response['message'] = 'Data tenaga ahli baru berhasil disimpan';
		else
			$response['message'] = 'Data tenaga ahli tidak berhasil disimpan';

		$this->sendJSON($response);
	}

	public function deleteTender($id) {
		$result = $this->Tender->delete($id);

		if($result)
			$response['message'] = 'Data tender baru berhasil dihapus';
		else
			$response['message'] = 'Data tender tidak berhasil dihapus';

		$this->sendJSON($response);
	}

	public function updateTender() {
		$data['id_tender'] = $this->input->post('id_tender');
		$data['nama_tender'] = $this->input->post('nama_tender');
		$data['status'] = $this->input->post('status');
		$data['instansi_pengada'] = $this->input->post('instansi_pengada');
		$data['url'] = $this->input->post('url');
		$data['tenggat_prakualifikasi'] = $this->input->post('tenggat_prakualifikasi');
		$data['tenggat_akhir'] = $this->input->post('tenggat_akhir');
		$data['id_perusahaan'] = $this->input->post('id_perusahaan');

		$result = $this->Tender->update($data['id_ktp'], $data);

		if($result)
			$response['message'] = 'Data tender baru berhasil diubah';
		else
			$response['message'] = 'Data tender tidak berhasil diubah';

		$this->sendJSON($response);
	}

	public function addTenagaToTender($id_tender, $id_ktp) {
		//TODO: Jangan lupa yaaa
	}

	public function getTenagaInTender($id_tender) {
		$temp = $this->Tender->get_tenaga_in_tender($id_tender);
		$i = 0;
		foreach ($temp as $temp1) {
			$response['content'][$i] = $this->TenagaAhli->get_by_id($temp1['id_ktp']);
			$j = 0;
			foreach ($this->TenagaAhli->get_bidang_by_id($response['content'][$i]['id_ktp']) as $value) {
				$response['content'][$i]['bidang_keahlian'][$j] = $value['bidang_keahlian'];
				$j++;
			}
			$i++;
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