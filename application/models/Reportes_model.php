<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//include_once "Jugador.php";

class Reportes_model extends CI_Model {

    public function obtenerJugadores()
    {
        $this->db->select('id,first_name,last_name')
                 ->from('users')
                 ->where('id<>1');
        $jugadores=$this->db->get();
        $lista=['0'=>'Seleccione uno'];
        foreach($jugadores->result() as $jugador){
            $lista[$jugador->id]=$jugador->first_name." ".$jugador->last_name;
        }

        return $lista;
    }

    public function generarPorJugador($jugador=0,$fini='',$ffin='')
    {
        $jugador=(empty($jugador))?0:$jugador;
        $fini=(empty($fini))?'0000-00-00':$fini;
        $ffin=(empty($ffin))?date('Y-m-d'):$ffin;

        $this->db->select('fecha,hora,resultado')
                 ->from('partidas')
                 ->where(['id_jugador'=>$jugador,'fecha>='=>$fini,'fecha<='=>$ffin])
                 ->order_by('id','DESC');
        return $this->db->get()->result();
    }

}