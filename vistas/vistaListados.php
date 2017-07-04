<div ng-controller="pedidosController" Id="vistaPedidos">
    <?php
    include 'formClienteConsulta.php';
    ?>
    <!-------------------------------------------------------------------------------------------------------------------->
    <div class="panel panel_pedido" ng-init="consultaPedidos_Todos(<?php echo $_SESSION['Codigo_Vendedor']; ?>)">
        <div class="panel-body">
            <div class="row">
                <div class=" col-md-3 col-xs-3">
                    <input type="search" ng-model="buscar" class="form-control" placeholder="Buscar">
                </div>
                <div class="bootstrap-iso">
                    <div class="col-md-1 col-xs-1">
                        <label class="control-label col-sm-2" for="dateDesde">
                            Desde
                        </label>
                    </div>
                    <div class=" col-md-2 col-xs-2">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar">
                                </i>
                            </div>
                            <input class="form-control" id="dateDesde" name="dateDesde" placeholder="MM/DD/YYYY" type="text" ng-model="fechaDesde" ng-change="listadoPedidos()"/>
                        </div>

                    </div>
                    <div class="col-md-1 col-xs-1">
                        <label class="control-label col-sm-2" for="dateHasta">
                            Hasta
                        </label>
                    </div>
                    <div class=" col-md-2 col-xs-2">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar">
                                </i>
                            </div>
                            <input class="form-control" id="dateHasta" name="dateHasta" placeholder="MM/DD/YYYY" type="text" ng-model="fechaHasta" ng-change="listadoPedidos()"/>
                        </div>
                    </div>
                </div>


                <div class="col-md-3 col-xs-3">
                    <label for="itemsPerPageForm">Pedidos por pag</label>
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
                    <th ng-click="sort('Nombre_Fantasia')">Nombre Fantasía</th>
                    <th ng-click="sort('Fecha_Pedido')" class="centrar">Fecha Pedido</th>
                    <th ng-click="sort('Estado')" class="centrar">Estado</th>
                </tr>
                </thead>
                <tbody>
                <tr dir-paginate="ped in pedidos | filter:buscar|orderBy:sortKey:reverse | itemsPerPage: numXpag" pagination-id="pedid" ng-click="selectPedido(ped)">
                    <td>{{ped.Nro_Pedido}}</td>
                    <td class="centrar">{{ped.Codigo_Cliente}}</td>
                    <td>{{ped.Nombre_Fantasia}}</td>
                    <td class="centrar">{{ped.Fecha_Pedido}}</td>
                    <td class="centrar">{{ped.Estado}}</td>

                </tr>
                </tbody>
            </table>

            <dir-pagination-controls pagination-id="pedid" boundary-links="true"></dir-pagination-controls>
        </div>
    </div>
</div>