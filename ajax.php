<?php
require_once 'clases/config.php';
require_once 'clases/conexion.php';
require_once 'clases/clien_ma.php';
$term = $_GET['term'];

$clien_ma2 = new Clien_Ma();

if(isset($term))
{

    $sql = $clien_ma2->consultaDescripcion($term);
    foreach($sql as $dato){ //$dato = mysqli_fetch_array($sql)){
    $resultado[] = $dato['Razon_Social'];
    }
    echo json_encode([$resultado]);
}



?>