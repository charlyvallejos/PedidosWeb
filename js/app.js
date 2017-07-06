
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
        AgrupCliInput = $("#AgrupCli");



    btnPlus.on('click',function(e){
        e.preventDefault();
        formUp.slideToggle();
    });
    

    buscarCliente.autocomplete({
            source: apiURL+"?cliente",
            select: function(event,ui){
               var codCliente = [];
               
               codCliente = ui.item.value.split('-');
               //console.log(codCliente[0]);
               angular.element($('#vistaPedidos')).scope().seleccionCliente(codCliente[0]);
            }                        
        });
        
     buscarProducto.autocomplete({
         source: apiURL+"?producto",
         select: function(event,ui){
               var codProducto = [];
               
               codProducto = ui.item.value.split('-');
               //console.log(codCliente[0]);
               angular.element($('#vistaPedidos')).scope().seleccionProducto(codProducto[0]);
            }
     });
        
    

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
            $scope.pedidoTemporal.Generado_Por = $scope.Generado_Por = "0";
            
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
                console.log(ped);

                //Traigo el detalle del pedido
                //Tambien traigo el cliente

                $http.get(apiURL+"?a=get&t=pedide&n="+ped.Nro_Pedido)                    
                    .then(function(resp){
                        $scope.pedidoTemporal.Productos = resp.data; ///////PEDID_DE
                        //console.log(resp.data);
                        $http.get(apiURL+"?a=get&t=cli&idCli="+ped.id_Cliente)
                            .then(function(resp){
                                $scope.pedidoTemporal.Cliente = resp.data; ////////CLIEN_MA
                                //console.log(resp.data);

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

                //console.log($scope.productoTemporal);
                /*
                $http.get(apiURL+"?a=get&t=prodma&idPro="+prod.id_producto)
                        .then(function(resp){
                            $scope.produ_ma = resp.data;
                            $http.get(apiURL+"?a=get&t=prodfrac&idPro="+prod.id_Producto+"&idFrac="+prod.id_Fraccio)
                                    .then(function(resp){
                                        $scope.produ_frac = resp.data;
                                    })
                                    .catch(function(resp){
                                        console.log(resp);
                                    });
                        })
                        .catch(function(resp){
                            console.log(resp);
                        });
                        */
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

                        var encontrarProducto = false;

                        if($scope.pedidoTemporal.Productos.length > 0)
                        {
                            encontrarProducto = $filter('filter')($scope.pedidoTemporal.Productos,{Id_Producto:prodTemporal.Id_Producto,Id_Fraccio:prodTemporal.Id_Fraccio})[0];
                        }

                        if(encontrarProducto)
                            $scope.pedidoTemporal.Productos.indexOf(encontrarProducto).cantidad = prodTemporal.Cantidad;
                        else
                        {
                            prodTemporal.Estado = "CAR";
                            $scope.pedidoTemporal.Productos.push(prodTemporal);
                        }

                        $scope.productoTemporal = null;
                        buscarProducto.val('');
                        buscarProducto.focus();
                        $scope.calculaTotal();
                    }
                }
            };

            $scope.calculaTotal = function(){
                $scope.pedidoTemporal.Total_Gravado = 0;
                angular.forEach($scope.pedidoTemporal.Productos,function(v,k){                    
                    $scope.pedidoTemporal.Total_Gravado += v.Cantidad * v.Precio;
                });

                $scope.Iva_IngBr = $scope.calculaIngBrutos($scope.pedidoTemporal.Cliente,$scope.pedidoTemporal.Productos);

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

                    $scope.pedidoTemporal.Total_Exento =  $scope.Iva_IngBr.Total_Prod_Exento;
                    $scope.pedidoTemporal.Porc_Cba = $scope.Iva_IngBr.Porc_Cba;
                    $scope.pedidoTemporal.IngBr_Cba = $scope.Iva_IngBr.IngBr_Cba;
                    $scope.pedidoTemporal.IngBr_Pba = $scope.Iva_IngBr.IngBr_Pba0 + $scope.Iva_IngBr.IngBr_Pba1;
                    $scope.pedidoTemporal.Porc_IngBr_Mis = $scope.Iva_IngBr.Porc_IngBr_Mis;
                    $scope.pedidoTemporal.IngBr_Mis = $scope.Iva_IngBr.IngBr_Mis;
                    $scope.pedidoTemporal.SubTotal = $scope.Iva_IngBr.SubTotal;
                    $scope.pedidoTemporal.Descuento = $scope.Iva_IngBr.Descuento;
                    $scope.pedidoTemporal.Total_Neto = $scope.Iva_IngBr.Total_Neto;

                }

            };

            $scope.calculaIngBrutos = function(cliente,productos){
                if(productos.length > 0){
                    //IVA y CM
                    //.....


                    //IVA
                    //......


                    //CALCULO DE IIBB
                    //......
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

//            $scope.seleccionCliente = function(clie){                
//                //console.log(clie);
//                $scope.mostrarC = true;
//                if(clie !== null){
//                    $scope.pedidoTemporal.Cliente = clie;
//                    $scope.mostrarC = false;
//                    buscarProducto.focus();
//                }
//            };

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
                    if(cod !== null)
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

            ////////////////////////////////////////////////////////
            //BUSCADOR DE PRODUCTOS
            $scope.consultaProductoDescripcion = function(des){
                if($scope.pedidoTemporal.Cliente !== null) {
                    divMjeProd.hide();
                    if(des !== ""){
                        $http.get(apiURL+"?a=get&t=prodma&des="+des)
                            .then(function(resp){
                                $scope.productos = resp.data;
                                $scope.mostrarP = $scope.productos.length > 0;
                                //productoSeleccion.attr('size', 5);
                                productoSeleccion.focus();
                            })
                            .catch(function(){
                                console.log("ERROR consultaProductoDescripcion");
                            });

                    }
                    else
                    {
                        $scope.mostrarP = false;
                    }
                }else
                {
                    divMjeProd.show();
                }
            };
            
//            $scope.seleccionProducto = function(prod){
//                //console.log(prod);
//                $scope.mostrarP = false;
//                if(prod !== null){
//                    $scope.productoTemporal = prod;
//                    $scope.mostrarP = false;
//                    inputCantidad.focus();
//                }
//            };
            
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

                                    //var Precio_Producto = $scope.calculaPrecioProducto($scope.pedidoTemporal.Cliente.Id_Lista_Precio,pedidoTemporal.Id_Moneda,$scope.pedidoTemporal.Cliente.id,$scope.productoTemporal);
                                    //console.log(Precio_Producto);

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

            $scope.calculaPrecioProducto = function(idLista,idMoneda,idCliente,producto){

                var Precio_Producto = null;

                var Lista_De = null;
                var Moned_De = null;
                var Moned_De_Costo = null;

                $http.get(apiURL+"?a=get&t=listade&idPro="+idProd+"&idFrac="+idFrac+"&idListaCa="+idLista)
                    .then(function(resp){
                        Lista_De  = resp.data;
                    });

                if(idMoneda == undefined || idMoneda == 0)
                    idMoneda = 1;

                if((idMoneda == producto.id_Moneda) && idMoneda != 1){
                    Precio_Producto.Costo = producto.Costo_MP * 1;
                    Precio_Producto.Precio_Lista = producto.Costo * Lista_De.Porcentaje;
                }
                else
                {
                    if(idMoneda == 1 || producto.id_Moneda == 1) {
                        $http.get(apiURL + "?a=get&t=monedde&idMoneda=" + 1)
                            .then(function (resp) {
                                Moned_De = resp.data;
                            });
                    }
                    if(idMoneda == 1){
                        Precio_Producto.Costo = producto.Costo_MP * Moned_De.Valor_Moneda;
                        Precio_Producto.Precio_Lista = (producto.Costo * Moned_De.Valor_Moneda) * Lista_De.Porcentaje;
                    }
                    else if(producto.id_Moneda == 1)
                    {
                        Precio_Producto.Costo = producto.Costo_MP / Moned_De.Valor_Moneda;
                        Precio_Producto.Precio_Lista = producto.Costo * Lista_De.Porcentaje;
                    }
                    else
                    {
                        //if()
                    }
                }







            };
///////////////truchisimo
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

            ///////////////////////////////////////////////////////
            $scope.resetearFormulario = function(pedidoForm){
                $('input').val('').removeAttr('selected');
                formUp.slideUp();
                $scope.pedidoTemporal = {};
                $scope.pedidoTemporal.Generado_Por = "0";
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
                modalRadio.modal('hide');
                $scope.pedidoTemporal.Generado_Por = gen;
                return true;
            };

            $scope.radioChangeNo = function(){
                modalRadio.modal('hide');
                $scope.pedidoTemporal.Generado_Por = $scope.Generado_Por;
                return false;
            }
        });
