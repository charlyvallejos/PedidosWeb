
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
        modalRadio = $("#modalRadio");



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
        
    

    var app = angular.module('appSapo', ['angularUtils.directives.dirPagination','appLogin']) // aplicacion de angular

        .controller('pedidosController',function($scope,$http, $filter){ //controlador pedidos
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
                //console.log(ped);

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
                console.log($scope.index);
                /*si esta en la grilla lo borra, sino despliega el control de producto y se posiciona en buscar*/
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

                    /*Si esta modificando, que despliegue y se posicione en Buscar*/
                    var encontrarProducto = false;

                    if($scope.pedidoTemporal.Productos.length > 0)
                    {
                        console.log(prodTemporal);
                        encontrarProducto = $filter('filter')($scope.pedidoTemporal.Productos,{Id_Producto:prodTemporal.Id_Producto,Id_Fraccio:prodTemporal.Id_Fraccio})[0];
                    }

                    if(encontrarProducto)
                        $scope.pedidoTemporal.Productos.indexOf(encontrarProducto).cantidad = prodTemporal.Cantidad;
                       /*Si esta agregando, que haga un push al array de grilla, despliegue y se posicione en Buscar*/
                    else
                        $scope.pedidoTemporal.Productos.push(prodTemporal);

                    $scope.productoTemporal = null;
                    buscarProducto.val('');
                    buscarProducto.focus();
                    $scope.calculaTotal();

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
            
            $scope.seleccionCliente = function(cod){
                if($scope.pedidoTemporal.Productos == undefined || $scope.pedidoTemporal.Productos.length == 0){
                    divMjeCliente.hide();
                    if(cod !== null)
                    {
                        $http.get(apiURL+"?a=get&t=cli&cod="+cod)
                                .then(function(resp){
                                    if(CodVendedor === resp.data.Codigo_Vendedor)
                                    {
                                        $scope.pedidoTemporal.Cliente = resp.data;
                                        buscarCliente.val('');
                                        buscarProducto.focus();
                                    }
                                    else
                                    {
                                            modalCliente.attr('data-codCli',cod);
                                            modalCliente.modal('show');
                                    }
                        })
                                .catch(function(){
                                    console.log('ERROR BUSQUEDA CLIENTE POR CODIGO');
                        });

                    }
                }
                else
                {
                    divMjeCliente.show();
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
                                console.log(resp.data);
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
                                    //// aca es donde tendria q calcular bien elprecio del producto
                                    ///  segun como esta en
                                    $http.get(apiURL+"?a=get&t=listade&idPro="+$scope.productoTemporal.Id_Producto+"&idFrac="+$scope.productoTemporal.Id_Fraccio+"&idListaCa="+$scope.pedidoTemporal.Cliente.Id_Lista_Precio)
                                        .then(function(resp){
                                           $scope.productoTemporal.Precio_Lista = resp.data[0].Precio_Lista;
                                        });

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

            $scope.Precio_Producto = function(id_prod,id_frac,id_listaCa,idMoneda,id_cli){

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
                if($scope.pedidoTemporal.Nro_Pedido != undefined)
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
