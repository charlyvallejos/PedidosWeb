<fieldset><legend>Producto</legend>
    <div class="msgProducto ocultar"></div> <!--ng-hide="pedidoTemporal.Cliente"></div>-->
    <div class="item form-group top_search">
        <div class="row">
            <label class="control-label col-md-3 col-sm-3 col-xs-3 falso-xs-12" for="buscarProducto">Buscar:</label>
            <div class="col-md-9 col-sm-9 col-xs-9 falso-xs-12">
                <input id="buscarProducto" class="form-control col-md-7 col-xs-12"  name="buscarProducto" type="search" autocomplete="off" required><br>
<!--                ng-keyup="consultaProductoDescripcion($event.target.value)"-->
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8 falso-xs-12">
                <select id="productoSeleccion" class="form-control" ng-show="mostrarP" ng-model="prod" ng-options="x.Codigo_Producto  +' - '+ x.Descripcion_Producto for x in productos" ng-change="seleccionProducto(prod)">
                        <!--<option ng-repeat="clie in clientes" value="{{clie.Razon_Social}}">{{clie.Codigo_Cliente }}{{clie.Razon_Social}}</option>-->
                </select>
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" id="DescProd" class="form-control" name="DescProd" readonly ng-model="productoTemporal.Descripcion_Producto">
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <input type="text" id="CodProd" class="form-control" value="______/___" name="CodProd" readonly ng-model="productoTemporal.Codigo_Producto">
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <input type="text" id="UmeVta" class="form-control" name="UmeVta" readonly ng-model="productoTemporal.UmeVta">
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <select name="estadoProd" id="" class="form-control" disabled ng-init="productoTemporal.Estado_PF = 'CAR'">
                    <option value="{{productoTemporal.Estado_PF}}" >{{productoTemporal.Estado_PF}}</option>
                </select>
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" id="RubroProd" class="form-control" name="RubroProd" readonly ng-model="productoTemporal.Rubro_Vta">
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <label class="control-label" for="ListaProd">Lista</label>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-12">
                <input type="text" id="ListaProd" class="form-control" name="ListaProd" readonly ng-model="pedidoTemporal.Cliente.Lista">
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row fila-form">
            <div class="col-md-2 col-sm-2 col-xs-12">
                <label class="control-label" for="PrecioProdLista">Precio Lista</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <input type="text" id="PrecioProdLista" class="form-control" name="PrecioProdLista" readonly ng-model="productoTemporal.Precio_Lista">
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <label class="control-label" for="PrecioProd">Precio</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <input type="text" id="PrecioProd" class="form-control" name="PrecioProd" readonly ng-model="productoTemporal.Precio">
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12">
                <label class="control-label" for="CantProd">Cant.</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <input type="text" id="CantProd" class="form-control" name="CantProd"  ng-model="productoTemporal.Cantidad" ng-keydown="agregarProductoGrilla($event)" autocomplete="off">
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <a href=""><img src="img/delete.png" width="44px" height="44px" alt="Borrar" ng-click="borraProductoGrilla(productoTemporal)"></a>
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row" ng-show="muestraMsjProducto">
            <div class="col-md-12">
                <div id="msjProdu">{{msjProducto}}</div>
            </div>
        </div>
    </div>

</fieldset>
