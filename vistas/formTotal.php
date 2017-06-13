<fieldset><legend>Total</legend>
    <div class="item form-group">
        <div class="row">
            <div class=" col-md-4 col-xs-4 falso-xs-12">
                <label for="inputTotalBruto" class="control-label">Total bruto:</label>
            </div>
            <div  class="col-md-8 col-xs-8 falso-xs-12">
                <input type="text" class="form-control" id="inputTotalBruto" name="" readonly ng-model="pedidoTemporal.Total_Gravado">
            </div>
            <div class=" col-md-4 col-xs-4 falso-xs-12">
                <label for="" class="control-label">IVA:</label>
            </div>
            <div  class="col-md-4 col-xs-4 falso-xs-12">
                <input type="text" class="form-control" readonly ng-model="pedidoTemporal.Porc_Iva_Ins">
            </div>
            <div  class="col-md-4 col-xs-4 falso-xs-12">
                <input type="text" class="form-control" readonly ng-model="pedidoTemporal.Iva_Ins">
            </div>
            <div class=" col-md-4 col-xs-4 falso-xs-12">
                <label for="" class="control-label">Exento:</label>
            </div>
            <div  class="col-md-8 col-xs-8 falso-xs-12">
                <input type="text" class="form-control" readonly ng-model="pedidoTemporal.Total_Exento">
            </div>

            <div class=" col-md-4 col-xs-4 falso-xs-12">
                <label for="" class="control-label">IB CBA:</label>
            </div>
            <div  class="col-md-3 col-xs-3 falso-xs-12">
                <input type="text" class="form-control" readonly>
            </div>
            <div  class="col-md-5 col-xs-5 falso-xs-12">
                <input type="text" class="form-control"  readonly>
            </div>

            <div class=" col-md-4 col-xs-4 falso-xs-12">
                <label for="" class="control-label">IB PBA:</label>
            </div>
            <div  class="col-md-3 col-xs-3 falso-xs-12">
                <input type="text" class="form-control"  readonly>
            </div>
            <div  class="col-md-5 col-xs-5 falso-xs-12">
                <input type="text" class="form-control"  readonly>
            </div>
            <br> <!-- linea -->
            <div class=" col-md-4 col-xs-4 falso-xs-12">
                <label for="" class="control-label">SubTotal:</label>
            </div>
            <div  class="col-md-8 col-xs-8 falso-xs-12">
                <input type="text" class="form-control"  readonly>
            </div>
            <div class=" col-md-4 col-xs-4 falso-xs-12">
                <label for="" class="control-label">Dcto:</label>
            </div>
            <div  class="col-md-3 col-xs-3 falso-xs-12">
                <input type="text" class="form-control"  readonly>
            </div>
            <div  class="col-md-5 col-xs-5 falso-xs-12">
                <input type="text" class="form-control"  readonly>
            </div>
            <br><!-- linea -->
            <div class=" col-md-4 col-xs-4 falso-xs-12">
                <label for="" class="control-label">Total Neto:</label>
            </div>
            <div  class="col-md-8 col-xs-8 falso-xs-12">
                <input type="text" class="form-control"  readonly>
            </div>
        </div>
    </div>
</fieldset>