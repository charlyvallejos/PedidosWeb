<div ng-controller="pedidosController">
<?php

$titulo = "Pedidos Saporiti";

include 'formPedido.php' ?>

<div class="panel">
    <div class="panel-body">
        <?php // if($totalRegistros == 0){  ?>
           <!-- <div class='error'>NO HAY REGISTRO DE PEDIDOS</div>-->
        <?php // }else{  ?>
            <?php // include 'paginacion.php' ?>
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
                <?php // foreach($pedidos as $pedido){ ?>
                    <tr dir-paginate="ped in pedidos | itemsPerPage: itemsPerPage" total-items="CantidadPedidos">
                        <td><?php // echo $pedido['Nro_Pedido'] ?>{{ped.Nro_Pedido}}</td>
                        <td class="centrar"><?php// echo $pedido['id_Cliente'] ?>{{ped.id_Cliente}}</td>
                        <td class="centrar"><?php// echo $pedido['Fecha_Pedido'] ?>{{ped.Fecha_Pedido}}</td>
                        <td class="centrar"><?php// echo $pedido['Codigo_Vendedor'] ?>{{ped.Codigo_Vendedor}}</td>
                        <td class="centrar"><?php// echo $pedido['Estado'] ?>{{ped.Estado}}</td>
                        <td class="centrar">
                            <a href="" class="editar">Editar <img src="img/edit.png" alt="Editar" ng-click="consultaPedidoNro(ped)"></a>
                            <a href="" class="eliminar" ">Eliminar <img src="img/drop.png" alt="Borrar"></a>
                        </td>
                    </tr>
                <?php // } ?>
                </tbody>
            </table>
            <div class="paginacion">
                Numero de resultados: <strong>{{CantidadPedidos}}</strong>
                Mostrando <strong>{{itemsPerPage}} resultados por página</strong>
                Página <strong>{{pagActual}}</strong> de <strong>{{CantidadPedidos / numXpag | ceil}}</strong>
                <br><br>

                <dir-pagination-controls on-page-change="consultaPedidoLimitado(newPageNumber)"></dir-pagination-controls>
            </div>


            <!--
            <div class="paginacion">
                <p>
                    Número de resultados: <b><?php // echo $totalRegistros ?></b>
                    Mostrando <b><?php //echo $numxPag ?></b> resultados por página
                    Página <b><?php //echo $pagina ?></b> de <b><?php //echo $totalPaginas ?></b>
                </p>
                <?php // include 'paginacion_detalle.php' ?>
            </div>-->
        <?php // } ?>
    </div>
</div>
</div>