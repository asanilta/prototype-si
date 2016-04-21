<?php

class Tender extends CI_Model{
	function __construct() {
		parent::__construct();
	}

	public function get_all() {
		$result = $this->db->get('tender')->result_array();
		foreach($result as &$tender) {
			$tender['tenggat_prakualifikasi'] = date("d/m/Y", strtotime($tender['tenggat_prakualifikasi']));
			$tender['tenggat_akhir'] = date("d/m/Y", strtotime($tender['tenggat_akhir']));
		}
		return $result;
	}

	public function get_by_id($id) {
		$this->db->where('id_tender', $id);
		$result = $this->db->get('tender')->row_array();
		$result['tenggat_prakualifikasi'] = date("d/m/Y", strtotime($result['tenggat_prakualifikasi']));
		$result['tenggat_akhir'] = date("d/m/Y", strtotime($result['tenggat_akhir']));

		return $result;
	}

	public function insert($data) {
		$result = $this->db->insert('tender', $data);

		if($result) {
			$this->db->flush_cache();
			$this->db->select('id_tender')
				->from('tender')
				->where('nama_tender',$data['nama_tender']);
			$id = $this->db->get()->row_array();
			return $id['id_tender'];
		}
		else return 0;
	}

	public function delete($id)
	{
		$this->db->where('id_tender', $id);
		$result = $this->db->delete('tender');

		return $this->db->affected_rows();
	}

	public function update($data) {
		$this->db->where('id_tender', $data['id_tender']);
		$result = $this->db->update('tender', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function get_bidang_by_id($id) {
		$this->db->select('bidang_tender')
			->where('id_tender', $id);
		$result = $this->db->get('bidang_tender');

		return $result->result_array();
	}

	public function get_tenaga_in_tender($id) {
		$this->db->where('id_tender', $id);
		$result = $this->db->get('tenaga_tender');
		return $result->result_array();
	}

	public function update_perusahaan($id_tender, $id_perusahaan) {
		$this->db->where('id_tender', $id_tender);
		$data['id_tender'] = $id_tender;
		$data['id_perusahaan'] = $id_perusahaan;

		$result = $this->db->update('tender', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function add_tenaga_ahli($id_tender, $id_ktp) {
		$data['id_tender'] = $id_tender;
		$data['id_ktp'] = $id_ktp;

		$result = $this->db->insert('tenaga_tender', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function get_persyaratan_by_id($id) {
		$this->db->select('nama_persyaratan, kategori_persyaratan, status')
			->where('id_tender', $id);
		$result = $this->db->get('persyaratan_tender');
		return $result->result_array();
	}

	public function get_tim_by_id($id) {
		$this->db->select('*')
			->from('tim')
			->join('user','user.username = tim.username')
			->where('id_tender',$id);
		$result = $this->db->get();
		return $result->result_array();
	}

	public function get_all_bidang() {
		$this->db->select('bidang_tender')
			->distinct()
			->from('bidang_tender');

		$result = $this->db->get();
		return $result->result_array();
	}

	public function get_rekomendasi_perusahaan($id_tender) {
		$bidang = [];
		$j = 0;
		foreach ($this->Tender->get_bidang_by_id($id_tender) as $value) {
			$bidang[$j] = $value['bidang_tender'];
			$j++;
		}
		if($bidang == []) {
			return [];
		}
		else {
			$this->db->flush_cache();

			$this->db->select('*')
				->from('perusahaan')
				->join('bidang_perusahaan', 'bidang_perusahaan.id_perusahaan = perusahaan.id_perusahaan')
				->where_in('bidang_perusahaan.bidang_perusahaan', $bidang);
			
			return $this->db->get()->result_array();
		}
	}

	public function get_rekomendasi_tenaga_ahli($id_tender) {
		$bidang = [];
		$j = 0;
		foreach ($this->Tender->get_bidang_by_id($id_tender) as $value) {
			$bidang[$j] = $value['bidang_tender'];
			$j++;
		}
		if($bidang == []) {
			return [];
		}
		else {
			$this->db->flush_cache();
			
			$this->db->select('*')
				->from('tenaga_ahli')
				->join('bidang_tenaga_ahli', 'bidang_tenaga_ahli.id_ktp = tenaga_ahli.id_ktp')
				->where_in('bidang_tenaga_ahli.bidang_keahlian', $bidang);
			
			return $this->db->get()->result_array();
		}
	}

	public function get_rekomendasi_tender($id_tender) {
		$bidang = [];
		$j = 0;
		foreach ($this->Tender->get_bidang_by_id($id_tender) as $value) {
			$bidang[$j] = $value['bidang_tender'];
			$j++;
		}
		if($bidang == []) {
			return [];
		}
		else {
			$this->db->flush_cache();
			
			$this->db->select('*')
				->from('tender')
				->join('bidang_tender', 'bidang_tender.id_tender = tender.id_tender')
				->where_in('bidang_tender.bidang_tender', $bidang)
				->where_not_in('tender.id_tender',array($id_tender));
			
			return $this->db->get()->result_array();
		}
	}

	public function insert_bidang_by_id($id, $bidang) {
		$this->db->where('id_tender', $id);
		$result = $this->db->delete('bidang_tender');
		$data['id_tender'] = $id;
		if($bidang == null) return true;
		foreach($bidang as $b) {
			$data['bidang_tender'] = $b;
			$result = $this->db->insert('bidang_tender', $data);
			if(!$result)
				return false;
		}
		return true;
	}

	public function insert_tim_by_id($id, $username) {
		$this->db->where('id_tender', $id);
		$result = $this->db->delete('tim');
		$data['id_tender'] = $id;
		if($username == null) return true;
		foreach($username as $u) {
			$data['username'] = $u;
			$result = $this->db->insert('bidang_tender', $data);
			if(!$result)
				return false;
		}
		return true;
	}
}
