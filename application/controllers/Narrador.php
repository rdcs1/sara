<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Narrador extends MY_Controller 
{	    

    public function __construct()
    {
        parent::__construct();
        if(!$this->ion_auth->is_admin()){
            redirect('/logout','refresh');
        }
    }
    public function index()
    {
      	if($this->narracion->existeEvento()){
            $datos=$this->narracion->cargar();
            $this->session->narracion=$datos['evento']->id;        
            $datos['javascript']='narrador';
            $this->load->view('narrador.phtml',$datos);    
        }
        else{
            $this->load->view('crearevento.phtml');
        }       
        
    }

    public function crearEvento()
    {
        if(!$this->narracion->existeEvento()){
            $evento=new stdClass();
            $evento->equipo1=$this->input->post('equipo1');
            $evento->marcador1=$this->input->post('marcador1');
            $evento->equipo2=$this->input->post('equipo2');
            $evento->marcador2=$this->input->post('marcador2');
            $this->session->narracion=$this->narracion->crearEvento($evento);
            $datos['evento']=$evento;
            $datos['narracion']=[];
        }
        else{
            $datos=$this->narracion->cargar();
            $this->session->narracion=$datos['evento']->id;
        }
                
        $datos['javascript']='narrador';
        $this->load->view('narrador.phtml',$datos);   

    }

    public function adicionarComentario()
    {
        $rpta['minuto']=$this->input->post('minuto');
        $rpta['comentario']=$this->input->post('comentario');
        $this->narracion->adicionarComentario($rpta['minuto'],$rpta['comentario'],$this->session->narracion);
        $rpta['result']='ok';
        echo json_encode($rpta);
    }

   
}
