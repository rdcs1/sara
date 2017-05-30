<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller 
{	
	protected $not_auth=['index','user'];

	public function index()
	{
		$data['errors']=$this->session->flashdata('errors');
		$this->load->view('login.phtml',$data,'login.layout.phtml');
	}

	public function user()
	{
		$user=$this->input->post('user');
		$password=$this->input->post('password');
		if($this->ion_auth->login($user, $password)){
			if($this->ion_auth->is_admin()){
				redirect('main','refresh');
			}
			else{
			    redirect('espectador','refresh');
			}
		}
		else{
			$this->session->set_flashdata('errors', $this->ion_auth->errors());
			redirect('/','refresh');
		}
	}

	public function logout()
	{
		$this->ion_auth->logout();
		redirect('/');
	}
}
