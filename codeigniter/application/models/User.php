<?php

class User extends CI_Model{
	function __construct() {
		parent::__construct();
	}

	public function get_all() {
		$result = $this->db->get('user');
		return $result->result_array();
	}

	public function get_by_username($username) {
		$this->db->where('username', $username);
		$result = $this->db->get('user');

		return $result->row_array();
	}

	public function get_tender_by_username($username) {
		$this->db->from('tim')
			->join('tender','tim.id_tender=tender.id_tender')
			->where('username', $username);
		
		$result = $this->db->get();

		return $result->result_array();
	}

	public function get_reminder_by_username($username) {
		$where = 'tenggat_prakualifikasi < DATE_ADD(NOW(), INTERVAL 7 DAY)';
		$this->db->select('tender.id_tender, nama_tender, tenggat_prakualifikasi')
			->from('tim')
			->join('tender','tim.id_tender=tender.id_tender')
			->where('username', $username)
			->where($where);
		
		$result = $this->db->get()->result_array();
		$this->db->flush_cache();

		$where = 'tenggat_akhir < DATE_ADD(NOW(), INTERVAL 7 DAY)';
		$this->db->select('tender.id_tender, nama_tender, tenggat_akhir')
			->from('tim')
			->join('tender','tim.id_tender=tender.id_tender')
			->where('username', $username)
			->where($where);
		
		$result = array_merge($this->db->get()->result_array(), $result);
		
		return $result;
	}
}