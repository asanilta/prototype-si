<?php

class TenagaAhli extends CI_Model{
	function __construct() {
		parent::__construct();
	}

	public function get_all() {
		$result = $this->db->get('tenaga_ahli')->result_array();
		foreach($result as &$tenaga) {
			$tenaga['tanggal_lahir'] = date("d M Y", strtotime($tenaga['tanggal_lahir']));
			$tenaga['tanggal_habis_ktp'] = date("d M Y", strtotime($tenaga['tanggal_habis_ktp']));
			$tenaga['updated_at'] = date("d M Y H:i:s", strtotime($tenaga['updated_at']));
		}
		return $result;
	}

	public function get_by_id($id) {
		$this->db->where('id_ktp', $id);
		$result = $this->db->get('tenaga_ahli')->row_array();
		$result['tanggal_lahir'] = date("d/m/Y", strtotime($result['tanggal_lahir']));
		$result['tanggal_habis_ktp'] = date("d/m/Y", strtotime($result['tanggal_habis_ktp']));
		return $result;
	}

	public function insert($data) {
		$result = $this->db->insert('tenaga_ahli', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function delete($id) {
		$this->db->where('id_ktp', $id);
		$result = $this->db->delete('tenaga_ahli');

		return $this->db->affected_rows();
	}

	public function update($data) {
		$this->db->where('id_ktp', $data['id_ktp']);
		$result = $this->db->update('tenaga_ahli', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function delete_tenaga_in_tender($id_tender, $id_ktp) {
		$this->db->where('id_tender', $id_tender);
		$this->db->where('id_ktp', $id_ktp);
		$result = $this->db->delete('tenaga_tender');
		
		return $this->db->affected_rows();
	}

	public function get_bidang_by_id($id) {
		$this->db->where('id_ktp', $id);
		$result = $this->db->get('bidang_tenaga_ahli');
		return $result->result_array();
	}

	public function insert_bidang_by_id($id, $bidang) {
		$this->db->where('id_ktp', $id);
		$result = $this->db->delete('bidang_tenaga_ahli');
		$data['id_ktp'] = $id;
		foreach($bidang as $b) {
			$data['bidang_keahlian'] = $b;
			$result = $this->db->insert('bidang_tenaga_ahli', $data);
			if(!$result)
				return false;
		}
		return true;
	}
}
