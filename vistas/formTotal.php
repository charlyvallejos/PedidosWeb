<fieldset><legend>Total</legend>
    <div class="item form-group">
        <div class="row total_datos">

                <div class="col-md-4 col-xs-12">
                    <label for="" class="col-md-6 col-xs-12 control-label label_titulo">Total bruto: </label>
                    <label for="" class="col-md-6 col-xs-12 control-label"> {{pedidoTemporal.Total_Gravado | number:2}}</label>
                </div>
                <div class=" col-md-4 col-xs-12">
                    <label for="" class="col-md-2 col-xs-12 control-label label_titulo">IVA: </label>
                    <label for="" class="col-md-5 col-xs-12 control-label">{{pedidoTemporal.Porc_Iva | number:2 | porcentaje}}</label>
                    <label for="" class="col-md-5 col-xs-12 control-label">{{pedidoTemporal.Iva | number:2}}</label>
                </div>
                <div class=" col-md-4 col-xs-12">
                    <label for="" class="col-md-6 col-xs-12 control-label label_titulo">Exento: </label>
                    <label for="" class="col-md-6 col-xs-12 control-label">{{pedidoTemporal.Total_Exento | number:2}}</label>
                </div>
                <div class="col-md-8 offset-md-4 col-xs-12">
                    <label for="" class="col-md-3 col-xs-12 control-label label_titulo">IB CBA: </label>
                    <label for="" class="col-md-3 col-xs-12 control-label">{{pedidoTemporal.Porc_IngBr_Cba | number:2 | porcentaje}} </label>
                    <label for="" class="col-md-3 col-xs-12 control-label">{{pedidoTemporal.IngBr_Cba | number:2}} </label>
                </div>


                <div class=" col-md-4 col-xs-12">
                    <label for="" class="control-label label_titulo">IB PBA: </label>
                    <label for="" class="control-label"> {{pedidoTemporal.IngBr_Pba| number:2}}</label>
                </div>
                <div class=" col-md-4 col-xs-12">
                    <label for="" class="control-label label_titulo">IB Mis: </label>
                    <label for="" class="control-label"> {{pedidoTemporal.Porc_IngBr_Mis| number:2 | porcentaje}}</label>
                    <label for="" class="control-label"> {{pedidoTemporal.IngBr_Mis| number:2}}</label>
                </div>
                <div class="col-md-4 col-xs-12">
                    <label for="" class="control-label label_titulo">Dcto: </label>
                    <label for="" class="control-label"> {{pedidoTemporal.PorcDcto| number:2 | porcentaje}}</label>
                    <label for="" class="control-label"> {{pedidoTemporal.Descuento| number:2}}</label>
                </div>
                <div class="col-md-4 col-xs-12">
                    <label for="" class="control-label label_titulo">SubTotal: </label>
                    <label for="" class="control-label"> {{pedidoTemporal.SubTotal| number:2}}</label>
                </div>
                <div class="col-md-4 col-xs-12">
                    <label for="" class="control-label label_titulo">Total Neto: </label>
                    <label for="" class="control-label"> {{pedidoTemporal.Total_Neto| number:2}}</label>
                </div>
        </div>
    </div>
</fieldset>

