<?php
require 'config/config.php';
if(!empty(isset($_POST)))
{
    $pedido = $_POST['pedido'];
    if(intval($pedido['Nro_Pedido']) > 0)
    {
        $conexion = Conexion::conectar();
        $conexion->beginTransaction();

        $nroPedido = intval($pedido['Nro_Pedido']);
        $pedid_ca = new Pedid_Ca();
        $ok = false;

        if($pedid_ca->editarPedido($conexion))
        {
            $pedid_de = new Pedid_De();
            if($pedid_de->editarPedido_detalle($conexion,$pedido,$nroPedido))
            {
                $conexion->commit();
                $ok = true;
            }
            else
            {
                $conexion->rollBack();
            }

        }
        else
        {
            $conexion->rollBack();
        }

        if($ok)
            echo json_encode(array("ok" => true, "pedido" => $pedido));
        else
            echo json_encode(array("ok" => false,"pedido" => false));

    }else
        if(!isset($pedido['Nro_Pedido']) || intval($pedido['Nro_Pedido']) == 0)
        {
            $conexion = Conexion::conectar();
            $conexion->beginTransaction();

            $pedid_ca = new Pedid_Ca();
            $ok = false;
            $NroPedidoCa = $pedid_ca->altaPedido($conexion);
            if($NroPedidoCa > 0)
            {
                $pedid_de = new Pedid_De();
                if($pedid_de->altaPedido_detalle($conexion,$pedido,$NroPedidoCa))
                {
                    $pedid_ca->actualizar_Numeracion($conexion);
                    $pedido['Nro_Pedido'] = $NroPedidoCa;
                    $conexion->commit();
                    $ok = true;
                }else
                    $conexion->rollBack();
            }else
                $conexion->rollBack();


            if($ok)
                echo json_encode(array("ok" => true, "pedido" => $pedido));
            else
                echo json_encode(array("ok" => false,"nroPedido" => $NroPedidoCa));
        }
}