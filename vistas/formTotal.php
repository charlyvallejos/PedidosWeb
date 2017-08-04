<fieldset><legend>Total</legend>
    <div class="item form-group">
        <div class="row">

            <div class="row">
                <div class=" col-md-1 col-xs-12">
                    <label for="inputTotalBruto" class="control-label">Total bruto:</label>
                </div>
                <div  class="col-md-2 col-xs-12">
                    <input type="text" class="form-control" id="inputTotalBruto" name="" readonly ng-model="pedidoTemporal.Total_Gravado">
                </div>
                <div class=" col-md-1 col-xs-12">
                    <label for="" class="control-label">IVA:</label>
                </div>
                <div  class="col-md-2 col-xs-12">
                    <input type="text" class="form-control" readonly ng-model="pedidoTemporal.Porc_Iva">
                </div>
                <div class="col-md-1 col-xs-12">
                    <span>%</span>
                </div>
                <div  class="col-md-2 col-xs-12">
                    <input type="text" class="form-control" readonly ng-model="pedidoTemporal.Iva">
                </div>
                <div class=" col-md-1 col-xs-12">
                    <label for="" class="control-label">Exento:</label>
                </div>
                <div  class="col-md-2 col-xs-2 falso-xs-12">
                    <input type="text" class="form-control" readonly ng-model="pedidoTemporal.Total_Exento">
                </div>
            </div>
            <div class="row">


                <div class=" col-md-1 col-xs-1 falso-xs-12">
                    <label for="" class="control-label">IB CBA:</label>
                </div>
                <div  class="col-md-2 col-xs-2 falso-xs-12">
                    <input type="text" class="form-control" readonly ng-model="pedidoTemporal.Porc_IngBr_Cba">
                </div>

                <div class="col-md-1 col-xs-1 falso-xs-12">
                    <span>%</span>
                </div>
                <div class="col-md-2 col-xs-2 falso-xs-12">
                    <input type="text" class="form-control"  readonly ng-model="pedidoTemporal.IngBr_Cba">
                </div>

                <div class=" col-md-1 col-xs-12">
                    <label for="" class="control-label">IB PBA:</label>
                </div>
                <div  class="col-md-1 col-xs-12">
                    <input type="text" class="form-control" readonly hidden>
                </div>
                <div  class="col-md-2 col-xs-12">
                    <input type="text" class="form-control"  readonly ng-model="pedidoTemporal.IngBr_Pba">
                </div>
            </div>
            <div class="row">
                <div class=" col-md-2 col-xs-12">
                    <label for="" class="control-label">IB Mis:</label>
                </div>
                <div  class="col-md-2 col-xs-12">
                    <input type="text" class="form-control"  readonly ng-model="pedidoTemporal.Porc_IngBr_Mis">
                </div>
                <div class="col-md-1 col-xs-12">
                    <span>%</span>
                </div>
                <div  class="col-md-2 col-xs-12">
                    <input type="text" class="form-control"  readonly ng-model="pedidoTemporal.IngBr_Mis">
                </div>

            </div>

            <hr>

            <div class=" col-md-1 col-xs-12">
                <label for="" class="control-label">Dcto:</label>
            </div>
            <div  class="col-md-2 col-xs-12">
                <input type="text" class="form-control"  ng-model="pedidoTemporal.PorcDcto" readonly>
            </div>
            <div  class="col-md-2 col-xs-12">
                <input type="text" class="form-control"  ng-model="pedidoTemporal.Descuento" readonly>
            </div>
            <div class=" col-md-1 col-xs-1 falso-xs-12">
                <label for="" class="control-label">SubTotal:</label>
            </div>
            <div  class="col-md-2 col-xs-2 falso-xs-12">
                <input type="text" class="form-control"  ng-model="pedidoTemporal.SubTotal" readonly>
            </div>

            <br><!-- linea -->
            <div class=" col-md-4 col-xs-4 falso-xs-12">
                <label for="" class="control-label">Total Neto:</label>
            </div>
            <div  class="col-md-8 col-xs-8 falso-xs-12">
                <input type="text" class="form-control"  ng-model="pedidoTemporal.Total_Neto" readonly>
            </div>
        </div>
    </div>
</fieldset>

