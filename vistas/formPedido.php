 <?php ?>
<div class="panel panel-default panel_pedido_plus">
    <div class="panel-heading agregar"><img src="img/add.png" alt=""></div>
    <div class="mensaje ocultar">
        <div class="error"><p></p></div>
        <div class="exito"><p></p></div>
    </div>
    <div class="panel-body ocultar formData">
        <form name="pedidoForm" class="form-horizontal form-label-left"  id="pedidoForm" novalidate>
           <div class="row">
               <div class="col-xs-6">
                       <div class="funkyradio">
                           <div class="funkyradio-default">
                               <input type="radio" name="radio" id="radio1" />
                               <label for="radio1">Pedido</label>
                           </div>
                           <div class="funkyradio-default">
                               <input type="radio" name="radio" id="radio2" />
                               <label for="radio2">Cotización</label>
                           </div>
                           <div class="funkyradio-default">
                               <input type="radio" name="radio" id="radio3" />
                               <label for="radio3">Presupuesto</label>
                           </div>
                   </div>
               </div>
               <div class="col-xs-6">
                   <div class="funkyradio">
                       <div class="funkyradio-default">
                           <input type="radio" name="radio" id="radio4" />
                           <label for="radio4">Mostrador</label>
                       </div>
                       <div class="funkyradio-default">
                           <input type="radio" name="radio" id="radio5" />
                           <label for="radio5">F.R</label>
                       </div>
                       <div class="funkyradio-default">
                           <input type="radio" name="radio" id="radio6" />
                           <label for="radio6">S.F</label>
                       </div>
                   </div>
               </div>
           </div>
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
                <strong class="nroPedido">PEDIDO {{pedidoTemporal.Nro_Pedido}}</strong>
                <br>
                <br>
                <fieldset>
                    <div class="form-group">
                        <div class="col align-self-center">
                            <br> <!-- Si... esto es berreta por ahora -->
                            <br>
                            <button type="reset" class="btnCancelar" ng-click="resetearForm(pedidoForm)"><img src="img/btncancel.png" alt="Cancelar" width="24px" height="24px"><span>Cancelar</span></button>
                            <br><br>
                            <br>
                            <button type="submit" class="btnGrabar" ng-click="grabarPedido(pedidoForm)" ng-disabled="pedidoTemporal"><img src="img/btngrabar.png" alt="Grabar" width="25px" height="25px"><span>Grabar</span></button>
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
