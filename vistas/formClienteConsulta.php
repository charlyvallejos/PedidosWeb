<?php


?>

<div class="panel-body ocultar ClienteConsulta">
    <form name="clienteFormConsulta" class="form-horizontal form-label-left"  id="formClienteConsulta" novalidate>
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <fieldset><legend>Cliente</legend>
                    <div class="item form-group">
                        <div class="row">
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="codigoCliente" class="form-control bold"  name="inputCodigoCliente" required type="text" ng-model="clienteTemporal.Codigo_Cliente">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 importante margin-top" for="razonSocial">Razón Social</label>
                            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                                <input id="razonSocial" class="form-control"  name="inputRazonSocial" required type="text" ng-model="clienteTemporal.Razon_Social">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="nombreFantasia">Nombre Fantasía</label>
                            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                                <input id="nombreFantasia" class="form-control"  name="inputNombreFantasia" required type="text" ng-model="clienteTemporal.Nombre_Fantasia">
                            </div>

                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Provincia">Provincia</label>
                            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                                <input id="Provincia" class="form-control"  name="inputProvincia" required type="text" ng-model="clienteTemporal.Provincia">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="codigoPostal">CP</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="codigoPostal" class="form-control"  name="inputcodigoPostal" required type="text" ng-model="clienteTemporal.Codigo_Postal">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Localidad">Localidad</label>
                            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                                <input id="Localidad" class="form-control"  name="inputLocalidad" required type="text" ng-model="clienteTemporal.Localidad">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Estado">Estado</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="Estado" class="form-control"  name="inputEstado" required type="text" ng-model="clienteTemporal.Estado">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Pais">Pais</label>
                            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                                <input id="Pais" class="form-control"  name="inputPais" required type="text" ng-model="clienteTemporal.Pais">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Telefonos">Telefonos</label>
                            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                                <input id="Telefonos" class="form-control"  name="inputTelefonos" required type="text" ng-model="clienteTemporal.Telefono">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Fax">Fax</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="Fax" class="form-control"  name="inputFax" required type="text" ng-model="clienteTemporal.Fax">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="DomEntrega">Domicilio Entrega</label>
                            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                                <input id="DomEntrega" class="form-control"  name="inputDomEntrega" required type="text" ng-model="clienteTemporal.Domicilio_Entrega">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="LocEntrega">Localidad Entrega</label>
                            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                                <input id="LocEntrega" class="form-control"  name="inputLocEntrega" required type="text" ng-model="clienteTemporal.Localidad_Entrega">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="CPEntrega">CP Entrega</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="CPEntrega" class="form-control"  name="inputCPEntrega" required type="text" ng-model="clienteTemporal.Codigo_Postal_Entrega">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="ProvEntrega">Provincia Entrega</label>
                            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                                <input id="ProvEntrega" class="form-control"  name="inputProvEntrega" required type="text" ng-model="clienteTemporal.Provincia_Entrega">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="RepEntrega">Reparto Entrega</label>
                            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                                <input id="RepEntrega" class="form-control"  name="inputRepEntrega" required type="text" ng-model="clienteTemporal.Reparto_Entrega">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="DomCobro">Domicilio Cobro</label>
                            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                                <input id="DomCobro" class="form-control"  name="inputDomCobro" required type="text" ng-model="clienteTemporal.Domicilio_Cobro">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="LocCobro">Localidad Cobro</label>
                            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                                <input id="LocCobro" class="form-control"  name="inputLocCobro" required type="text" ng-model="clienteTemporal.Localidad_Cobro">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="CPCobro">CP. Cobro</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="CPCobro" class="form-control"  name="inputCPCobro" required type="text" ng-model="clienteTemporal.Codigo_Postal_Cobro">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="ProvCobro">Provincia Cobro</label>
                            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                                <input id="ProvCobro" class="form-control"  name="inputProvCobro" required type="text" ng-model="clienteTemporal.Provincia_Cobro">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="RepCobro">Reparto Cobro</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="RepCobro" class="form-control"  name="inputRepCobro" required type="text" ng-model="clienteTemporal.Reparto_Cobro">
                            </div>

                        </div>
                    </div>
                    <hr>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 importante" for="TipoIva">IVA</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="TipoIva" class="form-control"  name="inputTipoIva" required type="text" ng-model="clienteTemporal.Tipo_Iva">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 importante" for="Cuit">CUIT</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="Cuit" class="form-control"  name="inputCuit" required type="text" ng-model="clienteTemporal.Nro_Cuit">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="CatIIBB">Cat.IIBB</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="CatIIBB" class="form-control"  name="inputCatIIBB" required type="text" ng-model="clienteTemporal.Categoria_Ing_Br">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="NroIIBB">Nro.IIBB</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="NroIIBB" class="form-control"  name="inputNroIIBB" required type="text" ng-model="clienteTemporal.Nro_Ing_Brutos">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <input type="radio" name="radioPedido" ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" id="radioPedido"  value="0"  checked/>
                                <label for="radioPedido">Convenio</label>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <input type="radio" name="radioCoti" id="radioCoti"  ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" value="1"/>
                                <label for="radioCoti">Remito</label>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <input type="radio" name="radioPresu" id="radioPresu"  ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" value="3"/>
                                <label for="radioPresu">Protocolo</label>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <input type="radio" name="radioPresu" id="radioPresu"  ng-model="pedidoTemporal.Generado_Por" ng-click="changeRadio()" value="3"/>
                                <label for="radioPresu">Imprime NC Dcto</label>
                            </div>
                            <label class="control-label col-md-2 col-sm-2 col-xs-2 falso-xs-12" for="FechaAlta">Fecha Alta</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="FechaAlta" class="form-control"  name="inputFechaAlta" required type="text" ng-model="clienteTemporal.Fecha_Alta">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="FechaVtoSedro">Fecha Vto. Sedro</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="FechaVtoSedro" class="form-control"  name="inputFechaVtoSedro" required type="text" ng-model="clienteTemporal.Fecha_Vto_Sedro">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="NroSedro">Nro Sedronar</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="NroSedro" class="form-control"  name="inputNroSedro" required type="text" ng-model="clienteTemporal.Nro_Sedronar">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="GrupoSedro">Grupo Sedronar</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="GrupoSedro" class="form-control"  name="inputGrupoSedro" required type="text" ng-model="clienteTemporal.Grupo_Sedro">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Afip">AFIP</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="Afip" class="form-control"  name="inputAfip" required type="text" ng-model="clienteTemporal.Afip">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Cufe">CUFE</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="Cufe" class="form-control"  name="inputCufe" required type="text" ng-model="clienteTemporal.Cufe">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="FechaVtoPsico">Fecha Vto. Psico</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="FechaVtoPsico" class="form-control"  name="inputFechaVtoPsico" required type="text" ng-model="clienteTemporal.Fecha_Vto_Psico">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="PsicoEstupe">Psico y Estupe</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="PsicoEstupe" class="form-control"  name="inputPsicoEstupe" required type="text" ng-model="clienteTemporal.PsicoEstupe">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="FechaDeudor">Fecha Est. Deudor</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="FechaDeudor" class="form-control"  name="inputFechaDeudor" required type="text" ng-model="clienteTemporal.Fecha_Estado_Deudor">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="EstadoDeudor">Estado Deudor</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="EstadoDeudor" class="form-control"  name="inputEstadoDeudor" required type="text" ng-model="clienteTemporal.Estado_Deudor">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Motivo">Motivo</label>
                            <div class="col-md-4 col-sm-4 col-xs-4 falso-xs-12">
                                <input id="Motivo" class="form-control"  name="inputMotivo" required type="text" ng-model="clienteTemporal.Motivo">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Comision">Comision</label>
                            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                                <input id="Comision" class="form-control"  name="inputComision" required type="text" ng-model="clienteTemporal.Comision">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Dcto">Dcto.</label>
                            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                                <input id="Dcto" class="form-control"  name="inputDcto" required type="text" ng-model="clienteTemporal.Dcto">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Credito">Crédito</label>
                            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                                <input id="Credito" class="form-control"  name="inputCredito" required type="text" ng-model="clienteTemporal.Credito">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 margin-top" for="DctoEfvo">Dcto Pago Eftvo</label>
                            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                                <input id="DctoEfvo" class="form-control"  name="inputDctoEfvo" required type="text" ng-model="clienteTemporal.Dcto_Pago_Ef">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Lista">Lista</label>
                            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                                <input id="Lista" class="form-control"  name="inputLista" required type="text" ng-model="clienteTemporal.Lista_Precio">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12 importante" for="Vendedor">Vendedor</label>
                            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                                <input id="Vendedor" class="form-control"  name="inputVendedor" required type="text" ng-model="clienteTemporal.Nombre_Vendedor">
                            </div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <div class="row">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Condicion">Condicion</label>
                            <div class="col-md-3 col-sm-3 col-xs-3 falso-xs-12">
                                <input id="Condicion" class="form-control"  name="inputCondicion" required type="text" ng-model="clienteTemporal.Condicion_Vta">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Agrup">Agrup</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="Agrup" class="form-control"  name="inputAgrup" required type="text" ng-model="clienteTemporal.Agrupacion">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Contacto">Contacto</label>
                            <div class="col-md-2 col-sm-2 col-xs-2 falso-xs-12">
                                <input id="Contacto" class="form-control"  name="inputContacto" required type="text" ng-model="clienteTemporal.Contacto">
                            </div>
                            <label class="control-label col-md-1 col-sm-1 col-xs-1 falso-xs-12" for="Transp">Transp.</label>
                            <div class="col-md-1 col-sm-1 col-xs-1 falso-xs-12">
                                <input id="Transp" class="form-control"  name="inputTransp" required type="text" ng-model="clienteTemporal.Transporte">
                            </div>
                        </div>
                    </div>

            </div>
        </div>
    </form>
</div>
