<?php ?>
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
                <strong class="nroPedido">PEDIDO {{pedidoTemporal.Nro_Pedido}}</strong>
                <br>
                <br>
                <fieldset>
                    <div class="form-group">
                        <div class="col align-self-center">
                            <br> <!-- Si... esto es berreta por ahora -->
                            <br>
                            <button  type="reset" class="btn btn-primary" ng-click="resetearForm(pedidoForm)">Cancelar</button>
                            <br><br>
                            <br>
                            <button  type="submit" class="btn btn-success" ng-click="modificarPedido(form)">Grabar</button>
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
