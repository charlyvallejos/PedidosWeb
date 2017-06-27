<?php

if(isset($_GET['vista']))
    $vista = $_GET['vista'];
else
    $vista = 'vistaPedidos';

    function actual($seccion){
        if(!isset($_GET['vista']))
            $vista = 'vistaPedidos';
        else
            $vista = $_GET['vista'];

        if($seccion == $vista)
            echo 'class="active"';
    }

?>
<script>
    var CodVendedor = "<?php echo $_SESSION['Codigo_Vendedor']?>";
</script>
<div class="nav-color">
    <div class="nav-wrap">
        <?php if(isset($_SESSION)){ ?>
        <div id="lang-selector" ng-controller="loginController">
            <a href=""  ng-click="logout()" class="active"><?php if(isset($_SESSION['Nombre_Vendedor'])) echo 'Cerrar Sesión'?></a>
             | 
            <a href=""><?php if(isset($_SESSION['Nombre_Vendedor'])) echo $_SESSION['Nombre_Vendedor'] ?></a>
        </div>
        <?php } ?>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li <?php actual('vistaPedidos'); ?>><a href="?vista=vistaPedidos"><span class="dot hidden-xs"></span><span class="text">Pedidos</span></a></li>
                        <li <?php actual('vistaClientes'); ?>><a href="?vista=vistaClientes"><span class="dot hidden-xs"></span><span class="text">Clientes</span></a></li>
                        <li class="logo"><img src="img/logo_sapo.png"></li>
                        <li <?php actual('vistaProductos'); ?>><a href="?vista=vistaProductos"><span class="dot hidden-xs"></span><span class="text">Productos</span></a></li>
                        <li <?php actual('vistaListados'); ?>><a href="?vista=vistaListados"><span class="dot hidden-xs"></span><span class="text">Listados</span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>