<?php

$titulo = "Pedidos Saporiti";

include 'formPedido.php' ?>

<div class="panel">
    <div class="panel-body">
        <?php if($totalRegistros == 0){  ?>
            <div class='error'>NO HAY REGISTRO DE PEDIDOS</div>
        <?php }else{  ?>
            <?php include 'paginacion.php' ?>
            <table data-mostrar class="table table-striped">
                <thead>
                <tr>
                    <th>Nro Pedido</th>
                    <th class="centrar">Codigo Cliente</th>
                    <th class="centrar">Fecha Pedido</th>
                    <th class="centrar">Codigo Vendedor</th>
                    <th class="centrar">Estado</th>
                    <th class="centrar"></a></th>
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
                            <a href="" class="editar">Editar <img src="img/edit.png" alt="Editar"></a>
                            <a href="" class="eliminar" ">Eliminar <img src="img/drop.png" alt="Borrar"></a>
                        </td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
            <div class="paginacion">
                <p>
                    Número de resultados: <b><?php echo $totalRegistros ?></b>
                    Mostrando <b><?php echo $numxPag ?></b> resultados por página
                    Página <b><?php echo $pagina ?></b> de <b><?php echo $totalPaginas ?></b>
                </p>
                <?php include 'paginacion_detalle.php' ?>
            </div>
        <?php } ?>
    </div>
</div>