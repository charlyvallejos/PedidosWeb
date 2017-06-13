
    var apiURL = 'loadData.php';  // archivo en donde pasan los datos hacia las clases+

    //Variables jquery
    var btnInsertar = $("#insertar"),
        precarga = $("#precarga"),
        respuesta = $("#respuesta"),
        mostrar = $("#mostrar"),
        ajax = null;

    var formUp = $('.formData'),
        btnPlus = $('.agregar'),
        btnEditar = $('.editar'),
        btnEliminar = $('.eliminar'),
        clienteSeleccion = $("#clienteSeleccion"),
        productoSeleccion = $("#productoSeleccion"),
        inputCantidad = $("#CantProd"),
        divMjeCliente = $(".msgCliente"),
        divMjeProd = $(".msgProducto"),        
        buscarProducto = $("#buscarProducto");


    btnPlus.on('click',function(e){
        e.preventDefault();
        formUp.slideToggle();
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
           
            //$scope.config = {headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}};

            //// Para ordenar por nro pedido, fecha o cliente /////
            $scope.sort = function(keyname){
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            };

            /////// PAGINACION --- es para que puedan seleccionar q cantidad x pag///////////
            $scope.numXpag = 5; //(default)
            //////////////////////////////

            $scope.consultaPedidos = function(){
                $http.get(apiURL+"?a=get&t=ped")
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

                //Traigo el detalle del pedido
                //Tambien traigo el cliente

                $http.get(apiURL+"?a=get&t=pedide&n="+ped.Nro_Pedido)                    
                    .then(function(resp){
                        $scope.pedidoTemporal.Productos = resp.data; ///////PEDID_DE
                        console.log(resp.data);
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
                console.log($scope.productoTemporal);
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

                    if($scope.pedidoTemporal.Productos)
                       encontrarProducto = $filter('filter')($scope.pedidoTemporal.Productos,{Id_Producto:prodTemporal.Id_Producto,Id_Fraccio:prodTemporal.Id_Fraccio})[0];

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
                $scope.pedidoTemporal.Total_Gravado = $filter('number')($scope.pedidoTemporal.Total_Gravado,2);
                $scope.pedidoTemporal.Porc_Iva_Ins = $filter('number')($scope.pedidoTemporal.Porc_Iva_Ins,2);
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
                                $("#clienteSeleccion").attr('size', 5);
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

            $scope.seleccionCliente = function(clie){                
                //console.log(clie);
                $scope.mostrarC = true;
                if(clie !== null){
                    $scope.pedidoTemporal.Cliente = clie;
                    $scope.mostrarC = false;
                    buscarProducto.focus();
                }
            };
            
            ////////////////////////////////////////////////////////
            //BUSCADOR DE PRODUCTOS
            $scope.consultaProductoDescripcion = function(des){
                if($scope.pedidoTemporal.Cliente != null) {
                    divMjeProd.hide();
                    if(des !== ""){
                        $http.get(apiURL+"?a=get&t=prodma&des="+des)
                            .then(function(resp){
                                $scope.productos = resp.data;
                                $scope.mostrarP = $scope.productos.length > 0;
                                productoSeleccion.attr('size', 5);
                                //de ALGUNA manera se tiene q poder usar las PUTAS flechitas
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
            
            $scope.seleccionProducto = function(prod){
                //console.log(prod);
                $scope.mostrarP = false;
                if(prod !== null){
                    $scope.productoTemporal = prod;
                    $scope.mostrarP = false;
                    inputCantidad.focus();
                }
            };

            ///////////////////////////////////////////////////////
            $scope.resetearForm = function(pedidoForm){
                $('input').val('').removeAttr('checked').removeAttr('selected');
                formUp.slideUp();
                $scope.pedidoTemporal = {};
                $scope.pedidoTemporal.Productos = [];
                divMjeProd.hide();
                divMjeCliente.hide();
                pedidoForm.$setPristine();
                pedidoForm.$setUntouched();
            };

        });
