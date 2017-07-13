
    var apiURL = 'loadData.php';  // archivo en donde pasan los datos hacia las clases+

    //Variables jquery
    var btnInsertar = $("#insertar"),
        precarga = $("#precarga"),
        respuesta = $("#respuesta"),
        mostrar = $("#mostrar"),
        ajax = null;

    var formUp = $('.formData'),
        btnPlus = $('.agregar'),
        clienteSeleccion = $("#clienteSeleccion"),
        productoSeleccion = $("#productoSeleccion"),
        inputCantidad = $("#CantProd"),
        divMjeCliente = $(".msgCliente"),
        divMjeProd = $(".msgProducto"),        
        buscarProducto = $("#buscarProducto"),
        buscarCliente = $("#buscarCliente"),
        modalCliente = $("#modalCliente"),
        RubroProdInput = $("#RubroProd"),
        modalRadio = $("#modalRadio"),
        AgrupCliInput = $("#AgrupCli"),
        $radioFR = $("#radioFR"),
        $radioSF = $("#radioSF"),
        $radioPed = $("#radioPedido"),
        $radioCoti = $("#radioCoti"),
        $radioPresu = $("#radioPresu"),
        $radioMostro = $("#radioMostra");

    btnPlus.on('click',function(e){
        e.preventDefault();
        formUp.slideToggle();
    });


// Funcion que encontre por ahi que hace lo un PADLEFT
// nr: string a utilizar
// n: cantidad de caracteres
// str: string que se le agrega (en caso de no pasarle nada agrega '0')

    function padLeft(nr, n, str){
        return new Array(n-String(nr).length+1).join(str||'0')+nr;
    }
    //or as a Number prototype method:
    Number.prototype.padLeft = function (n,str){
        return new Array(n-String(this).length+1).join(str||'0')+this;
    };

    buscarCliente.autocomplete({
            source: apiURL+"?cliente",
            select: function(event,ui){
                var codCliente = [];

               codCliente = ui.item.value.split('-');

               angular.element($('#vistaPedidos')).scope().seleccionCliente(codCliente[0]);
            }
        });
    buscarProducto.autocomplete({
         source: apiURL+"?producto",
         select: function(event,ui){
               var codProducto = [];
               
               codProducto = ui.item.value.split('-');



               angular.element($('#vistaPedidos')).scope().seleccionProducto(codProducto[0]);
            }
     });
        
//////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////// APLICACION ANGULAR ///////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

    var app = angular.module('appSapo', ['angularUtils.directives.dirPagination','appLogin','appCliente','appProducto','ngMessages']) // aplicacion de angular

        .controller('pedidosController',function($scope,$http, $filter){ //controlador pedidos
            $scope.date = new Date();
            $scope.date = $filter('date')(Date.now(),'dd/MM/yyyy');

            $scope.pedidos = [];
            $scope.pedidoTemporal = {};

            $scope.productoTemporal = {};
            $scope.pedidoTemporal.Productos = [];

            $scope.produ_ma = {};
            $scope.produ_frac = {};
            $scope.mostrarC = false;
            $scope.mostrarP = false;
            $scope.pedidoTemporal.id_Moneda = 1;
            $scope.pedidoTemporal.Valor_Moneda = 1;
            $scope.clienteBuscado = "";

            $scope.pedidoTemporal.Generado_Por = $scope.Generado_Por = "pedido";



            //$scope.config = {headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}};

            //// Para ordenar por nro pedido, fecha o cliente /////
            $scope.sort = function(keyname){
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            };

            /////// PAGINACION --- es para que puedan seleccionar q cantidad x pag///////////
            $scope.numXpag = 5; //(default)
            //////////////////////////////

            $scope.consultaPedidos = function(codVend){
                //console.log(codVend);
                $http.get(apiURL+"?a=get&t=ped&codVend="+codVend)
                    .then(function(resp){
                        $scope.pedidos = resp.data;
                    })
                    .catch(function(resp){
                        console.log(resp);
                    });
            };

            /////////// SELECCIONA PEDIDO
            $scope.selectPedido = function (ped) {
                $scope.pedidoTemporal = ped;

                if($scope.pedidoTemporal.Generado_Por == 0)
                {
                    if($scope.pedidoTemporal.Id_Reparto == 45)
                    {
                        $radioFR.prop('checked',true);
                        $scope.pedidoTemporal.Generado_Por = "fr";
                    }
                    else if($scope.pedidoTemporal.Id_Reparto == 227)
                    {
                        $radioSF.prop('checked',true);
                        $scope.pedidoTemporal.Generado_Por = "sf";
                    }
                    else
                    {
                        $radioPed.prop('checked',true);
                        $scope.pedidoTemporal.Generado_Por = "pedido";
                    }
                }
                else if($scope.pedidoTemporal.Generado_Por == 1)
                {
                    $radioCoti.prop('checked',true);
                    $scope.pedidoTemporal.Generado_Por = "cotizacion";
                }
                else if($scope.pedidoTemporal.Generado_Por == 3)
                {
                    $scope.pedidoTemporal.Generado_Por = "presupuesto";
                    $radioPresu.prop('checked',true);
                }
                else if($scope.pedidoTemporal.Generado_Por == 2)
                {
                    $scope.pedidoTemporal.Generado_Por = "mostrador";
                    $radioMostro.prop('checked',true);
                }
                $scope.Generado_Por = $scope.pedidoTemporal.Generado_Por;


                //Traigo el detalle del pedido
                //Tambien traigo el cliente

                $http.get(apiURL+"?a=get&t=pedide&n="+ped.Nro_Pedido)                    
                    .then(function(resp){
                        $scope.pedidoTemporal.Productos = resp.data; ///////PEDID_DE

                        $http.get(apiURL+"?a=get&t=cli&idCli="+ped.id_Cliente)
                            .then(function(resp){
                                $scope.pedidoTemporal.Cliente = resp.data; ////////CLIEN_MA
                            })
                            .catch(function(resp){
                                console.log(resp);
                            });
                    })
                    .catch(function(resp){
                        console.log(resp);
                    });


                //Capturo el indice del array pedidos que seleccione
                $scope.index = $scope.pedidos.indexOf(ped);

                formUp.slideDown();
            };

            ////////// SELECCIONA PRODUCTO DE GRILLA
            $scope.selectProducto = function(prod,formCtrlProducto){
                $scope.index = $scope.pedidoTemporal.Productos.indexOf(prod);
                $scope.productoTemporal = prod;
            };
            $scope.borraProductoGrilla = function(prodTemporal){

                $scope.index = $scope.pedidoTemporal.Productos.indexOf(prodTemporal);

                if($scope.index >= 0){
                    $scope.pedidoTemporal.Productos.splice($scope.index,1);
                    $scope.productoTemporal = null;
                    $scope.calculaTotal();
                }                
                else
                {
                    $scope.productoTemporal = null;
                    buscarProducto.val('');
                    pedidoForm.buscarProducto.focus();
                }
            };

            $scope.agregarProductoGrilla = function(event,prodTemporal){
                if(event.which === 13 )                
                {

                    if(prodTemporal.Estado !== "BAJ"){
                        /*
                        if($scope.productoTemporal.Minimo > 0)
                        {
                            var resto = $scope.productoTemporal.Cantidad/$scope.productoTemporal.Minimo;

                            if($scope.productoTemporal.Minimo != resto)
                            {
                                $scope.muestraMsjProducto = true;
                                $scope.msjProducto = "La cantidad debe ser multiplo de: " + $scope.productoTemporal.Minimo;
                                $scope.productoTemporal.Cantidad = "";
                            }
                            else
                            {
                        */
                                var encontrarProducto = false;

                                if($scope.pedidoTemporal.Productos.length > 0)
                                {
                                    encontrarProducto = $filter('filter')($scope.pedidoTemporal.Productos,{Id_Producto:prodTemporal.Id_Producto,Id_Fraccio:prodTemporal.Id_Fraccio})[0];
                                }

                                //Chequear si esta en FALTA

                                $http.get(apiURL+"?a=get&t=falta&idPro="+$scope.productoTemporal.Id_Producto+"idFrac="+$scope.productoTemporal.Id_Fraccio)
                                    .then(function(resp){
                                        if(resp.data.falta)
                                            prodTemporal.Precio = 0;
                                    })
                                    .catch(function(){
                                        console.log("ERROR");
                                    });
                                /*
                                if($scope.pedidoTemporal.Generado_Por == "cotizacion")
                                {
                                    if(!$scope.productoTemporal.Habil_Cot)
                                    {
                                        $scope.muestraMsjProducto = true;
                                        $scope.msjProducto = "No puede agregar el producto para cotizaciones";
                                        $scope.productoTemporal = {};
                                    }
                                }
                                else if($scope.pedidoTemporal.Generado_Por == "presupuesto")
                                {
                                    if(!$scope.productoTemporal.Habil_Pre)
                                    {
                                        $scope.muestraMsjProducto = true;
                                        $scope.msjProducto = "No puede agregar el producto para presupuestos";
                                        $scope.productoTemporal = {};
                                    }
                                }
                                else if($scope.pedidoTemporal.Generado_Por == "pedido" || $scope.pedidoTemporal.Generado_Por == "sf" || $scope.pedidoTemporal.Generado_Por == "fr")
                                {
                                    if(!$scope.productoTemporal.Habil_Ped)
                                    {
                                        $scope.muestraMsjProducto = true;
                                        $scope.msjProducto = "No puede agregar el producto para pedidos";
                                        $scope.productoTemporal = {};
                                    }
                                }
                                */

                                if($scope.productoTemporal != null)
                                {
                                    if(encontrarProducto)
                                        $scope.pedidoTemporal.Productos.indexOf(encontrarProducto).cantidad = prodTemporal.Cantidad;
                                    else
                                    {
                                        if(prodTemporal.Precio == 0)
                                            prodTemporal.Estado = "FAL";
                                        else
                                            prodTemporal.Estado = "CAR";

                                        prodTemporal.Renglon+= 1; //Ver que esto funcione

                                        //Fecha cotizacion
                                        //Precio Lista en el caso que sea codigo oferta 7
                                        $scope.productoTemporal.Total = parseFloat(prodTemporal.Cantidad,3) * parseFloat(prodTemporal.Precio,3);
                                        $scope.pedidoTemporal.Productos.push(prodTemporal);
                                    }

                                    $scope.productoTemporal = {};
                                    buscarProducto.val('');
                                    buscarProducto.focus();
                                    $scope.calculaTotal();
                                }

                            //}

                        //}
                    }
                }
            };

            $scope.calculaTotal = function(){
                $scope.pedidoTemporal.Total_Gravado = 0;
                angular.forEach($scope.pedidoTemporal.Productos,function(v,k){                    
                    $scope.pedidoTemporal.Total_Gravado += v.Total;
                });

                $scope.Iva_IngBr = $scope.calculaIngBrutos($scope.pedidoTemporal.Cliente,$scope.pedidoTemporal.Productos);
                var Iva = 0;


                if($scope.Iva_IngBr != null)
                {
                    $scope.pedidoTemporal.Total_Gravado = $filter('number')($scope.Iva_IngBr.Bruto,2);
                    if($scope.Iva_IngBr.Iva_Ins > 0)
                    {
                        $scope.pedidoTemporal.Porc_Iva = $scope.Iva_IngBr.Porc_Iva_Ins;
                        $scope.pedidoTemporal.Iva = $scope.Iva_IngBr.Iva_Ins;
                    }
                    else
                    {
                        $scope.pedidoTemporal.Porc_Iva = $scope.Iva_IngBr.Porc_Iva_NoIns;
                        $scope.pedidoTemporal.Iva_NoIns = $scope.Iva_IngBr.Iva_NoIns;
                    }


                    $scope.pedidoTemporal.Iva = Iva;
                    $scope.pedidoTemporal.Total_Exento =  $scope.Iva_IngBr.Total_Prod_Exento;
                    $scope.pedidoTemporal.IngBr_Cba = $scope.Iva_IngBr.IngBr_Cba;
                    $scope.pedidoTemporal.Porc_IngBr_Cba = $scope.Iva_IngBr.Porc_IngBr_Cba;
                    $scope.pedidoTemporal.IngBr_Pba = $scope.Iva_IngBr.IngBr_Pba0 + $scope.Iva_IngBr.IngBr_Pba1;
                    $scope.pedidoTemporal.Porc_IngBr_Mis = $scope.Iva_IngBr.Porc_IngBr_Mis;
                    $scope.pedidoTemporal.IngBr_Mis = $scope.Iva_IngBr.IngBr_Mis;
                    $scope.pedidoTemporal.SubTotal = $scope.Iva_IngBr.SubTotal;
                    $scope.pedidoTemporal.PorcDcto =  $scope.Iva_IngBr.PorcDcto;
                    $scope.pedidoTemporal.Descuento = $scope.Iva_IngBr.Descuento;
                    $scope.pedidoTemporal.Total_Neto = $scope.Iva_IngBr.Total_Neto;


                }

            };

            $scope.calculaIngBrutos = function(cliente,productos){

                var Porc_Max_CBA = 6;
                var Porc_Max_PBA = 5;
                var PF_Pcia_Tipo_0_RI = 2.5;
                var PF_Pcia_Tipo_0_MT = 3;
                var Porc_CBA = 3.5;
                var Porc_Mis = 3.31;

                var Total_Prod_Ex = 0;
                var Total_Exento = 0;
                var sLetra = "";
                var Tot_Gravado_B = 0;
                var Total_Prod_0 = 0;
                var Total_Prod_1 = 0;
                var Total_Bruto = 0;
                var Iva_B = 0;
                var Iva_Ins = 0;
                var Iva_NoIns = 0;
                var Total_Gravado = 0;

                if(productos.length > 0){
                    //IVA y CM
                    //.....


                    //IVA
                    //......
                    angular.forEach(productos,function(v,k){
                        if(v.Tipo_Iva == "G") //PRODUCTO GRAVADO
                        {
                            var Precio_SINiva = v.Precio;
                            switch (cliente.Tipo_Iva){
                                case 'RI':
                                case 'NI':
                                    Total_Gravado += v.Cantidad * v.Precio;
                                    Iva_Ins += (v.Cantidad * v.Precio ) * cliente.Porcentaje_Iva / 100;
                                    sLetra="B";
                                    break;
                                case 'NC':
                                    v.Precio += parseFloat((v.Precio * cliente.Porcentaje_Iva / 100),2);
                                    Total_Exento += v.Cantidad * v.Precio;
                                    Iva_NoIns += parseFloat(((v.Cantidad * v.Precio) * cliente.Porcentaje_Iva_2 /100),2);
                                    Tot_Gravado_B += v.Cantidad * Precio_SINiva;
                                    Iva_B += ((v.Cantidad * Precio_SINiva) * cliente.Porcentaje_Iva / 100);
                                    sLetra = "B";
                                    break;
                                case 'CF':
                                case 'EX':
                                case 'MT':
                                    v.Precio = parseFloat((v.Precio * cliente.Porcentaje_Iva / 100),2);
                                    Total_Exento += v.Cantidad * v.Precio;
                                    Tot_Gravado_B += v.Cantidad * Precio_SINiva;
                                    Iva_B += ((v.Cantidad * Precio_SINiva) * cliente.Porcentaje_Iva / 100);
                                    sLetra = "B";
                                    break;
                                case 'FE':
                                    Total_Prod_Ex += v.Cantidad * v.Precio;
                                    sLetra = 'E';
                                    break;
                            }
                        }
                        else
                            Total_Prod_Ex += v.Cantidad * v.Precio;


                        if(v.Tipo_Ing_Br == 0)
                            Total_Prod_0 += v.Cantidad * v.Precio;
                        else
                            Total_Prod_1 += v.Cantidad * v.Precio;

                        Total_Bruto = Total_Prod_0 + Total_Prod_1;

                    });

                    var Iva_IngBr = {};
                    Iva_IngBr.Total_Gravado = Total_Gravado;
                    Iva_IngBr.Total_Exento = Tot_Gravado_B + Iva_B;
                    Iva_IngBr.Total_Prod_Exento = Total_Prod_Ex;
                    Iva_IngBr.Porc_Iva_Ins = parseFloat(cliente.Porcentaje_Iva,2);
                    Iva_IngBr.Porc_Iva_NoIns = parseFloat(cliente.Porcentaje_Iva_2,2);
                    Iva_IngBr.Iva_Ins = Iva_NoIns;
                    Iva_IngBr.IngBr_Cba = 0;
                    Iva_IngBr.IngBr_Mis = 0;
                    Iva_IngBr.IngBr_Pba0 = 0;
                    Iva_IngBr.IngBr_Pba1 = 0;
                    Iva_IngBr.Iva_NoIns = 0;
                    Iva_IngBr.PorcDcto = 0;
                    Iva_IngBr.Descuento = 0;
                    Iva_IngBr.SubTotal = 0;
                    Iva_IngBr.Porc_IngBr_Cba = 0;
                    Iva_IngBr.Impuestos = 0;




                    var Total_Pedido = 0;

                    if(sLetra == "A")
                        Total_Pedido = Total_Gravado + (Total_Exento / (1 + cliente.Porcentaje_Iva / 100)) + Total_Prod_Ex;
                    else
                        Total_Pedido = Total_Gravado + Total_Exento + Total_Prod_Ex;


                    //CALCULO DE IIBB
                    //......

                    if(productos[0].Id_Producto != 4 && productos[0].Id_Producto != 3880)
                    {
                        if(cliente.Convenio)
                        {
                            if(cliente.Padron_Reg_Gral != null && cliente.Padron_Reg_Gral > 0)
                            {
                                Iva_IngBr.Porc_IngBr_Cba = cliente.Alicuota_Percepcion;
                                Iva_IngBr.IngBr_Cba = Total_Bruto * Iva_IngBr.Porc_IngBr_Cba / 100;

                            }
                            else
                            {
                                Iva_IngBr.Porc_IngBr_Cba = Porc_Max_CBA;
                                Iva_IngBr.IngBr_Cba = Total_Bruto * Iva_IngBr.Porc_IngBr_Cba / 100;

                            }

                            if(cliente.CM_J902)
                            {
                                if(cliente.CM_J902 >= 0.1)
                                {
                                    switch (cliente.Tipo_Iva)
                                    {
                                        case 'RI':
                                            PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_RI;
                                            break;
                                        case 'NI':
                                        case 'NC':
                                        case 'EX':
                                        case 'MT':
                                            PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_MT;
                                            break;
                                        default:
                                            PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_MT;
                                            break;
                                    }

                                    Iva_IngBr.Porc_IngBr_Pba0 = PF_Pcia_Tipo_0;
                                    Iva_IngBr.Porc_IngBr_Pba1 = cliente.Porcentaje_Pcia;
                                    Iva_IngBr.IngBr_Pba0 = Total_Prod_0 * PF_Pcia_Tipo_0 / 100;
                                    Iva_IngBr.IngBr_Pba1 = Total_Prod_1 * cliente.Porcentaje_Pcia / 100;
                                    Iva_IngBr.Base_Pba0 = Total_Prod_0;
                                    Iva_IngBr.Base_Pba1 = Total_Prod_1;
                                }else
                                {
                                    Iva_IngBr.Porc_IngBr_Pba0 = 0;
                                    Iva_IngBr.Porc_IngBr_Pba1 = 0;
                                    Iva_IngBr.IngBr_Pba0 = 0;
                                    Iva_IngBr.IngBr_Pba1 = 0;
                                    Iva_IngBr.Base_Pba0 = 0;
                                    Iva_IngBr.Base_Pba1 = 0;
                                }
                            }
                            else
                            {
                                Iva_IngBr.Porc_IngBr_Pba0 = Porc_Max_PBA;
                                Iva_IngBr.Porc_IngBr_Pba1 = 0;
                                Iva_IngBr.IngBr_Pba0 = Total_Bruto * Iva_IngBr.Porc_IngBr_Pba0 / 100;
                                Iva_IngBr.IngBr_Pba1 = 0;
                                Iva_IngBr.Base_Pba0 = Total_Bruto;
                                Iva_IngBr.Base_Pba1 = 0;
                            }
                        }
                        else
                        {
                            if(cliente.Id_Provincia_CatIngBr == 2)
                            {
                                if(cliente.Id_Cat_Ing_Br == 8)
                                {
                                    Iva_IngBr.Porc_IngBr_Cba = 0;
                                    Iva_IngBr.IngBr_Cba = 0;
                                }
                                else
                                {
                                    if(cliente.Padron_Reg_Gral)
                                    {
                                        Iva_IngBr.Porc_IngBr_Cba = cliente.Alicuota_Percepcion;
                                        Iva_IngBr.IngBr_Cba = Total_Bruto * Iva_IngBr.Porc_IngBr_Cba / 100;
                                        console.log(Iva_IngBr.IngBr_Cba);
                                    }
                                    else
                                    {
                                        Iva_IngBr.Porc_IngBr_Cba = Porc_Max_CBA;
                                        Iva_IngBr.IngBr_Cba = Total_Bruto * Iva_IngBr.Porc_IngBr_Cba / 100;
                                        console.log(Iva_IngBr.IngBr_Cba);
                                    }
                                }
                            }
                            if(cliente.Id_Provincia_CatIngBr == 1)
                            {
                                if(cliente.Id_Cat_Ing_Br == 8)
                                {
                                    Iva_IngBr.Porc_IngBr_Pba0 = 0;
                                    Iva_IngBr.Porc_IngBr_Pba1 = 0;
                                    Iva_IngBr.IngBr_Pba0 = 0;
                                    Iva_IngBr.IngBr_Pba1 = 0;
                                }
                                else
                                {
                                    if(cliente.Porcentaje_Pcia > 0)
                                    {
                                        switch (cliente.Tipo_Iva)
                                        {
                                            case "RI":
                                                PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_RI;
                                                break;
                                            case "NI":
                                            case "NC":
                                            case "EX":
                                            case "MT":
                                                PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_MT;
                                                break;
                                            default:
                                                PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_MT;
                                                break;
                                        }

                                        Iva_IngBr.Porc_IngBr_Pba0 = PF_Pcia_Tipo_0;
                                        Iva_IngBr.Porc_IngBr_Pba1 = cliente.Porcentaje_Pcia;
                                        Iva_IngBr.IngBr_Pba0 = Total_Prod_0 * PF_Pcia_Tipo_0 / 100;
                                        Iva_IngBr.IngBr_Pba1 = Total_Prod_1 * cliente.Porcentaje_Pcia / 100;
                                        Iva_IngBr.Base_Pba0 = Total_Prod_0;
                                        Iva_IngBr.Base_Pba1 = Total_Prod_1;
                                    }
                                    else
                                    {
                                        Iva_IngBr.Porc_IngBr_Pba0 = 0;
                                        Iva_IngBr.Porc_IngBr_Pba1 = 0;
                                        Iva_IngBr.IngBr_Pba0 = 0;
                                        Iva_IngBr.IngBr_Pba1 = 0;
                                        Iva_IngBr.Base_Pba0 = 0;
                                        Iva_IngBr.Base_Pba1 = 0;
                                    }
                                }

                            }
                        }
                    }
                    else
                    {
                        Iva_IngBr.Porc_IngBr_Cba = 0;
                        Iva_IngBr.IngBr_Cba = 0;

                        Iva_IngBr.Porc_IngBr_Pba0 = 0;
                        Iva_IngBr.Porc_IngBr_Pba1 = 0;
                        Iva_IngBr.IngBr_Pba0 = 0;
                        Iva_IngBr.IngBr_Pba1 = 0;
                        Iva_IngBr.Base_Pba0 = 0;
                        Iva_IngBr.Base_Pba1 = 0;
                    }

                    //Misiones

                    if(cliente.provincia == 14 && cliente.Id_Cat_Ing_Br != 8)
                    {
                        Iva_IngBr.Porc_IngBr_Mis = Porc_Mis;
                        Iva_IngBr.IngBr_Mis = Total_Bruto * Iva_IngBr.Porc_IngBr_Mis / 100;
                    }
                    else
                    {
                        Iva_IngBr.Porc_IngBr_Mis = 0;
                        Iva_IngBr.IngBr_Mis = 0;
                    }

                    //______________________________________
                    var dBruto = 0;
                    var dImpuestos = 0;
                    var dSubTotal = 0;
                    var dPorcDcto = parseFloat(cliente.Dcto,3);
                    var dDescuento = 0;
                    var dTotalNeto = 0;

                    dBruto = Iva_IngBr.Total_Gravado + Iva_IngBr.Total_Exento;
                    dImpuestos = Iva_IngBr.IngBr_Cba + Iva_IngBr.IngBr_Mis + Iva_IngBr.IngBr_Pba0 + Iva_IngBr.IngBr_Pba1 +
                        Iva_IngBr.Iva_Ins + Iva_IngBr.Iva_NoIns;
                    dSubTotal = dBruto + Iva_IngBr.Total_Prod_Exento + dImpuestos;
                    dDescuento = (dBruto + Iva_IngBr.Total_Prod_Exento) * dPorcDcto / 100;
                    dTotalNeto = dSubTotal - dDescuento;

                    Iva_IngBr.Bruto = dBruto;
                    Iva_IngBr.Impuestos = dImpuestos;
                    Iva_IngBr.SubTotal = dSubTotal;
                    Iva_IngBr.Total_Prod_Exento = Total_Prod_Ex;
                    Iva_IngBr.PorcDcto = dPorcDcto;
                    Iva_IngBr.Descuento = dDescuento;
                    Iva_IngBr.Total_Neto = dTotalNeto;

                    return Iva_IngBr;
                }
            };

            /////////////////////////////////////////
            // BUSCADOR DE CLIENTES
            $scope.clientes = [];
            $scope.clienteSeleccionado = [];
            
            $scope.consultaClienteDescripcion = function(des){                                
                if(des !== ""){
                    //Debe controlar primero que no haya productos cargados en la grilla de productos
                    //para evitar que modifiquen el cliente habiendo ya productos cargados.
                    if($scope.pedidoTemporal.Productos == undefined || $scope.pedidoTemporal.Productos.length == 0){
                        divMjeCliente.hide();
                        $http.get(apiURL+"?a=get&t=cli&des="+des)
                            .then(function(resp){
                                //console.log(resp.data);
                                $scope.clientes = resp.data;
                                $scope.mostrarC = $scope.clientes.length > 0;
                                clienteSeleccion.attr('size', 5);
                            })
                            .catch(function(){
                                console.log("ERROR");
                            });
                    }
                    else
                    {
                        divMjeCliente.text = "No se puede modificar el cliente si existen productos cargados";
                        divMjeCliente.show();
                    }
                }
                else
                {
                    $scope.mostrarC = false;
                }
                
            };

            $scope.listadoPedido = function(){

                    $http.get(apiURL+"?a=get&t=ped&codVend="+codVend+"desde="+$scope.fechaDesde+"hasta="+$scope.fechaHasta)
                        .then(function(resp){
                            $scope.pedidos = resp.data;
                        })
                        .catch(function(resp){
                            console.log(resp);
                        });

            };

            $scope.seleccionCliente = function(cod){
                if($scope.pedidoTemporal.Productos == undefined || $scope.pedidoTemporal.Productos.length == 0){
                    divMjeCliente.hide();

                    /*
                    if(event != null && event.which === 13){
                        cod = $scope.clienteBuscado;
                        if(!isNaN($scope.clienteBuscado) && $scope.clienteBuscado.length < 7)
                        {
                            while($scope.clienteBuscado.length < 7)
                                $scope.clienteBuscado = padLeft($scope.clienteBuscado,7);

                            cod = $scope.clienteBuscado;
                        }
                    }
                    */

                    if(cod !== undefined)
                    {

                        $http.get(apiURL+"?a=get&t=cli&cod="+cod)
                                .then(function(resp){
                                    if(resp.data.Fecha_Vto_Psico == '01/01/1900' || resp.data.Fecha_Vto_Psico >= $scope.date)
                                    {
                                        if(resp.data.Fecha_Facturar_Hasta == '01/01/1900' || resp.data.Fecha_Facturar_Hasta >= $scope.date)
                                        {

                                            if(CodVendedor == resp.data.Codigo_Vendedor)
                                            {

                                                $scope.poneColorAgrup(resp.data.Id_Agrupacion);
//////////////////////////PROBLEM
                                                $scope.pedidoTemporal.Cliente = resp.data;

                                                buscarCliente.val('');
                                                buscarProducto.focus();
                                            }
                                            else
                                            {
                                                modalCliente.attr('data-codCli',cod);
                                                modalCliente.modal('show');
                                            }
                                        }
                                        else
                                        {
                                            divMjeCliente.text("");
                                            divMjeCliente.append("Este cliente no dispone permiso de compra");
                                            divMjeCliente.fadeIn(5);
                                            divMjeCliente.fadeOut(6000);
                                        }
                                    }
                                    else
                                    {
                                        divMjeCliente.text("");
                                        divMjeCliente.append("Este cliente se encuentra inhabilitado, su fecha de psicotrópicos caduco");
                                        divMjeCliente.fadeIn(5);
                                        divMjeCliente.fadeOut(6000);
                                    }
                        })
                        .catch(function(){
                            console.log('ERROR BUSQUEDA CLIENTE POR CODIGO');
                        });

                    }
                }
                else
                {
                    divMjeCliente.text("");
                    divMjeCliente.append("No se puede modificar el cliente si existen productos cargados");
                    divMjeCliente.fadeIn(5);
                    divMjeCliente.fadeOut(6000);
                }
            };

            $scope.poneColorAgrup = function(idAgrup){
                if(idAgrup == 2)
                {
                    if(!AgrupCliInput.hasClass('colorAgrup'))
                        AgrupCliInput.addClass('colorAgrup');
                }
                else
                {
                    if(AgrupCliInput.hasClass('colorAgrup'))
                        AgrupCliInput.removeClass('colorAgrup');
                }

            };
            $scope.seleccionClienteModal = function(){
                modalCliente.modal('hide');
                var cod = modalCliente.attr('data-codCli');
                console.log(cod);
                    if(cod !== null)
                    {
                        $http.get(apiURL+"?a=get&t=cli&cod="+cod)
                            .then(function(resp){
                                    $scope.pedidoTemporal.Cliente = resp.data;
                                    buscarCliente.val('');
                                    buscarProducto.focus();
                            })
                            .catch(function(){
                                console.log('ERROR BUSQUEDA CLIENTE MODAL');
                            });

                    }
                    else
                        console.log('ERROR BUSQUEDA CLIENTE MODAL');
            };

            $scope.seleccionProducto = function(prod){
                if($scope.pedidoTemporal.Cliente !== undefined)
                {
                    divMjeProd.hide();
                    if(prod !== null)
                    {

                        $http.get(apiURL+"?a=get&t=prodma&cod="+prod)
                                .then(function(resp){
                                    $scope.productoTemporal = resp.data;

                                    $scope.poneColorRubro(resp.data.Rubro_Color);

                                    //Calculo precio_lista
                                    if($scope.productoTemporal.Precio_Moneda <= 0 && $scope.pedidoTemporal.id_Moneda == 1)
                                        $scope.productoTemporal.Precio_Lista = $scope.productoTemporal.Precio_Pesos;
                                    else if($scope.productoTemporal.Precio_Moneda <= 0 && $scope.pedidoTemporal.id_Moneda == 2)
                                        $scope.productoTemporal.Precio_Lista = $scope.productoTemporal.Precio_Pesos * $scope.pedidoTemporal.Valor_Moneda;
                                    else if($scope.productoTemporal.Precio_Moneda > 0 && ($scope.pedidoTemporal.id_Moneda == 2 && $scope.productoTemporal.id_Moneda == 2))
                                        $scope.productoTemporal.Precio_Lista = $scope.productoTemporal.Precio_Moneda;
                                    else if($scope.productoTemporal.Precio_Moneda > 0 && $scope.pedidoTemporal.id_Moneda == 2)
                                    {
                                        var precio = $scope.productoTemporal.Precio_Moneda / $scope.productoTemporal.Valor_Moneda;
                                        $scope.productoTemporal.Precio_Lista = precio * $scope.pedidoTemporal.Valor_Moneda;
                                    }
                                    else if($scope.productoTemporal.Precio_Moneda > 0 && $scope.pedidoTemporal.id_Moneda == 1)
                                        $scope.productoTemporal.Precio_Lista = $scope.productoTemporal.Precio_Moneda / $scope.productoTemporal.Valor_Moneda;


                                    //Calculo precio venta

                                    if($scope.productoTemporal.Tipo_Iva != "E")
                                        $scope.productoTemporal.Precio = parseFloat($scope.productoTemporal.Precio_Lista) + (parseFloat($scope.productoTemporal.Precio_Lista) * parseFloat($scope.pedidoTemporal.Cliente.Porcentaje_Iva) /100);
                                    else
                                        $scope.productoTemporal.Precio = $scope.productoTemporal.Precio_Lista;



                                    $filter('number')(parseFloat($scope.productoTemporal.Precio),3);
                                    $filter('number')(parseFloat($scope.productoTemporal.Precio_Lista),3);

                                    buscarProducto.val('');
                                    inputCantidad.focus();
                                })
                                .catch(function(){
                                    console.log("ERROR BUSQUEDA PRODUCTO POR CODIGO");
                                });
                    }
                }
                else
                {
                    divMjeProd.show();
                }
//                $scope.mostrarP = false;
//                if(prod !== null){
//                    $scope.productoTemporal = prod;
//                    $scope.mostrarP = false;
//                    inputCantidad.focus();
//                   }
            };


            $scope.poneColorRubro = function(color){
              if(color == "0")
              {
                  if(RubroProdInput.hasClass('produ_sedronar'))
                      RubroProdInput.removeClass('produ_sedronar');
                  if(RubroProdInput.hasClass('produ_sico'))
                      RubroProdInput.removeClass('produ_sico');

                  RubroProdInput.addClass('produ_normales');
              }
              else if(color == "1")
              {
                  if(RubroProdInput.hasClass('produ_normales'))
                      RubroProdInput.removeClass('produ_normales');
                  if(RubroProdInput.hasClass('produ_sico'))
                      RubroProdInput.removeClass('produ_sico');

                  RubroProdInput.addClass('produ_sedronar');
              }
              else if(color == "2")
              {
                  if(RubroProdInput.hasClass('produ_normales'))
                      RubroProdInput.removeClass('produ_normales');
                  if(RubroProdInput.hasClass('produ_sedronar'))
                      RubroProdInput.removeClass('produ_sedronar');

                  RubroProdInput.addClass('produ_sico');
              }
            };

            $scope.resetearFormulario = function(pedidoForm){
                $('input').val('').removeAttr('selected');
                formUp.slideUp();
                $scope.pedidoTemporal = {};
                $scope.pedidoTemporal.Generado_Por = "pedido";
                $scope.pedidoTemporal.id_Moneda = 1;
                $scope.pedidoTemporal.Productos = [];
                divMjeProd.hide();
                divMjeCliente.hide();
                pedidoForm.$setPristine();
                pedidoForm.$setUntouched();
            };

            $scope.changeRadio = function(){
                if($scope.pedidoTemporal.Nro_Pedido != undefined || $scope.pedidoTemporal.Cliente != undefined)
                    modalRadio.modal('show');

            };

            $scope.radioChangeSi = function(){
                var gen = $scope.pedidoTemporal.Generado_Por;
                $scope.pedidoTemporal = {};
                $scope.productoTemporal = {};
                modalRadio.modal('hide');

                $scope.pedidoTemporal.Generado_Por = gen;
                if($radioFR[0].checked)
                    $scope.pedidoTemporal.Id_Reparto = 45;
                else if($radioSF[0].checked)
                    $scope.pedidoTemporal.Id_Reparto = 227;

                return true;
            };

            $scope.radioChangeNo = function(){
                modalRadio.modal('hide');
                $scope.pedidoTemporal.Generado_Por = $scope.Generado_Por;

                if($scope.pedidoTemporal.Generado_Por == 0)
                {
                    if($radioFR.prop('checked'))
                        $scope.pedidoTemporal.Id_Reparto = 45;
                    else if($radioSF.prop('checked',true))
                        $scope.pedidoTemporal.Id_Reparto = 227;
                }
                else if($scope.pedidoTemporal.Generado_Por == "cotizacion")
                {
                    $radioCoti.prop('checked',true);
                }
                else if($scope.pedidoTemporal.Generado_Por == "presupuesto")
                {
                    $radioPresu.prop('checked',true);
                }
                else if($scope.pedidoTemporal.Generado_Por == "mostrador")
                {
                    $radioMostro.prop('checked',true);
                }

                return false;
            };

            $scope.buscaCotizacion = function(idMoneda){
                $scope.productoTemporal = {};
                if(idMoneda > 1)
                {
                    $http.get(apiURL+"?a=get&t=monedde&idMoneda="+idMoneda)
                        .then(function(resp){
                            console.log(resp);
                            $scope.pedidoTemporal.Valor_Moneda = resp.data.Valor_Moneda;
                        })
                        .catch(function(resp){
                            console.log(resp);
                        });
                }
                else
                    $scope.pedidoTemporal.Valor_Moneda = 1;

            }
        });
