<?php
    require 'config/config.php';
    $usuario = new Usuario();
    if($usuario->autenticar())
    {
?>
<html ng-app="appSapo">
    <head>
        <meta charset="UTF-8">
        <title>Pedidos Web</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
        <link rel="stylesheet" href="css/agregado.css">
        <link rel="stylesheet" href="css/input_radio.css">

    </head>
    <body>
    <?php include 'vistas/menu.php' ?>
    <div class="container">
        <div class="row main">
            <div class="col-md-12 col-sm-12 col-xs-12 contenido">
                <section id="contenido">
                    <div id="precarga"></div>
                    <?php include 'vistas/'.$vista.'.php' ?>
                </section>
            </div>
        </div>
    </div>


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/angular.min.js"></script>
    <script src="js/dirPagination.js"></script>
    <script type="text/javascript" src="js/app.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <script type="text/javascript" src="js/appCliente.js"></script>
    </body>
</html>
<?php  } else { include 'vistas/formLogin.php'; } ?>
