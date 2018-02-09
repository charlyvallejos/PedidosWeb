 <?php ?>
<div class="panel panel-default panel_pedido_plus">
    <div class="panel-heading agregar"><img src="img/add.png" alt=""></div>
    <div class="mensaje">
        <div class="error ocultar"><p>Ha ocurrido un error, intente nuevamente</p></div>
        <div class="exito ocultar"></div>
    </div>
    <div class="panel-body ocultar formData">
        <strong class="nroPedido" ng-show="pedidoTemporal.Nro_Pedido > 0">PEDIDO {{pedidoTemporal.Nro_Pedido}}</strong>
        <form name="pedidoForm" class="form-horizontal form-label-left"  id="pedidoForm" novalidate>
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <?php include 'formCliente.php' ?><!-- ############# CLIENTE ############ -->
                </div>
           </div>
           <div class="row">
               <div class="col-md-8 col-xs-12">
                   <?php include 'formProducto.php' ?><!-- ######### PRODUCTO ############ -->
               </div>
               <div class="col-md-4 col-xs-12">
                   <fieldset><legend>Observaciones</legend>
                       <div class="item form-group">
                           <div class="row">
                               <div class="col-md-12 col-sm-12 col-xs-12">
                                   <label class="control-label" for="RazonSocial">Observaciones imprimibles</label>
                               </div>
                               <div class="col-md-12 col-sm-12 col-xs-12">
                                   <textarea type="text" id="RazonSocial" class="form-control" name="RazonSocial"  ng-model="pedidoTemporal.Obs_Imprimir"></textarea>
                               </div>
                           </div>
                           <div class="row">
                               <div class="col-md-12 col-sm-12 col-xs-12">
                                   <label class="control-label" for="RazonSocial">Observaciones no imprimibles</label>
                               </div>
                               <div class="col-md-12 col-sm-12 col-xs-12">
                                   <textarea type="text" id="RazonSocial" class="form-control" name="RazonSocial"  ng-model="pedidoTemporal.Obs_No_Imprimir"></textarea>
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

            <!-- MODAL DE OPCIONES -->
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
            <div class="row">
                <div class="col-md-4 col-xs-12">
                    <fieldset ng-disabled="pedidoTemporal.Nro_Pedido > 0"><legend>Opciones</legend>
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

                    </fieldset>
                    <fieldset>
                        <div class="row">
                            <div class="col-xs-6">
                                <label for="trans" class="control-label">Transporte:</label>
                            </div>
                            <div class="col-xs-6">
                                <select name="transportista" id="trans" class="form-control" ng-model="pedidoTemporal.Id_Transporte">
                                    <option value="620">SPA</option>
                                    <option value="570">VIA1</option>
                                </select>
                            </div>
                            <div class="row form-group" ng-show="pedidoTemporal.Generado_Por == 'cotizacion'">
                                <div class="col-xs-2">
                                    <label for="moneda" class="control-label">Moneda:</label>
                                </div>
                                <div class="col-xs-4">
                                    <select name="moneda" id="moneda" class="form-control  fuente_dif" ng-model="pedidoTemporal.id_Moneda" ng-change="buscaCotizacion(pedidoTemporal.id_Moneda)">
                                        <option value="1">PESOS</option>
                                        <option value="2">DOLAR</option>
                                    </select>
                                </div>
                                <div class="col-xs-1">
                                    <label for="cotizacion_moneda" class="control-label">Coti:</label>
                                </div>
                                <div class="col-xs-4">
                                    <input type="text" class="form-control  fuente_dif" readonly name="cotizacion_moneda" id="cotizacion_moneda" ng-model="pedidoTemporal.Valor_Moneda">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <button class="btn-0" ng-click="resetearFormulario(pedidoForm)">Cancelar</button>
                            </div>
                            <div class="col-md-12">
                                <button class="btn-1" type="submit" ng-click="altaPedido()" ng-disabled="pedidoTemporal.Productos.length == 0  && pedidoTemporal.Cliente == undefined" ng-hide="pedidoTemporal.Nro_Pedido > 0">Grabar</button>
                            </div>
                            <div class="col-md-12">
                                <button class="btn-1" type="submit" ng-click="bajaPedido()" ng-disabled="pedidoTemporal.Productos.length == 0 && pedidoTemporal.Cliente == undefined" ng-show="pedidoTemporal.Nro_Pedido > 0">Dar de BAJA</button>
                            </div>
                            <div class="col-md-12">
                                <button class="btn-1" type="submit" ng-click="modificarPedido()" ng-disabled="pedidoTemporal.Productos.length == 0 && pedidoTemporal.Cliente == undefined" ng-show="pedidoTemporal.Nro_Pedido > 0">Modificar</button>
                            </div>

                        </div>
                    </fieldset>
                </div>
                <div class="col-md-8 cold-xs-12">
                    <!--############## TOTAL ########### -->
                    <?php include 'formTotal.php' ?>

                </div>
            </div>
            <div class="col-md-12 col-xs-12">

            </div>

                <div class="row">


                </div>
                




                



        </form>
    </div>
</div>
