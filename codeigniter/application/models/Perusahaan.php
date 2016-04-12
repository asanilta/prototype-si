<?php

class Perusahaan extends CI_Model{
	function __construct() {
		parent::__construct();
	}

	public function get_all() {
		$result = $this->db->get('perusahaan');
		return $result->result_array();
	}

	public function get_by_id($id) {
		$this->db->where('id_perusahaan', $id);
		$result = $this->db->get('perusahaan');

		return $result->row_array();
	}

	public function insert($data) {
		$result = $this->db->insert('perusahaan', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function delete($id)
	{
		$this->db->where('id_perusahaan', $id);
		$result = $this->db->delete('perusahaan');
		
		return $this->db->affected_rows();
	}

	public function update($data) {
		$this->db->where('id_perusahaan', $data['id_perusahaan']);
		$result = $this->db->update('perusahaan', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function get_bidang_by_id($id) {
		$this->db->where('id_perusahaan', $id);
		$result = $this->db->get('bidang_perusahaan');
		return $result->result_array();
	}
}