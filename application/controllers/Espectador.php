<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//include_once "application/models/Jugador.php";

class Espectador extends MY_Controller 
{	

    public function index()
    {
        $datos=$this->narracion->cargar();
        $datos['javascript']='espectador';       
        $this->load->view('narracion.phtml',$datos);
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
