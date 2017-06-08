<?php
require 'config/config.php';

$pedidos = '';
// $a = action
// $t = table

if(isset($_GET)){
    if(isset($_GET['a']))
        $accion = $_GET['a'];
    if(isset($_GET['t']))
        $tabla = $_GET['t'];
    if(isset($_GET['n']))
        $nroPedido = $_GET['n'];
    if(isset($_GET['ini']))
        $inicio = $_GET['ini'];
    if(isset($_GET['fin']))
        $fin = $_GET['fin'];
    if(isset($_GET['des']))
        $des = $_GET['des'];
    
    if(isset($accion) && $accion == 'get')
    {

        if(isset($tabla))
        {
            if($tabla == 'ped')
            {
                $pedid_ca = new Pedid_Ca();

                if(!isset($nroPedido))
                    echo json_encode($pedid_ca->consultaTodos());
                else
                    echo json_encode($pedid_ca->consultaPedido($nroPedido));

            }
            else if($tabla == 'pedide')
            {
                $pedid_de = new Pedid_De();
                if(isset($nroPedido))
                    echo json_encode($pedid_de->consultaPedidoDetalle($nroPedido));
            }
            else if($tabla == 'cli')
            {
                $clien_ma = new Clien_Ma();
                
                if(isset($des))
                {
                    echo json_encode($clien_ma->consultaDescripcion($des));
                }
            }

        }
    }


}