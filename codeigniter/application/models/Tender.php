<?php

class Tender extends CI_Model{
	function __construct() {
		parent::__construct();
	}

	public function get_all() {
		$result = $this->db->get('tender');
		return $result->result_array();
	}

	public function get_by_id($id) {
		$this->db->where('id_tender', $id);
		$result = $this->db->get('tender');

		return $result->row_array();
	}

	public function insert($data) {
		$result = $this->db->insert('tender', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function delete($id)
	{
		$this->db->where('id_tender', $id);
		$result = $this->db->delete('tender');
		
		return $this->db->affected_rows();
	}

	public function update($data) {
		$this->db->where('id_tender', $id);
		$result = $this->db->update('tender', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function get_bidang_by_id($id) {
		$this->db->where('id_tender', $data['id_tender']);
		$result = $this->db->get('bidang_tender');
		return $result->result_array();
	}

	public function get_tenaga_in_tender($id) {
		$this->db->where('id_tender', $id);
		$result = $this->db->get('tenaga_tender');
		return $result->result_array();
	}
}