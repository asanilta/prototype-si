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

		if($result) {
			$this->db->flush_cache();
			$this->db->select('id_perusahaan')
				->from('perusahaan')
				->where('nama_perusahaan',$data['nama_perusahaan']);
			$id = $this->db->get()->row_array();
			return $id['id_perusahaan'];
		}
		else return 0;
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

	public function insert_bidang_by_id($id, $bidang) {
		$this->db->where('id_perusahaan', $id);
		$result = $this->db->delete('bidang_perusahaan');
		$data['id_perusahaan'] = $id;
		if($bidang == null)
			return true;
		foreach($bidang as $b) {
			$data['bidang_perusahaan'] = $b;
			$result = $this->db->insert('bidang_perusahaan', $data);
			if(!$result)
				return false;
		}
		return true;
	}
}