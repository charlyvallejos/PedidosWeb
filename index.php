<?php    
    require_once('controlador.php');
    ini_set('display_errors', 0);
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Pedidos Web</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    </head>
    <body>
        <header id="cabecera">
            <h2>Pedidos</h2>
            <div><img src="img/logo.jpg" alt="Super Héroes" /></div>
            <a href="#" id="insertar">Agregar</a>
        </header>
        <section id="contenido">
            <div><h1>Pedidos Saporiti</h1></div>
            <div id="respuesta"></div>
            <div id="precarga"></div>
<!--            <div id="mostrar"></div>-->
            <?php
//                $enrutador = new enrutador();
//                if($enrutador->validarGET($_GET['cargar']))
//                    $enrutador->cargarVista($_GET['cargar']);
                mostrarPedidos();
            ?>
        </section>
        <script src="./js/pedidos_web.js"></script>
    </body>
</html>
