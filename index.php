<?php    
    require_once('controlador.php');
    $titulo = "Pedidos Saporiti";
    $vista =  "vistaPedidos.php";
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Pedidos Web</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
        <link rel="stylesheet" href="css/agregado.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css"/>
    </head>
    <body  ng-app="appSapo">
    <div class="container">
        <div class="row">
            <div class="col align-self-start cabecera">
                <header id="cabecera">
                    <div><img src="img/logo_saporiti.jpg" alt="Drogueria Saporiti" /></div>
                </header>
                <nav>
                    <?php include 'vistas/menu.php' ?>
                </nav>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12 contenido">
                <section id="contenido">
                    <div id="precarga"></div>
                    <?php include 'vistas/'.$vista ?>
                </section>
            </div>
        </div>
    </div>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>    
    <script src="js/angular.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/dirPagination.js"></script>
    <script type="text/javascript" src="js/app.js"></script>

<!--    <script src="./js/pedidos_web.js"></script>-->    
    </body>
</html>
