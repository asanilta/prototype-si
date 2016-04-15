<?php

class TenderController extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('Tender');
		$this->load->model('TenagaAhli');
		$this->load->model('User');
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
				$response['content'][$i]['tenaga_ahli'] = $this->getTenagaInTender($content['id_tender']);
				$response['content'][$i]['persyaratan'] = $this->Tender->get_persyaratan_by_id($content['id_tender']);
				$response['content'][$i]['tim'] = $this->Tender->get_tim_by_id($content['id_tender']);
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
			
			$response['content']['tenaga_ahli'] = $this->getTenagaInTender($response['content']['id_tender']);
			if($this->Tender->get_persyaratan_by_id($response['content']['id_tender']) != null)
				$response['content']['persyaratan'] = $this->Tender->get_persyaratan_by_id($response['content']['id_tender']);
			else
				$response['content']['persyaratan'] = null;
			if($this->Tender->get_tim_by_id($response['content']['id_tender']) != null)
				$response['content']['tim'] = $this->Tender->get_tim_by_id($response['content']['id_tender']);
			else
				$response['content']['tim'] = null;
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
		if($this->input->post('id_perusahaan') != null)
			$data['id_perusahaan'] = $this->input->post('id_perusahaan');

		$result = $this->TenagaAhli->insert($data);
		if($result)
			$response['message'] = 'Data tenaga ahli baru berhasil disimpan';
		else
			$response['message'] = 'Data tenaga ahli tidak berhasil disimpan';

		$this->sendJSON($response);
	}

	public function deleteTender($id=null) {
		if($id==null) $id = $this->input->post('id_tender');

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

		$result = $this->Tender->update($data);

		if($result)
			$response['message'] = 'Data tender baru berhasil diubah';
		else
			$response['message'] = 'Data tender tidak berhasil diubah';

		$this->sendJSON($response);
	}

	public function addTenagaToTender($id_tender, $id_ktp) {
		$result = $this->Tender->add_tenaga_ahli($id_tender, $id_ktp);
		
		if($result)
			$response['message'] = 'Data tenaga pada tender berhasil disimpan';
		else
			$response['message'] = 'Data tenaga pada tender tidak berhasil disimpan';

		$this->sendJSON($response);
	}

	public function deleteTenagaInTender($id_tender, $id_ktp) {
		$result = $this->TenagaAhli->delete_tenaga_in_tender($id_tender, $id_ktp);

		if($result)
			$response['message'] = 'Data tenaga pada tender berhasil dihapus';
		else
			$response['message'] = 'Data tenaga pada tender tidak berhasil dihapus';

		$this->sendJSON($response);
	}

	public function getTenagaInTender($id_tender) {
		$temp = $this->Tender->get_tenaga_in_tender($id_tender);
		$i = 0;
		$data = null;
		foreach ($temp as $temp1) {
			$data[$i] = $this->TenagaAhli->get_by_id($temp1['id_ktp']);
			$j = 0;
			foreach ($this->TenagaAhli->get_bidang_by_id($data[$i]['id_ktp']) as $value) {
				$data[$i]['bidang_keahlian'][$j] = $value['bidang_keahlian'];
				$j++;
			}
			$i++;
		}
		return $data;
	}

	public function getTimInTender($id_tender) {
		$temp = $this->Tender->get_tim_in_tender($id_tender);
		$i = 0;
		$data = null;
		foreach ($temp as $temp1) {
			$data[$i] = $this->User->get_by_username($temp1['username']);
			$i++;
		}
		return $data;
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
