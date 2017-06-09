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
            $ex->getMessage();
        }
    }
    
    
}



?>

