<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//include_once "application/models/Jugador.php";

class Main extends MY_Controller 
{	

    public function salones()
    {
        $datos['salones'] = range(1,18);
        print_r($datos['salones']);
        $datos['javascript']='main';    
        $this->load->view('main.phtml',$datos);
    }

    public function obtenerColor(){
        $rpta['colores'] = array_fill(0,18,1);
        echo json_encode($rpta);
    }

    /*public function jugadores()
    {
        $datos['jugador']=$this->input->post('jugador');
        $datos['fini']=$this->input->post('fini');
        $datos['ffin']=$this->input->post('ffin');
        
        $this->load->model('Reportes_model','reportes');
        $datos['jugadores']=$this->reportes->obtenerJugadores();
        $datos['partidas']=$this->reportes->generarPorJugador($datos['jugador'],$datos['fini'],$datos['ffin']);
        $this->load->helper('form');
        $this->load->view('reportes_jugador.phtml',$datos); 
    }*/


}