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

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
        <link rel="stylesheet" href="css/agregado.css">

    </head>
    <body>
    <div class="container">
        <div class="row">
            <div class="col align-self-start cabecera">
                <header id="cabecera">
                    <div><img src="img/logo_saporiti.jpg" alt="Drogueria Saporiti" /></div>
                </header>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12 contenido">
                <section id="contenido">
                    <h1><?php echo $titulo ?></h1>

                    <div id="precarga"></div>
                    <?php include 'vistas/'.$vista ?>
                </section>
            </div>
        </div>
    </div>

        <script src="./js/pedidos_web.js"></script>
    </body>
</html>
