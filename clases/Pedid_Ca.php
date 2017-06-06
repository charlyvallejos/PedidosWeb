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
        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare("CALL Pedid_Ca_Igual_Nro_Pedido(:NroPedido)");
            $query->bindParam(':NroPedido',$NroPedido,PDO::PARAM_INT);

            $query->execute();
            $r = $query->fetch(PDO::FETCH_ASSOC);

            //Y todos los datos que hagan falta para la modificacion
            $this->id_Cliente = $r['id_Cliente'];
            $this->Nro_Pedido = $r['Nro_Pedido'];
            $this->Fecha_Pedido = $r['Fecha_Pedido'];


            return $r;
        }catch(PDOException $e)
        {
            $e->getMessage();
        }
    }
    
    public function consultaPedidoLimitado($pagenumber, $itemsperpage){
        //$sql = "SELECT * FROM Pedid_Ca LIMIT $inicio, $fin";
        $sql = "SELECT * FROM Pedid_Ca LIMIT (:param_uno, :param_dos";
        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare($sql);
            $param_uno = $pagenumber -1 * $itemsperpage;

            $query->bindParam(':param_uno',$param_uno);
            $query->bindParam(':param_dos',$itemsperpage);

            $query->execute();
            return $conexion->fetchALL(PDO::FETCH_ASSOC);
            
        } catch (PDOException $e) {
            $e->getMessage();
        }
    }
            
    public function altaPedido(){
        //$sql = "INSERT INTO Pedid_Ca () values ()";
        try{
            $conexion = Conexion::conectar();

            //TODO rutina insertar de pedidosWeb


            // esto es tedioso tipear pero evitamos el asqueroso entrecomillado

            $sql = "CALL Pedid_Ca_Insert(
                                        :Nro_Pedido,
                                        :Fecha_Pedido,
                                        :Codigo_Vendedor,
                                        :Nro_Cotizacion
                                        :Nro_Presupuesto,
                                        :Id_Lista,
                                        :Id_Condicion,
                                        :Id_Moneda,
                                        :Cotizacion_Moneda,
                                        :Estado,
                                        :Id_Reparto,
                                        :Nro_orden_compra,
                                        :Id_Tomado_Por,
                                        :Id_Usuario,
                                        :Fecha_Operacion,
                                        :Id_Grupo_Cliente,
                                        :Total_Gravado,
                                        :Total_Exento,
                                        :Total_Producto_Exento,
                                        :Porc_Iva_Ins,
                                        :Iva_Ins,
                                        :Porc_Iva_NoIns,
                                        :Iva_NoIns,
                                        :Porc_IngBr_Cba,
                                        :IngBr_Cba,
                                        :Porc_IngBr_Pba,
                                        :IngBr_Pba,
                                        :Total_Neto,
                                        :Descuento,
                                        :Id_Transporte,
                                        :Generado_Por,
                                        :Porc_IngBr_Mis,
                                        :IngBr_Mis)";

            $query = $conexion->prepare($sql); //El prepare es para que no puedan inyectar codigo

            $this->cargarDatosFormulario(); //Trae los datos de $_POST

            /////// TRAE DE PEDID_NUMER ///////////////
            $NumeroPedido = $this->traerUltimoNumero();


            $Nro_Pedido = $NumeroPedido;
            $Codigo_Vendedor = $this->Codigo_Vendedor;
            $Nro_Cotizacion = $this->Nro_Cotizacion;
            $Nro_Presupuesto = $this->Nro_Presupuesto;
            $Id_Lista = $this->Id_Lista;
            $Id_Condicion = $this->Id_Condicion;
            $Id_Moneda = $this->Id_Moneda;
            $Cotizacion_Moneda = $this->Cotizacion_Moneda;
            $Estado = $this->Estado;
            $Id_Reparto = $this->Id_Reparto;
            $Nro_orden_compra =  $this->Nro_orden_compra;
            $Id_Tomado_Por = $this->Id_Tomado_Por;
            $Id_Usuario = $this->Id_Usuario;
            $Fecha_Operacion = $this->Fecha_Operacion;
            $Id_Grupo_Cliente = $this->Id_Grupo_Cliente;
            $Total_Gravado = $this->Total_Gravado;
            $Total_Exento = $this->Total_Exento;
            $Total_Producto_Ex = $this->Total_Producto_Ex;
            $Porc_Iva_Ins = $this->Porc_Iva_Ins;
            $Iva_Ins = $this->Iva_Ins;
            $Porc_Iva_NoIns = $this->Porc_Iva_NoIns;
            $Iva_NoIns = $this->Iva_NoIns;
            $Porc_IngBr_Cba = $this->Porc_IngBr_Cba;
            $IngBr_Cba = $this->IngBr_Cba;
            $Porc_IngBr_Pba = $this->Porc_IngBr_Pba;
            $IngBr_Pba = $this->IngBr_Pba;
            $Total_Neto = $this->Total_Neto;
            $Descuento = $this->Descuento;
            $Id_Transporte = $this->Id_Transporte;
            $Generado_Por = $this->Generado_Por;
            $Porc_IngBr_Mis = $this->Porc_IngBr_Mis;
            $IngBr_Mis = $this->IngBr_Mis;

            $query->bindParam(':Nro_Pedido',$Nro_Pedido);
            $query->bindParam(':Fecha_Pedido',$idCliente);
            $query->bindParam(':Codigo_Vendedor', $Codigo_Vendedor);
            $query->bindParam(':Nro_Cotizacion',$Nro_Cotizacion);
            $query->bindParam(':Nro_Presupuesto',$Nro_Presupuesto);
            $query->bindParam(':Id_Lista',$Id_Lista);
            $query->bindParam(':Id_Condicion',$Id_Condicion);
            $query->bindParam(':Id_Moneda',$Id_Moneda);
            $query->bindParam(':Cotizacion_Moneda',$Cotizacion_Moneda);
            $query->bindParam(':Estado',$Estado);
            $query->bindParam(':Id_Reparto',$Id_Reparto);
            $query->bindParam(':Nro_orden_compra',$Nro_orden_compra);
            $query->bindParam(':Id_Tomado_Por',$Id_Tomado_Por);
            $query->bindParam(':Id_Usuario',$Id_Usuario);
            $query->bindParam(':Fecha_Operacion',$Fecha_Operacion);
            $query->bindParam(':Id_Grupo_Cliente',$Id_Grupo_Cliente);
            $query->bindParam(':Total_Gravado', $Total_Gravado);
            $query->bindParam(':Total_Exento', $Total_Exento);
            $query->bindParam(':Total_Producto_Exento',$Total_Producto_Ex);
            $query->bindParam(':Porc_Iva_Ins',$Porc_Iva_Ins);
            $query->bindParam(':Iva_Ins',$Iva_Ins);
            $query->bindParam(':Porc_Iva_NoIns',$Porc_Iva_NoIns);
            $query->bindParam(':Iva_NoIns',$Iva_NoIns);
            $query->bindParam(':Porc_IngBr_Cba',$Porc_IngBr_Cba);
            $query->bindParam(':IngBr_Cba',$IngBr_Cba);
            $query->bindParam(':Porc_IngBr_Pba',$Porc_IngBr_Pba);
            $query->bindParam(':IngBr_Pba',$IngBr_Pba);
            $query->bindParam(':Total_Neto',$Total_Neto);
            $query->bindParam(':Descuento',$Descuento);
            $query->bindParam(':Id_Transporte',$Id_Transporte);
            $query->bindParam(':Generado_Por',$Generado_Por);
            $query->bindParam(':Porc_IngBr_Mis',$Porc_IngBr_Mis);
            $query->bindParam(':IngBr_Mis',$IngBr_Mis);

            return $query->execute();

        }catch(PDOException $e)
        {
            $e->getMessage();
        }
    }

    private function traerUltimoNumero(){
        $conexion = Conexion::conectar();
        $sql = "SELECT Numero FROM Pedid_Numer LIMIT 1";
        $query = $conexion->prepare($sql);
        $query->execute();

        return $query->fetch()['Numero'];

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

    private function cargarDatosFormulario(){
        if(isset($_POST)){
            if(isset($_POST['Nro_Pedido']))
                $this->Nro_Pedido = $_POST['Nro_Pedido'];
            else
                $this->Nro_Pedido = 0;

            $this->Codigo_Vendedor = $_POST['Codigo_Vendedor'];
            $this->Nro_Cotizacion = $_POST['Nro_Cotizacion'];
            $this->Nro_Presupuesto = $_POST['Nro_Presupuesto'];
            $this->Id_Lista = $_POST['Id_Lista'];
            $this->Id_Condicion = $_POST['Id_Condicion'];
            $this->Id_Moneda = $_POST['Id_Moneda'];
            $this->Cotizacion_Moneda = $_POST['Cotizacion_Moneda'];
            $this->Estado = $_POST['Estado'];
            $this->Id_Reparto = $_POST['Id_Reparto'];
            $this->Nro_orden_compra = $_POST['Nro_orden_compra'];
            $this->Id_Tomado_Por = $_POST['Id_Tomado_Por'];
            $this->Id_Usuario = $_POST['Id_Usuario'];
            $this->Fecha_Operacion = $_POST['Fecha_Operacion'];
            $this->Id_Grupo_Cliente = $_POST['Id_Grupo_Cliente'];
            $this->Total_Gravado = $_POST['Total_Gravado'];
            $this->Total_Exento = $_POST['Total_Exento'];
            $this->Total_Producto_Ex = $_POST['Total_Producto_Ex'];
            $this->Porc_Iva_Ins = $_POST['Porc_Iva_Ins'];
            $this->Iva_Ins = $_POST['Iva_Ins'];
            $this->Porc_Iva_NoIns = $_POST['Porc_Iva_NoIns'];
            $this->Iva_NoIns = $_POST['Iva_NoIns'];
            $this->Porc_IngBr_Cba = $_POST['Porc_IngBr_Cba'];
            $this->IngBr_Cba = $_POST['IngBr_Cba'];
            $this->Porc_IngBr_Pba = $_POST['Porc_IngBr_Pba'];
            $this->IngBr_Pba = $_POST['IngBr_Pba'];
            $this->Total_Neto = $_POST['Total_Neto'];
            $this->Descuento = $_POST['Descuento'];
            $this->Id_Transporte = $_POST['Id_Transporte'];
            $this->Generado_Por = $_POST['Generado_Por'];
            $this->Porc_IngBr_Mis = $_POST['Porc_IngBr_Mis'];
            $this->IngBr_Mis = $_POST['IngBr_Mis'];

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

