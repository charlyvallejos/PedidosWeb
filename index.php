<?php
    require 'config/config.php';
    $usuario = new Usuario();
    if($usuario->autenticar())
    {
        $vista =  "vistaPedidos.php";
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
        <script>
            var CodVendedor = "<?php echo $_SESSION['Codigo_Vendedor'] ?>";
        </script>

    </head>
    <body>
            <nav id="barra_top">
                <ul ng-controller="loginController">
                    <li><a href=""><span class="glyphicon glyphicon-user " aria-hidden="true"></span> <?php if(isset($_SESSION['Nombre_Vendedor'])) echo $_SESSION['Nombre_Vendedor'] ?></a></li>
                    <li><a href="" ng-click="logout()"><span class="glyphicon glyphicon-log-out " aria-hidden="true"></span> <?php if(isset($_SESSION['Nombre_Vendedor'])) echo 'Cerrar Sesión'?></a></li>
                </ul>
            </nav>

        <div class="container">
        <div class="row">
            <div class="col align-self-start cabecera">
                <header id="cabecera">
                    <div><img src="img/logo_saporiti.jpg" alt="Drogueria Saporiti" /></div>
                </header>
                <nav id="menu">
                    <?php include 'vistas/menu.php' ?>
                </nav>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12 contenido" ng-app="appSapo">
                <section id="contenido">
                    <div id="precarga"></div>
                    <?php include 'vistas/'.$vista ?>
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
    </body>
</html>
<?php  } else { include 'vistas/formLogin.php'; } ?>
