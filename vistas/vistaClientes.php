<div ng-controller="clientesController" Id="vistaCliente">
    <?php
    ?>
    <!-------------------------------------------------------------------------------------------------------------------->
    <div class="panel panel_pedido" ng-init="consultaClientes()">
        <div class="panel-body">
            <div class="row">
                <div class=" col-md-9 col-xs-9">
                    <input type="search" ng-model="buscar" class="form-control" placeholder="Buscar">
                </div>
                <div class="col-md-3 col-xs-3">
                    <label for="itemsPerPageForm">Clientes por pagina</label>
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
                    <th ng-click="sort('Codigo_Cliente')">Codigo</th>
                    <th ng-click="sort('Razon_Social')">Razon Social</th>
                    <th ng-click="sort('Nombre_Fantasia')">Nombre Fantasía</th>
                    <th ng-click="sort('Cuit')" class="centrar">Cuit</th>
                    <th ng-click="sort('Telefono')" class="centrar">Telefono</th>
                    <th ng-click="sort('Localidad')">Localidad</th>
                </tr>
                </thead>
                <tbody>
                <tr dir-paginate="cli in clientes | filter:buscar|orderBy:sortKey:reverse | itemsPerPage: numXpag" pagination-id="clie" ng-click="selectCliente(cli)">
                    <td>{{cli.Codigo_Cliente}}</td>
                    <td>{{cli.Razon_Social}}</td>
                    <td>{{cli.Nombre_Fantasia}}</td>
                    <td>{{cli.Nro_Cuit}}</td>
                    <td class="centrar">{{cli.Telefono}}</td>
                    <td>{{cli.Localidad}}</td>
                </tr>
                </tbody>
            </table>

            <dir-pagination-controls pagination-id="clie" boundary-links="true"> </dir-pagination-controls>
        </div>
    </div>
</div>