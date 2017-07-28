<?php
class Pedid_Ca{
    public $Nro_Pedido;
    public $id_Cliente;
    public $Fecha_Pedido;
    public $Codigo_Vendedor;
    public $Nro_Cotizacion;
    public $Nro_Presupuesto;
    public $Id_Lista;
    public $Id_Condicion;
    public $Id_Moneda;
    public $Cotizacion_Moneda;
    public $Estado;
    public $Id_Reparto;
    public $Nro_orden_compra;
    public $Id_Tomado_Por;
    public $Id_Usuario;
    public $Fecha_Operacion;
    public $Id_Grupo_Cliente;
    public $Total_Gravado;
    public $Total_Exento;
    public $Total_Producto_Ex;
    public $Porc_Iva_Ins;
    public $Iva_Ins;
    public $Porc_Iva_NoIns;
    public $Iva_NoIns;
    public $Porc_IngBr_Cba;
    public $IngBr_Cba;
    public $Porc_IngBr_Pba;
    public $IngBr_Pba;
    public $Total_Neto;
    public $Descuento;
    public $Id_Transporte;
    public $Generado_Por;
    public $Porc_IngBr_Mis;
    public $IngBr_Mis;

    public $CantidadPedidos;

    public function consultaTodos(){
        try{
            $conexion = Conexion::conectar()->prepare("CALL Pedid_Ca_Cons()");
            $conexion->execute();
            $this->CantidadPedidos = $conexion->rowCount();
            return $conexion->fetchAll(PDO::FETCH_ASSOC);
        }catch(PDOException $e)
        {
            return $e->getMessage();
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
            return $e->getMessage();
        }
    }
    public function consultaTodosxCodVend($codVend){
        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare("CALL Pedid_Ca_Cons_CodVend(:CodigoVendedor)");
            $query->bindParam(':CodigoVendedor', $codVend, PDO::PARAM_INT);
            $query->execute();
            $this->CantidadPedidos = $query->rowCount();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }catch(PDOException $e)
        {
            return $e->getMessage();
        }
    }
    public function consultaTodos_Fecha($codVend,$fechaDesde,$fechaHasta){
        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare("CALL Pedid_Ca_Entre_Fechas(:CodigoVendedor,:Desde,:Hasta)");
            $query->bindParam(':CodigoVendedor', $codVend, PDO::PARAM_INT);
            $query->bindParam(':Desde', $fechaDesde);
            $query->bindParam(':Hasta', $fechaHasta);
            $query->execute();
            $this->CantidadPedidos = $query->rowCount();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }catch(PDOException $e)
        {
            return $e->getMessage();
        }
    }
    public function consultaPedidoLimitado($inicio, $fin){
        $sql = "SELECT * FROM Pedid_Ca LIMIT $inicio, $fin";

        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare($sql);
            $query->execute();
            return $query->fetchALL(PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            return $e->getMessage();
        }
    }
    public function altaPedido($conexion){
        try{

            $sql = "CALL Pedid_Ca_Insert(
                                        :Nro_Pedido,
                                        :Codigo_Vendedor,
                                        :Nro_Cotizacion,
                                        :Nro_Presupuesto,
                                        :id_Cliente,
                                        :Fecha_Pedido,
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


            $query = $conexion->prepare($sql);

            $this->cargarDatosFormulario();

            /////// TRAE DE PEDID_NUMER ///////////////
            $this->Nro_Pedido = $this->traerUltimoNumero($conexion);

            $Nro_Pedido = intval($this->Nro_Pedido);
            $Fecha_Pedido = $this->Fecha_Pedido;
            $Codigo_Vendedor = intval($this->Codigo_Vendedor);
            $idCliente = intval($this->id_Cliente);


            $Nro_Cotizacion = intval($this->Nro_Cotizacion);
            $Nro_Presupuesto = intval($this->Nro_Presupuesto);
            $Id_Lista = intval($this->Id_Lista);

            $Id_Condicion = intval($this->Id_Condicion);
            $Id_Moneda = intval($this->Id_Moneda);
            $Cotizacion_Moneda = floatval($this->Cotizacion_Moneda);


            $Estado = $this->Estado;
            $Id_Reparto = intval($this->Id_Reparto);
            $Nro_orden_compra =  $this->Nro_orden_compra;
            $Id_Tomado_Por = intval($this->Id_Tomado_Por);
            $Id_Usuario = intval($this->Id_Usuario);
            $Fecha_Operacion = $this->Fecha_Operacion;
            $Id_Grupo_Cliente = intval($this->Id_Grupo_Cliente);
            $Total_Gravado = floatval($this->Total_Gravado);
            $Total_Exento = floatval($this->Total_Exento);
            $Total_Producto_Ex = floatval($this->Total_Producto_Ex);
            $Porc_Iva_Ins = floatval($this->Porc_Iva_Ins);
            $Iva_Ins = floatval($this->Iva_Ins);
            $Porc_Iva_NoIns = floatval($this->Porc_Iva_NoIns);
            $Iva_NoIns = floatval($this->Iva_NoIns);
            $Porc_IngBr_Cba = floatval($this->Porc_IngBr_Cba);
            $IngBr_Cba = floatval($this->IngBr_Cba);
            $Porc_IngBr_Pba = floatval($this->Porc_IngBr_Pba);
            $IngBr_Pba = floatval($this->IngBr_Pba);
            $Total_Neto = floatval($this->Total_Neto);
            $Descuento = floatval($this->Descuento);
            $Id_Transporte = intval($this->Id_Transporte);
            $Generado_Por = intval($this->Generado_Por);
            $Porc_IngBr_Mis = floatval($this->Porc_IngBr_Mis);
            $IngBr_Mis = floatval($this->IngBr_Mis);

            $query->bindParam(':Nro_Pedido',$Nro_Pedido,PDO::PARAM_INT);
            $query->bindParam(':id_Cliente',$idCliente,PDO::PARAM_INT);
            $query->bindParam(':Fecha_Pedido',$Fecha_Pedido,PDO::PARAM_STR);
            $query->bindParam(':Codigo_Vendedor', $Codigo_Vendedor,PDO::PARAM_INT);

            $query->bindParam(':Nro_Cotizacion',$Nro_Cotizacion,PDO::PARAM_INT);
            $query->bindParam(':Nro_Presupuesto',$Nro_Presupuesto,PDO::PARAM_INT);
            $query->bindParam(':Id_Lista',$Id_Lista,PDO::PARAM_INT);

            $query->bindParam(':Id_Condicion',$Id_Condicion,PDO::PARAM_INT);
            $query->bindParam(':Id_Moneda',$Id_Moneda,PDO::PARAM_INT);
            $query->bindParam(':Cotizacion_Moneda',$Cotizacion_Moneda,PDO::PARAM_STR);

            $query->bindParam(':Estado',$Estado,PDO::PARAM_STR);
            $query->bindParam(':Id_Reparto',$Id_Reparto,PDO::PARAM_INT);
            $query->bindParam(':Nro_orden_compra',$Nro_orden_compra,PDO::PARAM_STR);


            $query->bindParam(':Id_Tomado_Por',$Id_Tomado_Por,PDO::PARAM_INT);
            $query->bindParam(':Id_Usuario',$Id_Usuario,PDO::PARAM_INT);
            $query->bindParam(':Fecha_Operacion',$Fecha_Operacion,PDO::PARAM_STR);
            $query->bindParam(':Id_Grupo_Cliente',$Id_Grupo_Cliente,PDO::PARAM_INT);
            $query->bindParam(':Total_Gravado', $Total_Gravado,PDO::PARAM_STR);
            $query->bindParam(':Total_Exento', $Total_Exento,PDO::PARAM_STR);
            $query->bindParam(':Total_Producto_Exento',$Total_Producto_Ex,PDO::PARAM_STR);
            $query->bindParam(':Porc_Iva_Ins',$Porc_Iva_Ins,PDO::PARAM_STR);
            $query->bindParam(':Iva_Ins',$Iva_Ins,PDO::PARAM_STR);
            $query->bindParam(':Porc_Iva_NoIns',$Porc_Iva_NoIns,PDO::PARAM_STR);
            $query->bindParam(':Iva_NoIns',$Iva_NoIns,PDO::PARAM_STR);
            $query->bindParam(':Porc_IngBr_Cba',$Porc_IngBr_Cba,PDO::PARAM_STR);
            $query->bindParam(':IngBr_Cba',$IngBr_Cba,PDO::PARAM_STR);
            $query->bindParam(':Porc_IngBr_Pba',$Porc_IngBr_Pba,PDO::PARAM_STR);
            $query->bindParam(':IngBr_Pba',$IngBr_Pba,PDO::PARAM_STR);
            $query->bindParam(':Total_Neto',$Total_Neto,PDO::PARAM_STR);
            $query->bindParam(':Descuento',$Descuento,PDO::PARAM_STR);
            $query->bindParam(':Id_Transporte',$Id_Transporte,PDO::PARAM_INT);
            $query->bindParam(':Generado_Por',$Generado_Por,PDO::PARAM_INT);
            $query->bindParam(':Porc_IngBr_Mis',$Porc_IngBr_Mis,PDO::PARAM_STR);
            $query->bindParam(':IngBr_Mis',$IngBr_Mis,PDO::PARAM_STR);


            //return $query->execute();
            //return $this;

            if($query->execute())
                return $Nro_Pedido;
            else
                return false;


        }catch(PDOException $e)
        {
            return $e->getMessage();
        }
    }
    public function editarPedido($conexion){
        $sql = "CALL Pedid_Ca_Update(
                                        :Nro_Pedido,
                                        :id_Cliente,
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
        try{

            $query = $conexion->prepare($sql);

            $this->cargarDatosFormulario();

            $Nro_Pedido = $this->Nro_Pedido;
            $Codigo_Vendedor = $this->Codigo_Vendedor;
            $idCliente = $this->id_Cliente;
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

            $query->bindParam(':Nro_Pedido',$Nro_Pedido,PDO::PARAM_INT);
            $query->bindParam(':Fecha_Pedido',$idCliente,PDO::PARAM_INT);
            $query->bindParam(':Codigo_Vendedor', $Codigo_Vendedor,PDO::PARAM_INT);
            $query->bindParam(':Nro_Cotizacion',$Nro_Cotizacion,PDO::PARAM_INT);
            $query->bindParam(':Nro_Presupuesto',$Nro_Presupuesto,PDO::PARAM_INT);
            $query->bindParam(':Id_Lista',$Id_Lista,PDO::PARAM_INT);
            $query->bindParam(':Id_Condicion',$Id_Condicion,PDO::PARAM_INT);
            $query->bindParam(':Id_Moneda',$Id_Moneda,PDO::PARAM_INT);
            $query->bindParam(':Cotizacion_Moneda',$Cotizacion_Moneda,PDO::PARAM_STR);
            $query->bindParam(':Estado',$Estado,PDO::PARAM_STR);
            $query->bindParam(':Id_Reparto',$Id_Reparto,PDO::PARAM_INT);
            $query->bindParam(':Nro_orden_compra',$Nro_orden_compra,PDO::PARAM_INT);
            $query->bindParam(':Id_Tomado_Por',$Id_Tomado_Por,PDO::PARAM_INT);
            $query->bindParam(':Id_Usuario',$Id_Usuario,PDO::PARAM_INT);
            $query->bindParam(':Fecha_Operacion',$Fecha_Operacion,PDO::PARAM_STR);
            $query->bindParam(':Id_Grupo_Cliente',$Id_Grupo_Cliente,PDO::PARAM_INT);
            $query->bindParam(':Total_Gravado', $Total_Gravado,PDO::PARAM_STR);
            $query->bindParam(':Total_Exento', $Total_Exento,PDO::PARAM_STR);
            $query->bindParam(':Total_Producto_Exento',$Total_Producto_Ex,PDO::PARAM_STR);
            $query->bindParam(':Porc_Iva_Ins',$Porc_Iva_Ins,PDO::PARAM_STR);
            $query->bindParam(':Iva_Ins',$Iva_Ins,PDO::PARAM_STR);
            $query->bindParam(':Porc_Iva_NoIns',$Porc_Iva_NoIns,PDO::PARAM_STR);
            $query->bindParam(':Iva_NoIns',$Iva_NoIns,PDO::PARAM_STR);
            $query->bindParam(':Porc_IngBr_Cba',$Porc_IngBr_Cba,PDO::PARAM_STR);
            $query->bindParam(':IngBr_Cba',$IngBr_Cba,PDO::PARAM_STR);
            $query->bindParam(':Porc_IngBr_Pba',$Porc_IngBr_Pba,PDO::PARAM_STR);
            $query->bindParam(':IngBr_Pba',$IngBr_Pba,PDO::PARAM_STR);
            $query->bindParam(':Total_Neto',$Total_Neto,PDO::PARAM_STR);
            $query->bindParam(':Descuento',$Descuento,PDO::PARAM_STR);
            $query->bindParam(':Id_Transporte',$Id_Transporte,PDO::PARAM_INT);
            $query->bindParam(':Generado_Por',$Generado_Por,PDO::PARAM_INT);
            $query->bindParam(':Porc_IngBr_Mis',$Porc_IngBr_Mis,PDO::PARAM_STR);
            $query->bindParam(':IngBr_Mis',$IngBr_Mis,PDO::PARAM_STR);

            return $query->execute();

        }catch(PDOException $e)
        {
            return $e->getMessage();
        }
    }
    private function traerUltimoNumero($conexion){
        //$conexion = Conexion::conectar();
        $sql = "SELECT Numero FROM Pedid_Numer LIMIT 1";
        $query = $conexion->prepare($sql);
        $query->execute();

        return $query->fetch()['Numero'];

    }
    public function actualizar_Numeracion($conexion)
    {
        $sql = "UPDATE Pedid_Numer SET Numero = Numero + 1";
        $query = $conexion->prepare($sql);
        return $query->execute();
    }
    private function cargarDatosFormulario(){
        if(isset($_POST)){

            $pedido =$_POST['pedido'];
            if(isset($pedido['Nro_Pedido']) && $pedido['Nro_Pedido'] > 0)
                $this->Nro_Pedido = $pedido['Nro_Pedido'];
            else
                $this->Nro_Pedido = 0;

            $cliente = $pedido['Cliente'];

            $this->id_Cliente = $cliente['id'];
            $this->Codigo_Vendedor = $pedido['Codigo_Vendedor'];
            $this->Nro_Cotizacion = $pedido['Nro_Cotizacion'];
            $this->Nro_Presupuesto = $pedido['Nro_Presupuesto'];
            $this->Id_Lista = $pedido['Id_Lista'];
            $this->Id_Condicion = $pedido['Id_Condicion'];
            $this->Id_Moneda = $pedido['id_Moneda'];
            $this->Cotizacion_Moneda = $pedido['Cotizacion_Moneda'];
            $this->Estado = $pedido['Estado'];
            $this->Id_Reparto = $pedido['Id_Reparto'];
            $this->Nro_orden_compra = $pedido['Nro_Orden_Compra'];
            $this->Id_Tomado_Por = $pedido['Id_Tomado_Por'];
            $this->Id_Usuario = $pedido['id_Usuario'];
            $this->Fecha_Operacion = $pedido['Fecha_Operacion'];
            $this->Fecha_Pedido = $pedido['Fecha_Pedido'];
            $this->Id_Grupo_Cliente = $pedido['Id_Grupo_Cliente'];
            $this->Total_Gravado = $pedido['Total_Gravado'];
            $this->Total_Exento = $pedido['Total_Exento'];
            $this->Total_Producto_Ex = $pedido['Total_Producto_Ex'];
            $this->Porc_Iva_Ins = $pedido['Porc_Iva_Ins'];
            $this->Iva_Ins = $pedido['Iva_Ins'];
            $this->Porc_Iva_NoIns = $pedido['Porc_Iva_NoIns'];
            $this->Iva_NoIns = $pedido['Iva_NoIns'];
            $this->Porc_IngBr_Cba = $pedido['Porc_IngBr_Cba'];
            $this->IngBr_Cba = $pedido['IngBr_Cba'];
            $this->Porc_IngBr_Pba = $pedido['Porc_IngBr_Pba'];
            $this->IngBr_Pba = $pedido['IngBr_Pba'];
            $this->Total_Neto = $pedido['Total_Neto'];
            $this->Descuento = $pedido['Descuento'];
            $this->Id_Transporte = $pedido['Id_Transporte'];
            $this->Generado_Por = $pedido['Generado_Por'];
            $this->Porc_IngBr_Mis = $pedido['Porc_IngBr_Mis'];
            $this->IngBr_Mis = $pedido['IngBr_Mis'];
        }
    }
}

