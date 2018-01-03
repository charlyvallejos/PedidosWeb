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
        <!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
        <link rel="stylesheet" href="css/input_radio.css">
        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
        <link rel="stylesheet" href="css/agregado.css">
        <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
        <style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;}.bootstrap-iso .form-control:focus { border-color: #a11515;  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(161, 21, 21, 0.6); box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(161, 21, 21, 0.6);} .asteriskField{color: red;}</style>

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
    <script type="text/javascript" src="js/appProducto.js"></script>
    <script src="https://code.angularjs.org/1.3.0-rc.2/angular-messages.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>


    <script>
        $(document).ready(function(){

            var date_inputDesde=$('input[name="dateDesde"]');
            var date_inputHasta=$('input[name="dateHasta"]');
            var container=$('.bootstrap-iso').length>0 ? $('.bootstrap-iso').parent() : "body";
            date_inputDesde.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
                dates:'es'
            });
            date_inputHasta.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true
            })
        })
    </script>
    </body>
</html>
<?php  } else { include 'vistas/formLogin.php'; } ?>
