<?php
require_once('Conexion.php');
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

    protected $CantidadPedidos;

/*
    protected $conn;
    
    public function __construct() {
        $this->conn = new conexion();
    }
*/
    public function consultaTodos(){
        $sql = "SELECT * FROM pedid_Ca";
        try{
            $query = Conexion::conectar()->prepare($sql);
            $query->execute();
            $this->CantidadPedidos = $query->rowCount();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }catch(PDOException $e)
        {
            return $e->getMessage();
        }
    }
    public function getCantidadPedidos(){
        return $this->CantidadPedidos;
    }
    
            
}

