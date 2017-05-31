<?php
class Pedid_Ca{
    protected $Nro_Pedido;
    protected $id_Cliente;
    protected $Fecha_Pedido;
    protected $Codigo_Vendedor;
    protected $Nro_Cotizacion;
    protected $Nro_Presupuesto;
    protected $Id_Lista;
    protected $Id_Condicion;
    protected $Id_Moneda;
    protected $Cotizacion_Moneda;
    protected $Estado;
    protected $Id_Reparto;
    protected $Nro_orden_compra;
    protected $Id_Tomado_Por;
    protected $Id_Usuario;
    protected $Fecha_Operacion;
    protected $Id_Grupo_Cliente;
    protected $Total_Gravado;
    protected $Total_Exento;
    protected $Total_Producto_Ex;
    protected $Porc_Iva_Ins;
    protected $Iva_Ins;
    protected $Porc_Iva_NoIns;
    protected $Iva_NoIns;
    protected $Porc_IngBr_Cba;
    protected $IngBr_Cba;
    protected $Porc_IngBr_Pba;
    protected $IngBr_Pba;
    protected $Total_Neto;
    protected $Descuento;
    protected $Id_Transporte;
    protected $Generado_Por;
    protected $Porc_IngBr_Mis;
    protected $IngBr_Mis;

    public $CantidadPedidos;

    public function consultaTodos(){
        try{
            $conexion = Conexion::conectar()->prepare("CALL Pedid_Ca_Cons()");
            $conexion->execute();
            $this->CantidadPedidos = $conexion->rowCount();
            return $conexion->fetchAll(PDO::FETCH_ASSOC);
        }catch(PDOException $e)
        {
            $e->getMessage();
        }
    }
    public function consultaPedido($NroPedido){
        $sql = "SELECT * FROM Pedid_Ca WHERE Nro_Pedido = $NroPedido";
        try{
            $conexion = Conexion::conectar()->prepare($sql);
            $conexion->execute();
            $r = $conexion->fetch(PDO::FETCH_ASSOC);

            $this->id_Cliente = $r['id_Cliente'];
            $this->Nro_Pedido = $r['Nro_Pedido'];
            $this->Fecha_Pedido = $r['Fecha_Pedido'];



            return $r;
        }catch(PDOException $e)
        {
            $e->getMessage();
        }
    }
    
    public function consultaPedidoLimitado($inicio, $fin){
        $sql = "SELECT * FROM Pedid_Ca LIMIT $inicio, $fin";
        try{
            $conexion = Conexion::conectar()->prepare($sql);
            $conexion->execute();
            return $conexion->fetchALL(PDO::FETCH_ASSOC);
            
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }
            
    public function altaPedido(){
        $sql = "INSERT INTO Pedid_Ca () values ()";
        try{
            $conexion = Conexion::conectar()->prepare($sql);
            return $conexion->execute();
        }catch(PDOException $e)
        {
            $e->getMessage();
        }
    }

    public function editarPedido(){
        $sql = "UPDATE Pedid_Ca SET blabla = ''";
        try{
            $conexion = Conexion::conectar()->prepare($sql);
            return $conexion->execute();
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

    public function getIdCliente()
    {
        return $this->id_Cliente;
    }

    public function setIdCliente($id_Cliente)
    {
        $this->id_Cliente = $id_Cliente;
    }

    public function getFechaPedido()
    {
        return $this->Fecha_Pedido;
    }

    public function setFechaPedido($Fecha_Pedido)
    {
        $this->Fecha_Pedido = $Fecha_Pedido;
    }

    public function getCodigoVendedor()
    {
        return $this->Codigo_Vendedor;
    }

    public function setCodigoVendedor($Codigo_Vendedor)
    {
        $this->Codigo_Vendedor = $Codigo_Vendedor;
    }

    public function getNroCotizacion()
    {
        return $this->Nro_Cotizacion;
    }

    public function setNroCotizacion($Nro_Cotizacion)
    {
        $this->Nro_Cotizacion = $Nro_Cotizacion;
    }

    public function getNroPresupuesto()
    {
        return $this->Nro_Presupuesto;
    }

    public function setNroPresupuesto($Nro_Presupuesto)
    {
        $this->Nro_Presupuesto = $Nro_Presupuesto;
    }

    public function getIdLista()
    {
        return $this->Id_Lista;
    }

    public function setIdLista($Id_Lista)
    {
        $this->Id_Lista = $Id_Lista;
    }

    public function getIdCondicion()
    {
        return $this->Id_Condicion;
    }

    public function setIdCondicion($Id_Condicion)
    {
        $this->Id_Condicion = $Id_Condicion;
    }

    public function getIdMoneda()
    {
        return $this->Id_Moneda;
    }

    public function setIdMoneda($Id_Moneda)
    {
        $this->Id_Moneda = $Id_Moneda;
    }

    public function getCotizacionMoneda()
    {
        return $this->Cotizacion_Moneda;
    }

    public function setCotizacionMoneda($Cotizacion_Moneda)
    {
        $this->Cotizacion_Moneda = $Cotizacion_Moneda;
    }

    public function getEstado()
    {
        return $this->Estado;
    }

    public function setEstado($Estado)
    {
        $this->Estado = $Estado;
    }

    public function getIdReparto()
    {
        return $this->Id_Reparto;
    }

    public function setIdReparto($Id_Reparto)
    {
        $this->Id_Reparto = $Id_Reparto;
    }

    public function getNroOrdenCompra()
    {
        return $this->Nro_orden_compra;
    }

    public function setNroOrdenCompra($Nro_orden_compra)
    {
        $this->Nro_orden_compra = $Nro_orden_compra;
    }

    public function getIdTomadoPor()
    {
        return $this->Id_Tomado_Por;
    }

    public function setIdTomadoPor($Id_Tomado_Por)
    {
        $this->Id_Tomado_Por = $Id_Tomado_Por;
    }

    public function getIdUsuario()
    {
        return $this->Id_Usuario;
    }

    public function setIdUsuario($Id_Usuario)
    {
        $this->Id_Usuario = $Id_Usuario;
    }

    public function getFechaOperacion()
    {
        return $this->Fecha_Operacion;
    }

    public function setFechaOperacion($Fecha_Operacion)
    {
        $this->Fecha_Operacion = $Fecha_Operacion;
    }

    public function getIdGrupoCliente()
    {
        return $this->Id_Grupo_Cliente;
    }

    public function setIdGrupoCliente($Id_Grupo_Cliente)
    {
        $this->Id_Grupo_Cliente = $Id_Grupo_Cliente;
    }

    public function getTotalGravado()
    {
        return $this->Total_Gravado;
    }

    public function setTotalGravado($Total_Gravado)
    {
        $this->Total_Gravado = $Total_Gravado;
    }

    public function getTotalExento()
    {
        return $this->Total_Exento;
    }

    public function setTotalExento($Total_Exento)
    {
        $this->Total_Exento = $Total_Exento;
    }

    public function getTotalProductoEx()
    {
        return $this->Total_Producto_Ex;
    }

    public function setTotalProductoEx($Total_Producto_Ex)
    {
        $this->Total_Producto_Ex = $Total_Producto_Ex;
    }

    public function getPorcIvaIns()
    {
        return $this->Porc_Iva_Ins;
    }

    public function setPorcIvaIns($Porc_Iva_Ins)
    {
        $this->Porc_Iva_Ins = $Porc_Iva_Ins;
    }

    public function getIvaIns()
    {
        return $this->Iva_Ins;
    }

    public function setIvaIns($Iva_Ins)
    {
        $this->Iva_Ins = $Iva_Ins;
    }

    public function getPorcIvaNoIns()
    {
        return $this->Porc_Iva_NoIns;
    }

    public function setPorcIvaNoIns($Porc_Iva_NoIns)
    {
        $this->Porc_Iva_NoIns = $Porc_Iva_NoIns;
    }

    public function getIvaNoIns()
    {
        return $this->Iva_NoIns;
    }

    public function setIvaNoIns($Iva_NoIns)
    {
        $this->Iva_NoIns = $Iva_NoIns;
    }

    public function getPorcIngBrCba()
    {
        return $this->Porc_IngBr_Cba;
    }

    public function setPorcIngBrCba($Porc_IngBr_Cba)
    {
        $this->Porc_IngBr_Cba = $Porc_IngBr_Cba;
    }

    public function getIngBrCba()
    {
        return $this->IngBr_Cba;
    }

    public function setIngBrCba($IngBr_Cba)
    {
        $this->IngBr_Cba = $IngBr_Cba;
    }

    public function getPorcIngBrPba()
    {
        return $this->Porc_IngBr_Pba;
    }

    public function setPorcIngBrPba($Porc_IngBr_Pba)
    {
        $this->Porc_IngBr_Pba = $Porc_IngBr_Pba;
    }

    public function getIngBrPba()
    {
        return $this->IngBr_Pba;
    }

    public function setIngBrPba($IngBr_Pba)
    {
        $this->IngBr_Pba = $IngBr_Pba;
    }

    public function getTotalNeto()
    {
        return $this->Total_Neto;
    }

    public function setTotalNeto($Total_Neto)
    {
        $this->Total_Neto = $Total_Neto;
    }

    public function getDescuento()
    {
        return $this->Descuento;
    }

    public function setDescuento($Descuento)
    {
        $this->Descuento = $Descuento;
    }

    public function getIdTransporte()
    {
        return $this->Id_Transporte;
    }

    public function setIdTransporte($Id_Transporte)
    {
        $this->Id_Transporte = $Id_Transporte;
    }

    public function getGeneradoPor()
    {
        return $this->Generado_Por;
    }

    public function setGeneradoPor($Generado_Por)
    {
        $this->Generado_Por = $Generado_Por;
    }

    public function getPorcIngBrMis()
    {
        return $this->Porc_IngBr_Mis;
    }

    public function setPorcIngBrMis($Porc_IngBr_Mis)
    {
        $this->Porc_IngBr_Mis = $Porc_IngBr_Mis;
    }

    public function getIngBrMis()
    {
        return $this->IngBr_Mis;
    }

    public function setIngBrMis($IngBr_Mis)
    {
        $this->IngBr_Mis = $IngBr_Mis;
    }

    public function getCantidadPedidos()
    {
        return $this->CantidadPedidos;
    }

    public function setCantidadPedidos($CantidadPedidos)
    {
        $this->CantidadPedidos = $CantidadPedidos;
    }


}

