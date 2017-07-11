<?php

class Falta_Ma
{
    public function Igual($idProd,$idFrac){
        $sql = "SELECT * FROM falta_ma WHERE Id_Producto = :Id_Producto AND Id_Fraccio = :Id_Fraccio";
        $conexion = Conexion::conectar();
        $query = $conexion->prepare($sql);

        $query->bindParam(':Id_Producto',$idProd,PDO::PARAM_INT);
        $query->bindParam(':Id_Fraccio',$idFrac,PDO::PARAM_INT);

        $query->execute();
        if($query->rowCount() > 0)
            return array('falta' => true);
        else
            return array('falta' => false);

    }
}