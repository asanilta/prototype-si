<?php

class TenagaAhli extends CI_Model{
	function __construct() {
		parent::__construct();
	}

	public function get_all() {
		$result = $this->db->get('tenaga_ahli');
		return $result->result_array();
	}

	public function get_by_id($id) {
		$this->db->where('id_ktp', $id);
		$result = $this->db->get('tenaga_ahli');

		return $result->row_array();
	}

	public function insert($data) {
		$result = $this->db->insert('tenaga_ahli', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function delete($id)
	{
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

	public function get_bidang_by_id($id) {
		$this->db->where('id_ktp', $id);
		$result = $this->db->get('bidang_tenaga_ahli');
		return $result->result_array();
	}
}
