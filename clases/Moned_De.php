<?php

class Moned_De
{
    public function Moned_De_Igual_Moned_Ca_Ultimo($idMoneda){
        $sql = "SELECT * FROM Moned_De WHERE id_Moned_Ca = :Id_Moned_Ca order by Moned_De.Fecha_Cotizacion desc limit 1";
        $conexion = Conexion::conectar();
        $query = $conexion->prepare($sql);

        $query->bindParam(':Id_Moned_Ca',$idMoneda,PDO::PARAM_INT);

        $query->execute();
        return $query->fetch(PDO::FETCH_ASSOC);
    }
}