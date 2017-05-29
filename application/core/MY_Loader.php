<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Loader extends CI_Loader {

	public function __construct()
	{
		parent::__construct();
	}


	public function view($view, $vars = [], $layout='',$noprint=FALSE)
	{
		$layout=($layout=='')?config_item('layout'):$layout;
		$vars['contenido']=parent::view($view, $vars, TRUE);
		return parent::view($layout, $vars,$noprint);
	}

}
