<?php
require 'config/config.php';

$pedidos = '';
// $a = action
// $t = table

if(isset($_GET)){
    if(isset($_GET['login']))
    {
        $usuario = new Usuario();
        return $usuario->login();
    }
    if(isset($_GET['logout']))
    {
        $usuario = new Usuario();
        $usuario->logout();
    }

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
    if(isset($_GET['idCli']))
        $idCli = $_GET['idCli'];
    if(isset($_GET['idPro']))
        $idPro = $_GET['idPro'];
    if(isset($_GET['idFrac']))
        $idFrac = $_GET['idFrac'];
    if(isset($_GET['term']))
        $term = $_GET['term'];
    if(isset($_GET['cod']))
        $cod = $_GET['cod'];
    if(isset($_GET['codVend']))
        $codVend = $_GET['codVend'];
    if(isset($_GET['idListaCa']))
        $idListaCa = $_GET['idListaCa'];
   
    
    if(isset($accion) && $accion == 'get')
    {
        if(isset($tabla))
        {
            if($tabla == 'ped')
            {
                $pedid_ca = new Pedid_Ca();

                if(isset($nroPedido))
                    echo json_encode($pedid_ca->consultaPedido($nroPedido));                    
                else if(isset($codVend))
                    echo json_encode($pedid_ca->consultaTodosxCodVend($codVend));
                else
                    echo json_encode($pedid_ca->consultaTodos());

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
                    //echo $des;
                    echo json_encode($clien_ma->consultaDescripcion($des));
                }
                else if(isset($idCli))
                        echo json_encode($clien_ma->consultaCliente_Id($idCli));
                else if(isset($cod))
                    echo json_encode($clien_ma->consultaCodigoCliente($cod));
                else
                    echo json_encode($clien_ma->consulta_todos());
            }
            else if($tabla == 'prodma')
            {
                $produ_ma = new Produ_Ma();
                if(isset($idPro))
                {
                    echo json_encode($produ_ma->consultaProducto($idPro));
                }
                else if(isset($des)){
                    echo json_encode($produ_ma->consultaDescripcion($des));
                }
                else if(isset($cod))
                {
                    $codigoProducto = substr($cod, 0, 6)."000";
                    $codigoFraccio = substr($cod, 6);
                    echo json_encode ($produ_ma->consultaCodigoProducto($codigoProducto, $codigoFraccio));
                }
                else
                    echo json_encode ($produ_ma->consultaTodos());
            }
            else if($tabla == 'prodfrac')
            {
                $produ_frac = new Produ_Frac();
                if(isset($idPro) && isset($idFrac))
                {
                    echo json_encode($produ_frac->consultaProdFraccio($idPro, $idFrac));
                }
            }
            else if($tabla == 'listade')
            {
                $lista_de = new Lista_De();
                if(isset($idPro) && isset($idFrac) && isset($idListaCa))
                {
                    echo json_encode($lista_de->consultaListaPrecio($idPro, $idFrac,$idListaCa));
                }
            }
        }
    }
    else
    {
        if(isset($_GET['cliente']))
        {
            if(isset($term))
            {
                $clien_ma = new Clien_Ma();

                $sql = $clien_ma->consultaDescripcion($term);
                foreach ($sql as $dato){// as $dato){
                    $resultado[] = $dato['Codigo_Cliente'].' - '. $dato['Razon_Social'].' - '.$dato['Nombre_Fantasia'];
                }
                echo json_encode($resultado);
            }
        }
        else if (isset($_GET['producto']))
        {
            if(isset($term))
            {
                $produ_ma = new Produ_Ma();
                
                $sql = $produ_ma->consultaDescripcion($term);
                foreach ($sql as $dato){// as $dato){
                    $resultado[] = $dato['Codigo_Producto'].' - '. $dato['Descripcion_Producto'];
                }
                echo json_encode($resultado);
            }
        }
    }

}