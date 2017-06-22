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
                <div class="modal fade alert-modal in" id="modalRadio"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                <input type="radio" name="radioPedido" ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" id="radioPedido"  value="0"  checked/>
                                <label for="radioPedido">Pedido</label>
                            </div>
                            <div class="funkyradio-default">
                                <input type="radio" name="radioCoti" id="radioCoti"  ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" value="1"/>
                                <label for="radioCoti">Cotización</label>
                            </div>
                            <div class="funkyradio-default">
                                <input type="radio" name="radioPresu" id="radioPresu"  ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" value="3"/>
                                <label for="radioPresu">Presupuesto</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="funkyradio">
                            <div class="funkyradio-default">
                                <input type="radio" name="radio" id="radioMostra"  ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()"  value="2"/>
                                <label for="radioMostra">Mostrador</label>
                            </div>
                            <div class="funkyradio-default">
                                <input type="radio" name="radio" id="radioFR"  ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" value="045"/>
                                <label for="radioFR">F.R</label>
                            </div>
                            <div class="funkyradio-default">
                                <input type="radio" name="radio" id="radioSF"  ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" value="0227"/>
                                <label for="radioSF">S.F</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <button class="btn-0" ng-click="resetearFormulario(pedidoForm)">Cancelar</button>
                    </div>
                    <div class="col-md-12">
                        <button class="btn-1" ng-click="grabarPedido(pedidoForm)" ng-disabled="pedidoTemporal.Productos.length == 0">Grabar</button>
                    </div>
                    <div class="col-md-12">
                        <button class="btn-1" ng-click="imprimirPedido(pedidoForm)" ng-disabled="pedidoTemporal.Nro_Pedido == undefined">Imprimir</button>
                    </div>
                    <div class="col-md-12">
                        <button class="btn-1" ng-click="historial(pedidoForm)" ng-disabled="pedidoTemporal.Nro_Pedido == undefined">Historial</button>
                    </div>

                </div>
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
