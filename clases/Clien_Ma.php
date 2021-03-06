<?php

class Clien_Ma
{
    protected $Id;
    protected $Codigo_Cliente;
    protected $Razon_Social;
    protected $Nombre_Fantasia;
    protected $Domicilio;
    protected $Codigo_Postal;
    protected $Localidad;
    protected $Provincia;
    protected $Domicilio_Entrega;
    protected $Codigo_Postal_Entrega;
    protected $Localidad_Entrega;
    protected $Provincia_Entrega;
    protected $Domicilio_Cobro;
    protected $Codigo_Postal_Cobro;
    protected $Localidad_Cobro;
    protected $Provincia_Cobro;
    protected $Id_Reparto;
    protected $Id_Zona;
    protected $Telefonos;
    protected $Fax;
    protected $Tipo_Iva;
    protected $Nro_Cuit;
    protected $Nro_Ing_Brutos;
    protected $Id_Categoria_Ing_Br;
    protected $Comision;
    protected $Id_Lista_Precio;
    protected $Estado;
    protected $Id_Condicion_Vta;
    protected $Id_Agrupacion;
    protected $Codigo_Vendedor;
    protected $Contacto;
    protected $Nivel_Habil;
    protected $Id_Reparto_Entrega;
    protected $Id_Reparto_Cobro;
    protected $Dcto;
    protected $Credito;
    protected $Protocolo;
    protected $Nro_Sedronar;
    protected $Fecha_Vto_Sedro;
    protected $Fecha_Alta;
    protected $Remito;
    protected $Dcto_Pago_Ef;
    protected $Email;
    protected $EmailProtocolos;
    protected $Id_Usuario;
    protected $Fecha_Operacion;
    protected $Id_Grupo_Cliente;
    protected $Id_Transporte;
    protected $Convenio;
    protected $St;
    protected $StDesc;
    protected $Afip;
    protected $Grupo_Cotiza;
    protected $Estado_Deudor;
    protected $Fecha_Estado_Deudor;
    protected $Fecha_Facturar_Hasta;
    protected $Imprime_Nc_Dcto;
    protected $Id_Trans_Clien;
    protected $Motivo;
    protected $Id_Pais;
    protected $Fecha_Vto_Psico;
    protected $Prefijo_Telefono_1;
    protected $Telefono_1;
    protected $Prefijo_Telefono_2;
    protected $Telefono_2;
    protected $Prefijo_Telefono_3;
    protected $Telefono_3;
    protected $Prefijo_Fax_1;
    protected $Fax_1;
    protected $Prefijo_Fax_2;
    protected $Fax_2;
    protected $Prefijo_Celular;
    protected $Celular;
    protected $Director_Tecnico;
    protected $Pasar_Importe;
    protected $Grupo_Sedro;
    protected $Genera_Factura_PDF;
    protected $Email_Factura_PDF;

    public function consulta_todos(){
        $sql = "CALL Clien_Ma_Cons()";
        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }catch(PDOException $ex)
        {
            return $ex->getMessage();
        }
    }

    public function consultaDescripcion($descripcion){
        $sql = "CALL Clien_Ma_Igual_Descri(:descripcion)";
        //$sql = "SELECT * FROM Clien_Ma WHERE Razon_Social like '%$descripcion%'";
        try {
            $conexion = Conexion::conectar();
            $query = $conexion->prepare($sql);
            $query->bindParam(':descripcion',$descripcion,PDO::PARAM_STR);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    public function consultaCliente_Id($id){
        $sql = "CALL Clien_Ma_Igual_Id(:id)";
        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare($sql);
            $query->bindParam(':id',$id,PDO::PARAM_INT);
            $query->execute();
            return $query->fetch(PDO::FETCH_ASSOC);
        }catch(PDOException $ex){
            return $ex->getMessage();
        }
    }
    public function consultaObs($cod){
        $sql = "CALL Clien_Obs_Igual_CodCli(:Cod)";
        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare($sql);
            $query->bindParam(':Cod',$cod,PDO::PARAM_INT);
            $query->execute();
            return $query->fetch(PDO::FETCH_ASSOC);
        }catch(PDOException $ex){
            return $ex->getMessage();
        }
    }
    public function consultaCodigoCliente($codigoCliente){
        //$sql = "SELECT * FROM clien_ma WHERE Codigo_Cliente = '$codigoCliente'";
        $sql = "CALL Clien_Ma_Igual_Codigo(:codigo)";
        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare($sql);
            $query->bindParam(':codigo',$codigoCliente,PDO::PARAM_STR,7);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);            
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }
}