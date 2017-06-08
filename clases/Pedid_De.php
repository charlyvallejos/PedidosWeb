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
            $e->getMessage();
        }
    }















    public function getNroPedido()
    {
        return $this->Nro_Pedido;
    }

    public function setNroPedido($Nro_Pedido)
    {
        $this->Nro_Pedido = $Nro_Pedido;
    }

    public function getRenglon()
    {
        return $this->Renglon;
    }

    public function setRenglon($Renglon)
    {
        $this->Renglon = $Renglon;
    }

    public function getIdProducto()
    {
        return $this->Id_Producto;
    }

    public function setIdProducto($Id_Producto)
    {
        $this->Id_Producto = $Id_Producto;
    }

    public function getIdFraccio()
    {
        return $this->Id_Fraccio;
    }

    public function setIdFraccio($Id_Fraccio)
    {
        $this->Id_Fraccio = $Id_Fraccio;
    }

    public function getCodigoProducto()
    {
        return $this->Codigo_Producto;
    }

    public function setCodigoProducto($Codigo_Producto)
    {
        $this->Codigo_Producto = $Codigo_Producto;
    }

    public function getCantidad()
    {
        return $this->Cantidad;
    }

    public function setCantidad($Cantidad)
    {
        $this->Cantidad = $Cantidad;
    }

    public function getPrecio()
    {
        return $this->Precio;
    }

    public function setPrecio($Precio)
    {
        $this->Precio = $Precio;
    }

    public function getPrecioLista()
    {
        return $this->Precio_Lista;
    }

    public function setPrecioLista($Precio_Lista)
    {
        $this->Precio_Lista = $Precio_Lista;
    }

    public function getEstado()
    {
        return $this->Estado;
    }

    public function setEstado($Estado)
    {
        $this->Estado = $Estado;
    }

    public function getNroCotizacion()
    {
        return $this->Nro_Cotizacion;
    }

    public function setNroCotizacion($Nro_Cotizacion)
    {
        $this->Nro_Cotizacion = $Nro_Cotizacion;
    }

    public function getFechaCotizacion()
    {
        return $this->Fecha_Cotizacion;
    }

    public function setFechaCotizacion($Fecha_Cotizacion)
    {
        $this->Fecha_Cotizacion = $Fecha_Cotizacion;
    }

    public function getNroDespacho()
    {
        return $this->Nro_Despacho;
    }

    public function setNroDespacho($Nro_Despacho)
    {
        $this->Nro_Despacho = $Nro_Despacho;
    }

    public function getNroLote()
    {
        return $this->Nro_Lote;
    }

    public function setNroLote($Nro_Lote)
    {
        $this->Nro_Lote = $Nro_Lote;
    }

    public function getIdOrigen()
    {
        return $this->Id_Origen;
    }

    public function setIdOrigen($Id_Origen)
    {
        $this->Id_Origen = $Id_Origen;
    }


}