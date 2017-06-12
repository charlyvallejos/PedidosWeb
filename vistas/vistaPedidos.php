<div ng-controller="pedidosController">
<?php

$titulo = "Pedidos Saporiti";

include 'formPedido.php' ?>


    <!-------------------------------------------------------------------------------------------------------------------->

    <div class="panel panel_pedido" ng-init="consultaPedidos()">
    <div class="panel-body">
           <!--<div ng-show="pedidos.length == 0" class='error'>NO HAY REGISTRO DE PEDIDOS</div>-->
            <div class="row">
                <div class=" col-md-9 col-xs-9">
                    <input type="search" ng-model="buscar" class="form-control" placeholder="Buscar">
                </div>
                <div class="col-md-3 col-xs-3">
                    <label for="itemsPerPageForm">Pedidos por pagina</label>
                    <select name="itemsPerPageForm" id="itemsPerPageForm" ng-model="numXpag">
                        <option value="5">5</option>
                        <option value="15">15</option>
                        <option value="30">30</option>
                        <option value="50">50</option>
                    </select>
                </div>
            </div>
            <table data-mostrar class="table table-striped">
                <thead>
                <tr>
                    <th ng-click="sort('Nro_Pedido')">Nro Pedido</th>
                    <th ng-click="sort('Codigo_Cliente')" class="centrar">Codigo Cliente</th>
                    <th ng-click="sort('Fecha_Pedido')" class="centrar">Fecha Pedido</th>
                    <th class="centrar">Codigo Vendedor</th>
                    <th class="centrar">Estado</th>
                </tr>
                </thead>
                <tbody>
                    <tr dir-paginate="ped in pedidos | filter:buscar|orderBy:sortKey:reverse | itemsPerPage: numXpag" pagination-id="pedid" ng-click="selectPedido(ped)">
                        <td>{{ped.Nro_Pedido}}</td>
                        <td class="centrar">{{ped.Codigo_Cliente}}</td>
                        <td class="centrar">{{ped.Fecha_Pedido}}</td>
                        <td class="centrar">{{ped.Codigo_Vendedor}}</td>
                        <td class="centrar">{{ped.Estado}}</td>
                        <!--<td class="centrar">
                            <a href="" class="hola">Editar <img src="img/edit.png" alt="Editar"></a>
                            <a href="" class="eliminar">Eliminar <img src="img/drop.png" alt="Borrar"></a>
                        </td>-->
                    </tr>
                </tbody>
            </table>

            <dir-pagination-controls pagination-id="pedid" boundary-links="true"> </dir-pagination-controls>
    </div>
</div>


</div>