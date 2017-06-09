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
    
    
}



?>

