<?php

class Dokumen extends CI_Model{
	function __construct() {
		parent::__construct();
	}

	public function get_all() {
		$result = $this->db->get('dokumen')->result_array();
		
		return $result;
	}

	public function get_by_id($id, $jenis) {
		if(strcmp($jenis,'tenaga_ahli') == 0) {
			$this->db->where('id_dokumen', $id);
			$result = $this->db->get('dokumen_tenaga_ahli')->row_array();
		}
		else {
			$this->db->where('id_dokumen', $id);
			$result = $this->db->get('dokumen')->row_array();
		}

		return $result;
	}

	public function get_by_letak($letak) {
		$this->db->where('letak_dokumen', $letak);
		$result = $this->db->get('dokumen');

		return $result->result_array();
	}

	public function insert_dokumen($data) {
		return $this->db->insert('dokumen',$data);
	}

}

