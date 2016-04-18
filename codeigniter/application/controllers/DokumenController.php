<?php

class DokumenController extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper(array('form','url'));
	}

	function index()
	{
		$this->load->view('upload_form', array('error' => ' ' ));
	}

	function do_upload()
	{
		$config['upload_path'] = './dokumen/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size']	= '5000';
		$config['max_width']  = '5000';
		$config['max_height']  = '5000';

		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload())
		{
			$error = array('error' => $this->upload->display_errors());

			$this->load->view('upload_form', $error);
		}
		else
		{
			$data = array('upload_data' => $this->upload->data());

			$this->load->view('upload_success', $data);
		}
	}
}
?>