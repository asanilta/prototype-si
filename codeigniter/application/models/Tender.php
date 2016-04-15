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
		$this->db->where('id_tender', $data['id_tender']);
		$result = $this->db->update('tender', $data);

		if($result)
			return true;
		else
			return false;
	}

	public function get_bidang_by_id($id) {
		$this->db->where('id_tender', $id);
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
		$this->db->where('id_tender', $id);
		$result = $this->db->get('persyaratan_tender');
		return $result->result_array();
	}

	public function get_tim_by_id($id) {
		$this->db->where('id_tender',$id);
		$result = $this->db->get('tim');
		return $result->result_array();
	}
}
