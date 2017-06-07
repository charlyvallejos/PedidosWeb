<div ng-controller="pedidosController">
<?php

$titulo = "Pedidos Saporiti";

//include 'formPedido.php' ?>

<div class="panel panel-default">
    <div class="panel-heading"><a href="" class="agregar"><img src="img/add.png" alt=""></a></div>
    <div class="mensaje ocultar">
        <div class="error"><p></p></div>
        <div class="exito"><p></p></div>
    </div>
    <div class="panel-body ocultar formData">
        <form name="pedidoForm" class="form-horizontal form-label-left" novalidate>
            <div class="row">
                <div class="col-md-8 col-xs-12">
                    <?php include 'formCliente.php' ?><!-- ############# CLIENTE ############ -->
                </div>
                <div class="col-md-4 col-xs-12">
                    <?php include 'formTotal.php' ?><!--############## TOTAL ########### -->
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-md-8 col-xs-12">
                    <?php include 'formProducto.php' ?><!-- ######### PRODUCTO ############ -->
                </div>
                <div class="col-md-4 col-xs-12">
                    <br>
                    <br>
                    <fieldset>
                        <div class="form-group">
                            <div class="col align-self-center">
                                <br> <!-- Si... esto es berreta por ahora -->
                                <br>
                                <button  type="reset" class="btn btn-primary">Cancelar</button>
                                <br><br>
                                <br>
                                <button  type="submit" class="btn btn-success" ng-click="modificarPedido(provForm)">Grabar</button>
                                <br>
                                <br>
                                <br>
                                <br>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <?php include 'formGrillaProducto.php' ?> <!--######### Grilla ######### -->
                </div>
            </div>

        </form>
    </div>
</div>

    <!-------------------------------------------------------------------------------------------------------------------->

    <div class="panel" ng-init="consultaPedidos()">
    <div class="panel-body">
           <!--<div ng-show="pedidos.length == 0" class='error'>NO HAY REGISTRO DE PEDIDOS</div>-->
            <input type="search" ng-model="buscar" class="form-control" placeholder="Buscar">
            <table data-mostrar class="table table-striped">
                <thead>
                <tr>
                    <th ng-click="sort('Nro_Pedido')">Nro Pedido</th>
                    <th ng-click="sort('Codigo_Cliente')" class="centrar">Codigo Cliente</th>
                    <th ng-click="sort('Fecha_Pedido')" class="centrar">Fecha Pedido</th>
                    <th class="centrar">Codigo Vendedor</th>
                    <th class="centrar">Estado</th>
                    <th class="centrar"><label for="itemsPerPageForm">Pedidos por pagina</label>
                        <select name="itemsPerPageForm" id="itemsPerPageForm" ng-model="numXpag">
                            <option value="3">3</option>
                            <option value="15">15</option>
                            <option value="30">30</option>
                            <option value="50">50</option>
                        </select>
                    </th>
                </tr>
                </thead>
                <tbody>
                    <tr dir-paginate="ped in pedidos | filter:buscar|orderBy:sortKey:reverse | itemsPerPage: numXpag" pagination-id="pedid" ng-click="editarPedido(ped)">
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