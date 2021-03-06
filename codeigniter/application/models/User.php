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
		
		$result = $this->db->get()->result_array();
		foreach($result as &$tender) {
			$tender['tenggat_prakualifikasi'] = date("d-m-Y", strtotime($tender['tenggat_prakualifikasi']));
			$tender['tenggat_akhir'] = date("d-m-Y", strtotime($tender['tenggat_akhir']));
		}

		return $result;
	}

	public function get_reminder_by_username($username) {
		$where = 'tenggat_prakualifikasi < DATE_ADD(NOW(), INTERVAL 7 DAY)';
		$this->db->select('tender.id_tender, nama_tender, tenggat_prakualifikasi as tenggat, DATEDIFF(tenggat_prakualifikasi, CURRENT_DATE) as hari')
			->from('tim')
			->join('tender','tim.id_tender=tender.id_tender')
			->where('username', $username)
			->where($where);
		
		$result = $this->db->get()->result_array();
		foreach ($result as &$temp) {
			$temp['tahap_tender'] = 'prakualifikasi';
		}
		$this->db->flush_cache();

		$where = 'tenggat_akhir < DATE_ADD(NOW(), INTERVAL 7 DAY)';
		$this->db->select('tender.id_tender, nama_tender, tenggat_akhir as tenggat, DATEDIFF(tenggat_akhir, CURRENT_DATE) as hari')
			->from('tim')
			->join('tender','tim.id_tender=tender.id_tender')
			->where('username', $username)
			->where($where);
		$result2 = $this->db->get()->result_array();
		foreach ($result2 as &$temp) {
			$temp['tahap_tender'] = 'akhir';
		}
		$result = array_merge($result2, $result);
		
		return $result;
	}
}