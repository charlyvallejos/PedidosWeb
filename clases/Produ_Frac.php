<?php
class Produ_Frac{
    //Atributos...
    
    
    //Metodos
    public function consultaProdFraccio($Id_Producto, $Id_Fraccio){
        $sql = "CALL Produ_Frac_Cons_Prod_Fracc(:Id_Producto,:Id_Fraccio)";
        try
        {
            $conexion = Conexion::conectar();
            $query = $conexion->prepare($sql);
            $query->bindParam(':Id_Producto', $Id_Producto, PDO::PARAM_INT);
            $query->bindParam(':Id_Fraccio', $Id_Fraccio, PDO::PARAM_INT);
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

