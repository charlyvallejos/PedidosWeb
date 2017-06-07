<div ng-controller="pedidosController">
<?php

$titulo = "Pedidos Saporiti";

include 'formPedido.php' ?>

<div class="panel">
    <div class="panel-body">
        <?php // if($totalRegistros == 0){  ?>
           <!--<div class='error'>NO HAY REGISTRO DE PEDIDOS</div>-->
        <?php // }else{  ?>
            <?php // include 'paginacion.php' ?>
            <input type="search" ng-model="buscar" class="form-control" placeholder="Buscar">
            <table data-mostrar class="table table-striped" ng-init="consultaPedidos()">
                <thead>
                <tr>
                    <th ng-click="sort('Nro_Pedido')">Nro Pedido</th>
                    <th ng-click="sort('Codigo_Cliente')" class="centrar">Codigo Cliente</th>
                    <th ng-click="sort('Fecha_Pedido')" class="centrar">Fecha Pedido</th>
                    <th class="centrar">Codigo Vendedor</th>
                    <th class="centrar">Estado</th>
                    <th class="centrar"></a></th>
                </tr>
                </thead>
                <tbody>
                <?php // foreach($pedidos as $pedido){ ?>
                    <tr dir-paginate="ped in pedidos | filter:buscar|orderBy:sortKey:reverse | itemsPerPage:2">
                        <td><?php // echo $pedido['Nro_Pedido'] ?>{{ped.Nro_Pedido}}</td>
                        <td class="centrar"><?php //echo $pedido['id_Cliente'] ?>{{ped.id_Cliente}}</td>
                        <td class="centrar"><?php //echo $pedido['Fecha_Pedido'] ?>{{ped.Fecha_Pedido}}</td>
                        <td class="centrar"><?php //echo $pedido['Codigo_Vendedor'] ?>{{ped.Codigo_Vendedor}}</td>
                        <td class="centrar"><?php //echo $pedido['Estado'] ?>{{ped.Estado}}</td>
                        <td class="centrar">
                            <a href="" class="editar">Editar <img src="img/edit.png" alt="Editar" ng-click="consultaPedidoNro(ped)"></a>
                            <a href="" class="eliminar" ">Eliminar <img src="img/drop.png" alt="Borrar"></a>
                        </td>
                    </tr>
                <?php // } ?>
                </tbody>
            </table>

            <dir-pagination-controls
                    [max-size="5"]
                    [direction-links="true"]
                    [boundary-links="true"]
                    [on-page-change=""]
                    [pagination-id=""]
                    [template-url=""]
                    [auto-hide=""]>
            </dir-pagination-controls>

            <!--
            <div class="paginacion">
                <p>
                    Número de resultados: <b><?php // echo $totalRegistros ?></b>
                    Mostrando <b><?php// echo $numxPag ?></b> resultados por página
                    Página <b><?php //echo $pagina ?></b> de <b><?php //echo $totalPaginas ?></b>
                </p>
                <?php // include 'paginacion_detalle.php' ?>
            </div>
            -->
        <?php // } ?>
    </div>
</div>


</div>