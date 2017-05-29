<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class MY_Controller extends CI_Controller 
{	
	protected $not_auth=[];

	public function __construct()
	{
		parent::__construct();
		//permisos de ejecución sólo para usuarios autenticados.
		if(!in_array($this->router->method,$this->not_auth) and !$this->ion_auth->logged_in()){
            redirect('/');
		}
	}

}