<div>
    <!-- Modal -->

    <div class="modal fade alert-modal in" id="modalCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-codCli>
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-body" ng-model="clie">
                    <p>El cliente ingresado no se corresponde al vendedor actual, desea continuar de todas formas?</p>
                    <button class="btn-1" ng-click="seleccionClienteModal()">Si</button>
                    <button class="btn-0" data-dismiss="modal" ng-click="desplegarCliente()">No</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade alert-modal in" id="modalCliente2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-pedido>
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-body" ng-model="pedAgrega">
                    <p>El cliente ya tiene un pedido Nro: {{pedAgrega.Nro_Pedido}} , le agrega?</p>
                    <button class="btn-1" ng-click="seleccionClienteModal2()">Si</button>
                    <button class="btn-0" data-dismiss="modal">No</button>
                </div>
            </div>
        </div>
    </div>

<fieldset ng-disabled="pedidoTemporal.Nro_Pedido > 0"><legend>Cliente</legend>
    <div class="msgCliente ocultar"></div>
    <div class="item form-group top_search">
        <div class="row">
            <label class="control-label col-md-3 col-sm-3 col-xs-3 falso-xs-12" for="buscarCliente">Buscar:</label>
            <div class="col-md-9 col-sm-9 col-xs-9 falso-xs-12">               
                <input id="buscarCliente" class="form-control col-md-7 col-xs-12"  name="buscarCliente" ng-model="clienteBuscado" required type="search" autocomplete="off">
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8 falso-xs-12">
                <select id="clienteSeleccion" class="form-control" ng-show="mostrarC" ng-model="clie" ng-options="x.Codigo_Cliente +' - ' + x.Razon_Social  +' - '+ x.Nombre_Fantasia for x in clientes" ng-change="seleccionCliente(clie)">
                        <!--<option ng-repeat="clie in clientes" value="{{clie.Razon_Social}}">{{clie.Codigo_Cliente }}{{clie.Razon_Social}}</option>-->
                </select>
            </div>
        </div>        
    </div>
    <div class="item form-group">
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-12">
                <label class="control-label" for="RazonSocial">Razon Social</label>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <input type="text" id="RazonSocial" class="form-control" name="RazonSocial" ng-model="pedidoTemporal.Cliente.Razon_Social" readonly>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <label class="control-label" for="CodigoCliente">Codigo</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <input type="text" id="CodigoCliente" class="form-control" name="CodigoCliente" ng-model="pedidoTemporal.Cliente.Codigo_Cliente"  readonly>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <label class="control-label" for="Reparto">Reparto</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <input type="text" id="Reparto" class="form-control" name="Reparto" readonly ng-model="pedidoTemporal.Cliente.Codigo_Reparto">
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-12">
                <label class="control-label" for="NombreFantasia">Nombre Fantasia</label>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <input type="text" id="NombreFantasia" class="form-control" name="NombreFantasia" ng-model="pedidoTemporal.Cliente.Nombre_Fantasia" readonly>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <label class="control-label" for="Tipo_Iva">IVA</label>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <input type="text" id="Tipo_Iva" class="form-control" name="Tipo_Iva" ng-model="pedidoTemporal.Cliente.Tipo_Iva" readonly>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <label class="control-label" for="Codigo_Vendedor">Vendedor</label>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <input type="text" id="Codigo_Vendedor" class="form-control" name="Codigo_Vendedor" ng-model="pedidoTemporal.Cliente.Codigo_Vendedor"  readonly>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <label class="control-label" for="Transporte">Trans</label>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <input type="text" id="Transporte" class="form-control" name="Transporte" readonly ng-model="pedidoTemporal.Cliente.Transporte">
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row fila-form">
            <div class="col-md-2 col-sm-2 col-xs-12">
                <label class="control-label" for="Domicilio">Dirección</label>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <input type="text" id="Domicilio" class="form-control" name="Domicilio" ng-model="pedidoTemporal.Cliente.Domicilio" readonly>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <label class="control-label" for="AgrupCli">Agrup</label>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                <input type="text" id="AgrupCli" class="form-control" name="RazonSocial" readonly ng-model="pedidoTemporal.Cliente.Agrupacion">
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <label class="control-label" for="RazonSocial">Obs Imp</label>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                <textarea type="text" id="RazonSocial" class="form-control" name="RazonSocial" readonly ng-model="pedidoTemporal.Cliente.Obs_Imprimir"></textarea>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <label class="control-label" for="RazonSocial">Obs No Imp</label>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                <textarea type="text" id="RazonSocial" class="form-control" name="RazonSocial" readonly ng-model="pedidoTemporal.Cliente.Obs_No_Imprimir"></textarea>
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row fila-form">
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <label class="control-label" for="RazonSocial">Cond Pago</label>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10 falso-xs-12">
                <input type="text" id="RazonSocial" class="form-control" name="CondPago" readonly ng-model="pedidoTemporal.Cliente.Condicion_Vta">
            </div>
        </div>
    </div>
</fieldset>
</div>
