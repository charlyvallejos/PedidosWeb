<fieldset><legend>Total</legend>
    <div class="item form-group">
        <div class="row total_datos">

            <table class="table table-responsive t-total">
                <tr>
                    <td colspan="2">Total bruto: </td>
                    <td>{{pedidoTemporal.Total_Gravado | number:2}}</td>
                </tr>
                <tr>
                    <td>Iva: </td>
                    <td>{{pedidoTemporal.Porc_Iva | number:2 | porcentaje}} </td>
                    <td>{{pedidoTemporal.Iva | number:2}}</td>
                </tr>
                <tr>
                    <td  colspan="2">Exento: </td>
                    <td>{{pedidoTemporal.Total_Exento | number:2}}</td>
                </tr>
                <tr>
                    <td>IB CABA: </td>
                    <td>{{pedidoTemporal.Porc_IngBr_Cba | number:2 | porcentaje}} </td>
                    <td>{{pedidoTemporal.IngBr_Cba | number:2}}</td>
                </tr>
                <tr>
                    <td  colspan="2">IB PBA: </td>
                    <td>{{pedidoTemporal.IngBr_Pba| number:2}}</td>
                </tr>
                <tr>
                    <td>IB Mis: </td>
                    <td>{{pedidoTemporal.Porc_IngBr_Mis| number:2 | porcentaje}} </td>
                    <td>{{pedidoTemporal.IngBr_Mis| number:2}}</td>
                </tr>
                <tr>
                    <td  colspan="2">SubTotal: </td>
                    <td>{{pedidoTemporal.SubTotal| number:2}}</td>
                </tr>
                <tr>
                    <td>Dcto: </td>
                    <td>{{pedidoTemporal.PorcDcto| number:2 | porcentaje}} </td>
                    <td>{{pedidoTemporal.Descuento| number:2}}</td>
                </tr>
                <tr>
                    <td  colspan="2">Neto:  </td>
                    <td>{{pedidoTemporal.Total_Neto| number:2}}</td>
                </tr>
            </table>

        </div>
    </div>
</fieldset>

