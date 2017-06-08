<fieldset><legend>Producto</legend>
    <div class="item form-group top_search">
        <div class="row">
            <label class="control-label col-md-3 col-sm-3 col-xs-3 falso-xs-12" for="buscarCliente">Buscar:</label>
            <div class="col-md-9 col-sm-9 col-xs-9 falso-xs-12">
                <input id="buscarCliente" class="form-control col-md-7 col-xs-12"  name="buscarCliente" required type="search"><br>
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row">
            <div class="col-md-9 col-sm-9 col-xs-9 falso-xs-12">
                <input type="text" id="DescProd" class="form-control" name="DescProd" readonly ng-model="productoTemporal.Descripcion">
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <input type="text" id="CodProd" class="form-control" value="______/___" name="CodProd" readonly ng-model="productoTemporal.Codigo">
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row">
            <div class="col-md-9 col-sm-9 col-xs-9 falso-xs-12">
                <input type="text" id="RubroProd" class="form-control" name="RubroProd" readonly ng-model="productoTemporal.Rubro_Vta">
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <input type="text" id="UmeVta" class="form-control" name="UmeVta" readonly ng-model="productoTemporal.UmeVta">
            </div>
        </div>
    </div>
    <div class="item form-group">
        <div class="row fila-form">
            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                <label class="control-label" for="RazonSocial">Lista</label>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                <input type="text" id="ListaProd" class="form-control" name="ListaProd" readonly ng-model="productoTemporal.Lista">
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                <label class="control-label" for="RazonSocial">Precio</label>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <input type="text" id="PrecioProd" class="form-control" name="PrecioProd" readonly ng-model="productoTemporal.Precio_Lista">
            </div>

        </div>
    </div>
    <div class="item form-group">
        <div class="row fila-form">
            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                <label class="control-label" for="RazonSocial">Cant.</label>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                <input type="text" id="CantProd" class="form-control" name="CantProd" ng-model="productoTemporal.Cantidad">
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                <label class="control-label" for="RazonSocial">Precio</label>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <input type="text" id="CantProd" class="form-control" name="CantProd" readonly ng-model="productoTemporal.Precio">
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                <a href=""><img src="img/delete.png" width="44px" height="44px" alt="Borrar"></a>
            </div>
        </div>
    </div>

</fieldset>