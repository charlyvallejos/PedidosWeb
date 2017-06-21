<?php

/**
 * Created by PhpStorm.
 * User: noeliar
 * Date: 21/06/2017
 * Time: 16:26
 */
class Lista_De
{
    private $Id;
    private $Id_Lista_Ca;
    private $Codigo_Lista;
    private $Id_Producto;
    private $Id_Fraccio;
    private $Porcentaje;
    private $Id_Usuario;
    private $Fecha_Operacion;
    private $Precio;

    public function consultaListaPrecio($id_prod,$id_frac,$id_lista)
    {
        $sql = "CALL Lista_De_Igual_Producto(:idProd,:idFrac,:idLista)";
        try{
            $conexion = Conexion::conectar();
            $query = $conexion->prepare($sql);
            $query->bindParam(':idLista',$id_lista,PDO::PARAM_INT);
            $query->bindParam(':idProd',$id_prod,PDO::PARAM_INT);
            $query->bindParam(':idFrac',$id_frac,PDO::PARAM_INT);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }
}