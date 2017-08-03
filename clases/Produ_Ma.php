<?php
class Produ_Ma{
    //Atributos...
    
    //Metodos
    public function consultaProducto($id){
        $sql = "CALL Produ_Ma_Cons_Id(:id)";
        try
        {
            $conexion = Conexion::conectar();
            $query = $conexion->prepare($sql);
            $query->bindParam(':id', $id, PDO::PARAM_INT);
            $query->execute();
            return $query->fetch(PDO::FETCH_ASSOC);
        } 
        catch (PDOException $ex)
        {
            return $ex->getMessage();
        }
    }
    
    public function consultaDescripcion($des){
        $sql = "CALL Produ_Ma_Cons_Descri(:descripcion)";
        try
        {
            $conectar = Conexion::conectar();
            $query = $conectar->prepare($sql);
            $query->bindParam(':descripcion', $des, PDO::PARAM_STR);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $ex) {
            
            return $ex->getMessage();
        }        
    }
    
    public function consultaCodigoProducto($codigoProducto, $codigoFraccio)
    {
        $sql = "CALL Produ_Ma_Cons_Codigo(:CodigoProducto,:CodigoFraccio)";
        try
        {
            $conectar = Conexion::conectar();
            $query = $conectar->prepare($sql);
            $query->bindParam(':CodigoProducto', $codigoProducto, PDO::PARAM_STR,9);
            $query->bindParam(':CodigoFraccio', $codigoFraccio, PDO::PARAM_STR,3);
            $query->execute();
            return $query->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }
    
    public function consultaCodigoProductoTodos($CodigoProducto)
    {
        $sql = "CALL Produ_Ma_Cons_CodigoProductoTodos(:CodigoProducto)";
        try        
        {
            $conectar = Conexion::conectar();
            $query = $conectar->prepare($sql);
            $query->bindParam(':CodigoProducto', $CodigoProducto, PDO::PARAM_STR,9);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);            
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    public function consultaTodos()
    {
        $sql = "CALL Produ_Ma_Cons()";
        try
        {
            $conectar = Conexion::conectar();
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }
    
    
}



?>

