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
}