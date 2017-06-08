<div>
<fieldset><legend>Cliente</legend>
    <div class="item form-group top_search">
        <div class="row">
            <label class="control-label col-md-3 col-sm-3 col-xs-3 falso-xs-12" for="buscarCliente">Buscar:</label>
            <div class="col-md-9 col-sm-9 col-xs-9 falso-xs-12">
                <input id="buscarCliente" class="form-control col-md-7 col-xs-12" ng-keyup="consultaClienteDescripcion($event.target.value)" name="buscarCliente" required type="search">                
            </div><!--
            --><div class="col-md-8 col-sm-8 col-xs-8 falso-xs-12 clienteSeleccion">
                <select style="color:blue;font-size: 16px;position:absolute;z-index: 999;top:-10px;left: 200px;" id="clienteSeleccion" ng-show="mostrar" ng-model="clie" ng-options="x.Codigo_Cliente +' - ' + x.Razon_Social  +' - '+ x.Nombre_Fantasia for x in clientes" ng-change="seleccionCliente(clie)">
                        <!--<option ng-repeat="clie in clientes" value="{{clie.Razon_Social}}">{{clie.Codigo_Cliente }}{{clie.Razon_Social}}</option>-->
                </select>
            </div>
        </div>        
    </div>
    <div class="item form-group">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <label class="control-label" for="RazonSocial">Razon Social</label>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5 falso-xs-12">
                <input type="text" id="RazonSocial" class="form-control" name="RazonSocial" ng-model="pedidoTemporal.Cliente.Razon_Social" readonly>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                <label class="control-label" for="CodigoCliente">Cod</label>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <input type="text" id="CodigoCliente" class="form-control" name="CodigoCliente" ng-model="pedidoTemporal.Cliente.Codigo_Cliente"  readonly>
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <label class="control-label" for="NombreFantasia">Nombre Fantasia</label>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5 falso-xs-12">
                <input type="text" id="NombreFantasia" class="form-control" name="NombreFantasia" ng-model="pedidoTemporal.Cliente.Nombre_Fantasia" readonly>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                <label class="control-label" for="Tipo_Iva">IVA</label>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <input type="text" id="Tipo_Iva" class="form-control" name="Tipo_Iva" ng-model="pedidoTemporal.Cliente.Tipo_Iva" readonly>
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row fila-form">
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <label class="control-label" for="Domicilio">Dirección</label>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5 falso-xs-12">
                <input type="text" id="Domicilio" class="form-control" name="Domicilio" ng-model="pedidoTemporal.Cliente.Domicilio" readonly>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                <label class="control-label" for="RazonSocial">Rep</label>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <input type="text" id="RazonSocial" class="form-control" name="RazonSocial" readonly>
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row fila-form">
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <label class="control-label" for="RazonSocial">Obs Imp</label>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10 falso-xs-12">
                <input type="text" id="RazonSocial" class="form-control" name="RazonSocial" readonly>
            </div>
        </div>
    </div>
    <div class="item form-group fila-form">
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <label class="control-label" for="RazonSocial">Obs No Imp</label>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10 falso-xs-12">
                <input type="text" id="RazonSocial" class="form-control" name="RazonSocial" readonly>
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row fila-form">
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <label class="control-label" for="RazonSocial">Trans</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <input type="text" id="RazonSocial" class="form-control" name="RazonSocial" readonly>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <label class="control-label" for="RazonSocial">Agrup</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <input type="text" id="RazonSocial" class="form-control" name="RazonSocial" readonly>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <label class="control-label" for="Codigo_Vendedor">Vend</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <input type="text" id="Codigo_Vendedor" class="form-control" name="Codigo_Vendedor" ng-model="pedidoTemporal.Cliente.Codigo_Vendedor"  readonly>
            </div>
        </div>
    </div>

    <div class="item form-group">
        <div class="row fila-form">
            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                <label class="control-label" for="RazonSocial">Cond Pago</label>
            </div>
            <div class="col-md-10 col-sm-10 col-xs-10 falso-xs-12">
                <input type="text" id="RazonSocial" class="form-control" name="RazonSocial" readonly>
            </div>
        </div>
    </div>
</fieldset>
</div>
