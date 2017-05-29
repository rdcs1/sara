<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require "D:/xampp/htdocs/sinavi/application/libraries/Pusher.php";
class Narracion_model extends CI_Model 
{

    public function cargar()
    {
        $evento=$this->db->from('narraciones')
                         ->where('estado',1) //se asume un sólo evento activo
                         ->get()->row();
        if($evento){
            $datos['narracion']=$this->db->from('comentarios')
                                          ->where('id_narracion',$evento->id)
                                          ->order_by('id','DESC')
                                          ->get()->result();
        }
        $datos['evento']=$evento;                         
        return $datos;                         
    }

    public function crearEvento($evento)
    {
        $this->db->insert('narraciones',[
                                         'id'=>0,
                                         'equipo1'=>$evento->equipo1,
                                         'equipo2'=>$evento->equipo2,
                                         'marcador1'=>$evento->marcador1,
                                         'marcador2'=>$evento->marcador2,
                                         'estado'=>1,
                                    ]
                         );

    }

    public function adicionarComentario($minuto,$comentario,$narracion)
    {
        $this->db->insert('comentarios',[
                                         'id'=>0,
                                         'minuto'=>$minuto,
                                         'comentario'=>$comentario,
                                         'id_narracion'=>$narracion
                                    ]
                         );

      $pusher = new Pusher(
        'f9846fc047fb7f9caa86',
        '9ff518cc0f5ea7bc154c',
        '342160',
        $options
      );

      $data[] = ['minuto'=>$minuto, 'comentario' => $comentario];
      $pusher->trigger('sinavi', 'new-comment', $data);

    }



    public function existeEvento()
    {
        return $this->db->from('narraciones')->where('estado',1)->count_all_results();
    }

}