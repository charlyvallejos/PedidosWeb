<?php    
    require_once('controlador.php');
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Pedidos Web</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
    </head>
    <body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-12 cabecera">
                <header id="cabecera">
                    <div><img src="img/logo_saporiti.jpg" alt="Saporiti" /></div>
                    <!-- <a href="#" id="insertar">Agregar</a>-->
                </header>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-12 contenido">
                <section id="contenido">
                    <div><h1>Pedidos Saporiti</h1></div>
                    <!--<div id="respuesta"></div>-->
                    <div id="precarga"></div>
                    <div class="panel">
                        <div class="panel-body">
                            <?php if($totalRegistros == 0){  ?>
                                <div class='error'>NO HAY REGISTRO DE PEDIDOS</div>
                            <?php }else{  ?>
                                <table data-mostrar class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Nro Pedido</th>
                                        <th class="centrar">Codigo Cliente</th>
                                        <th class="centrar">Fecha Pedido</th>
                                        <th class="centrar">Codigo Vendedor</th>
                                        <th class="centrar">Estado</th>
                                        <th class="centrar"><a href="">Agregar <img src="img/add.png"></a></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach($pedidos as $pedido){ ?>
                                    <tr>
                                        <td><?php echo $pedido['Nro_Pedido'] ?></td>
                                        <td class="centrar"><?php echo $pedido['id_Cliente'] ?></td>
                                        <td class="centrar"><?php echo $pedido['Fecha_Pedido'] ?></td>
                                        <td class="centrar"><?php echo $pedido['Codigo_Vendedor'] ?></td>
                                        <td class="centrar"><?php echo $pedido['Estado'] ?></td>
                                        <td class="centrar">
                                            <a href="#" class="editar" data-id="<?php echo $pedido['Nro_Pedido'] ?>">Editar <img src="img/edit.png" alt="Editar"></a>
                                            <a href="#" class="eliminar" data-id="<?php echo $pedido['Nro_Pedido']  ?>">Eliminar <img src="img/drop.png" alt="Borrar"></a>
                                        </td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                                <?php
                                    //PAGINACION
                                    $numxPag = 2;
                                    $pagina = false;

                                    if(isset($_GET['pag']))
                                    {
                                        $pagina = $_GET['pag'];
                                    }

                                    if(!$pagina)
                                    {
                                        $pagina = 1;
                                        $inicio = 0;
                                    }
                                    else
                                    {
                                        $inicio = ($pagina - 1) * $numxPag;
                                    }

                                    $totalPaginas = ceil($totalRegistros / $numxPag);
                                ?>
                                <div class="paginacion">
                                    <p>
                                        Número de resultados: <b><?php echo $totalRegistros ?></b>
                                        Mostrando <b><?php echo $numxPag ?></b> resultados por página
                                        Página <b><?php echo $pagina ?></b> de <b><?php echo $totalPaginas ?></b>
                                    </p>
                                    <?php

                                    if ($totalPaginas > 1)
                                    { ?>
                                        <p>
                                        <?php if($pagina != 1){  ?>
                                            <a href='?pag="<?php echo ($pagina-1) . "&laquo" ?>"'></a>
                                        <?php }
                                            for($i=1; $i <= $totalPaginas;$i++)
                                            {
                                                if($i == $pagina){ ?>
                                                    <span class='actual'><?php echo $pagina ?></span>
                                                <?php }else{  ?>
                                                    <a href='?pag=<?php echo $i ?>'><?php echo $i ?></a><?php }
                                            }

                                            if($pagina != $totalPaginas){ ?>
                                            <a href='?pag=<?php echo ($pagina+1) ?>'>&raquo</a> <?php
                                            } ?>
                                        </p>
                                    <?php } ?>
                                 </div>
                        <?php } ?>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

        <script src="./js/pedidos_web.js"></script>
    </body>
</html>
