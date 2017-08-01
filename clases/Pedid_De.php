<?php

class Pedid_De
{
    private $Nro_Pedido;
    private $Renglon;
    private $Id_Producto;
    private $Id_Fraccio;
    private $Codigo_Producto;
    private $Cantidad;
    private $Precio;
    private $Precio_Lista;
    private $Estado;
    private $Nro_Cotizacion;
    private $Fecha_Cotizacion;
    private $Nro_Despacho;
    private $Nro_Lote;
    private $Id_Origen;


    public function consultaPedidoDetalle($NroPedido){
        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare("CALL Pedid_De_Igual_Nro_Pedido(:NroPedido)");
            $query->bindParam(':NroPedido',$NroPedido,PDO::PARAM_INT);

            $query->execute();
            $r = $query->fetchAll(PDO::FETCH_ASSOC);

            return $r;
        }catch(PDOException $e)
        {
            return $e->getMessage();
        }
    }
    public function editarPedido_detalle($conexion,$pedido,$nroPedido){
        try{
            //if(isset($_POST['Productos']))
            //{
            $productos = $pedido['Productos'];
                if(count($productos) > 0)
                {
                    $query = $conexion->prepare("CALL Pedid_De_Delete_Igual_Nro(:NroPedido)");
                    $query->bindParam(':NroPedido',$nroPedido,PDO::PARAM_INT);
                    if($query->execute())
                        return $this->altaPedido_detalle($conexion,$pedido,$nroPedido);
                }
            //}
            return false;
        }catch(PDOException $e){
            return $e->getMessage();
        }
    }
    public function altaPedido_detalle($conexion,$pedido = null,$nroPedido){
        $sql = "CALL Pedid_De_Insert(:Nro_Pedido,:Renglon,:Id_Producto,:Id_Fraccio,:Codigo_Producto,
                                     :Cantidad,:Precio,:Precio_Lista,:Estado,:Nro_Cotizacion,:Fecha_Cotizacion,
                                     :Nro_Despacho,:Nro_Lote,:Id_Origen)";
        try{
            if(!is_null($pedido) && isset($pedido['Productos']))
            {
                $productos = $pedido['Productos'];
                $cantidad_reg = 0;
                if(count($productos) > 0)
                {

                    foreach ($productos as $producto)
                    {
                        $query = $conexion->prepare($sql);

                        $this->cargarDatosFormulario($producto);
                        /*
                                        if(is_null($pedido['Nro_Pedido']))
                                            $NumeroPedido = $this->traerUltimoNumero($conexion);
                                        else
                                            $NumeroPedido = $pedido['Nro_Pedido'];
                        */
                        $Renglon = $this->Renglon;
                        $Id_Producto = $this->Id_Producto;
                        $Id_Fraccio = $this->Id_Fraccio;
                        $Codigo_Producto = $this->Codigo_Producto;
                        $Cantidad = $this->Cantidad;
                        $Precio = $this->Precio;
                        $Precio_Lista = $this->Precio_Lista;
                        $Estado = $this->Estado;
                        $Nro_Cotizacion = $this->Nro_Cotizacion;
                        $Fecha_Cotizacion = $this->Fecha_Cotizacion;
                        $Nro_Despacho = $this->Nro_Despacho;
                        $Nro_Lote = $this->Nro_Lote;
                        $Id_Origen = $this->Id_Origen;

                        $query->bindParam(':Nro_Pedido',$nroPedido);
                        $query->bindParam(':Renglon',$Renglon);
                        $query->bindParam(':Id_Producto', $Id_Producto);
                        $query->bindParam(':Id_Fraccio',$Id_Fraccio);
                        $query->bindParam(':Codigo_Producto',$Codigo_Producto);
                        $query->bindParam(':Cantidad',$Cantidad);
                        $query->bindParam(':Precio',$Precio);
                        $query->bindParam(':Precio_Lista',$Precio_Lista);
                        $query->bindParam(':Estado',$Estado);
                        $query->bindParam(':Nro_Cotizacion',$Nro_Cotizacion);
                        $query->bindParam(':Fecha_Cotizacion',$Fecha_Cotizacion);
                        $query->bindParam(':Nro_Despacho',$Nro_Despacho);
                        $query->bindParam(':Nro_Lote',$Nro_Lote);
                        $query->bindParam(':Id_Origen',$Id_Origen);

                        if($query->execute())
                            $cantidad_reg++;
                    }

                    if(count($productos) == $cantidad_reg)
                        return true;
                }
            }

            return false;
        }catch(PDOException $e){
            return $e->getMessage();
        }
    }
    private function cargarDatosFormulario($producto){

        if(isset($_POST))
        {
            if(intval($producto['Nro_Pedido']) > 0)
                $this->Nro_Pedido = intval($producto['Nro_Pedido']);
            else
                $this->Nro_Pedido = 0;

            $this->Renglon = intval($producto['Renglon']);
            $this->Id_Producto = intval($producto['Id_Producto']);
            $this->Id_Fraccio = intval($producto['Id_Fraccio']);
            $this->Codigo_Producto = $producto['Codigo_Producto'];
            $this->Cantidad = floatval($producto['Cantidad']);
            $this->Precio = floatval($producto['Precio']);
            $this->Precio_Lista = floatval($producto['Precio_Lista']);
            $this->Estado = $producto['Estado'];
            $this->Nro_Cotizacion = $producto['Nro_Cotizacion'];
            $this->Fecha_Cotizacion = $producto['Fecha_Cotizacion'];
            $this->Nro_Despacho = $producto['Nro_Despacho'];
            $this->Nro_Lote = $producto['Nro_Lote'];
            $this->Id_Origen = intval($producto['Id_Origen']);
        }
    }
    private function traerUltimoNumero($conexion){
        //$conexion = Conexion::conectar();
        $sql = "SELECT Numero FROM Pedid_Numer LIMIT 1";
        $query = $conexion->prepare($sql);
        $query->execute();

        return $query->fetch()['Numero'];
    }

}