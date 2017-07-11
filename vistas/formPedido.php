 <?php ?>
<div class="panel panel-default panel_pedido_plus">
    <div class="panel-heading agregar"><img src="img/add.png" alt=""></div>
    <div class="mensaje ocultar">
        <div class="error"><p></p></div>
        <div class="exito"><p></p></div>
    </div>
    <div class="panel-body ocultar formData">
        <strong class="nroPedido" ng-show="pedidoTemporal.Nro_Pedido > 0">PEDIDO {{pedidoTemporal.Nro_Pedido}}</strong>
        <form name="pedidoForm" class="form-horizontal form-label-left"  id="pedidoForm" novalidate>
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
                <!-- MODAL DE RADIO -->
                <div class="modal fade alert-modal in" id="modalRadio"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-GeneradoPor data-IdReparto>
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body">
                                <p>Perderá los datos cargados, continúa?</p>
                                <button class="btn-1" ng-click="radioChangeSi()">Si</button>
                                <button class="btn-0" ng-click="radioChangeNo()">No</button>
                            </div>
                        </div>
                    </div>
                </div>

            <div class="col-md-4 col-xs-12">
                <div class="row">
                    <div class="col-xs-6">
                        <div class="funkyradio">
                            <div class="funkyradio-default">
                                <input type="radio" name="generadoPor"  ng-click="changeRadio()" ng-model="pedidoTemporal.Generado_Por" id="radioPedido" value="pedido"/>
                                <label for="radioPedido">Pedido</label>
                            </div>
                            <div class="funkyradio-default">
                                <input type="radio" name="generadoPor" id="radioCoti" ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" value="cotizacion"/>
                                <label for="radioCoti">Cotización</label>
                            </div>
                            <div class="funkyradio-default">
                                <input type="radio" name="generadoPor" id="radioPresu" ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" value="presupuesto"/>
                                <label for="radioPresu">Presupuesto</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="funkyradio">
                            <div class="funkyradio-default">
                                <input type="radio" name="generadoPor" ng-model="pedidoTemporal.Generado_Por" id="radioMostra" ng-click="changeRadio()" value="mostrador"/>
                                <label for="radioMostra">Mostrador</label>
                            </div>
                            <div class="funkyradio-default">
                                <input type="radio" name="generadoPor" id="radioFR" ng-model="pedidoTemporal.Generado_Por"  ng-click="changeRadio()" value="fr"/>
                                <label for="radioFR">F.R</label>
                            </div>
                            <div class="funkyradio-default">
                                <input type="radio" name="generadoPor" id="radioSF" ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" value="sf"/>
                                <label for="radioSF">S.F</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-xs-3">
                        <label for="trans" class="control-label">Transporte:</label>
                    </div>
                    <div class="col-xs-9">
                        <select name="transportista" id="trans" class="form-control">
                            <option value="pedidoTemporal.Id_Transporte"></option>
                            <option value="pedidoTemporal.Id_Transporte">SPA</option>
                            <option value="pedidoTemporal.Id_Transporte">VIA1</option>
                        </select>
                    </div>
                </div>
                <div class="row form-group" ng-show="pedidoTemporal.Generado_Por == 'cotizacion'">
                    <div class="col-xs-2">
                        <label for="moneda" class="control-label">Moneda:</label>
                    </div>
                    <div class="col-xs-4">
                        <select name="moneda" id="moneda" class="form-control" ng-model="pedidoTemporal.id_Moneda" ng-change="buscaCotizacion(pedidoTemporal.id_Moneda)">
                            <option value=1>PESOS</option>
                            <option value=2>DOLAR</option>
                        </select>
                    </div>
                    <div class="col-xs-2">
                        <label for="cotizacion_moneda" class="control-label">Coti:</label>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" class="form-control" readonly name="cotizacion_moneda" id="cotizacion_moneda" ng-model="pedidoTemporal.Valor_Moneda">
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <button class="btn-0" ng-click="resetearFormulario(pedidoForm)">Cancelar</button>
                    </div>
                    <div class="col-md-12">
                        <button class="btn-1" ng-click="grabarPedido(pedidoForm)" ng-disabled="pedidoTemporal.Productos.length == 0">Grabar</button>
                    </div>
                </div>
                <!--
                <div class="row">
                    <div class="col-md-6">
                        <button class="btn-1" ng-click="imprimirPedido(pedidoForm)" ng-disabled="pedidoTemporal.Nro_Pedido == undefined">Imprimir</button>
                    </div>
                    <div class="col-md-6">
                        <button class="btn-1" ng-click="historial(pedidoForm)" ng-disabled="pedidoTemporal.Nro_Pedido == undefined">Historial</button>
                    </div>

                </div>
                -->
            </div>



            </div>

            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <fieldset><legend>Observaciones</legend>
                        <div class="item form-group">
                            <div class="row">
                                <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                    <label class="control-label" for="RazonSocial">Observaciones imprimir</label>
                                </div>
                                <div class="col-md-10 col-sm-10 col-xs-10 falso-xs-12">
                                    <textarea type="text" id="RazonSocial" class="form-control" name="RazonSocial" readonly ng-model="pedidoTemporal.Obs_No_Imprimir"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                    <label class="control-label" for="RazonSocial">Observaciones no imprimir</label>
                                </div>
                                <div class="col-md-10 col-sm-10 col-xs-10 falso-xs-12">
                                    <textarea type="text" id="RazonSocial" class="form-control" name="RazonSocial" readonly ng-model="pedidoTemporal.Obs_No_Imprimir"></textarea>
                                </div>
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
