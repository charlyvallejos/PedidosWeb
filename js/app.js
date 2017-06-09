
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
        btnEliminar = $('.eliminar');

    btnPlus.on('click',function(e){
        e.preventDefault();
        formUp.slideToggle();
    });

    var app = angular.module('appSapo', ['angularUtils.directives.dirPagination']) // aplicacion de angular

        .controller('pedidosController',function($scope,$http){ //controlador pedidos
            $scope.pedidos = [];
            $scope.pedidoTemporal = {};
            $scope.productoTemporal = {};
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
            $scope.numXpag = 2; //(default)
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
                $scope.pedidoTemporal = {
                    Nro_Pedido:ped.Nro_Pedido,
                    Fecha_Pedido:ped.Fecha_Pedido,
                    id_Cliente:ped.id_Cliente,
                    Codigo_Vendedor:ped.Codigo_Vendedor,
                    Nro_Cotizacion:ped.Nro_Cotizacion,
                    Nro_Presupuesto:ped.Nro_Presupuesto,
                    Id_Lista: ped.Id_Lista,
                    Id_Condicion:ped.Id_Condicion,
                    Id_Moneda:ped.Id_Moneda,
                    Cotizacion_Moneda:ped.Cotizacion_Moneda,
                    Estado:ped.Estado,
                    Id_Reparto:ped.Id_Reparto,
                    Nro_orden_compra:ped.Nro_orden_compra,
                    Id_Tomado_Por:ped.Id_Tomado_Por,
                    Id_Usuario:ped.Id_Usuario,
                    Fecha_Operacion:ped.Fecha_Operacion,
                    Id_Grupo_Cliente:ped.Id_Grupo_Cliente,
                    Total_Gravado:ped.Total_Gravado,
                    Total_Exento:ped.Total_Exento,
                    Total_Producto_Ex:ped.Total_Producto_Ex,
                    Porc_Iva_Ins:ped.Porc_Iva_Ins,
                    Iva_Ins:ped.Iva_Ins,
                    Porc_Iva_NoIns:ped.Porc_Iva_NoIns,
                    Iva_NoIns:ped.Iva_NoIns,
                    Porc_IngBr_Cba:ped.Porc_IngBr_Cba,
                    IngBr_Cba:ped.IngBr_Cba,
                    Porc_IngBr_Pba:ped.Porc_IngBr_Pba,
                    IngBr_Pba:ped.IngBr_Pba,
                    Total_Neto:ped.Total_Neto,
                    Descuento:ped.Descuento,
                    Id_Transporte:ped.Id_Transporte,
                    Generado_Por:ped.Generado_Por,
                    Porc_IngBr_Mis:ped.Porc_IngBr_Mis,
                    IngBr_Mis:ped.IngBr_Mis,
                    Productos:[],
                    Cliente:[]
                };


                //Traigo el detalle del pedido
                //Tambien traigo el cliente

                $http.get(apiURL+"?a=get&t=pedide&n="+ped.Nro_Pedido)
                    .then(function(resp){
                        $scope.pedidoTemporal.Productos = resp.data; ///////PEDID_DE
                        console.log(resp.data);
                        $http.get(apiURL+"?a=get&t=cli&idCli="+ped.id_Cliente)
                            .then(function(resp){
                                $scope.pedidoTemporal.Cliente = resp.data; ////////CLIEN_MA

                            })
                            .catch(function(resp){
                                console.log(resp);
                            })
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
//                $http.get(apiURL+"?a=get&t=prodma&idPro="+prod.id_producto)
//                        .then(function(resp){
//                            $scope.produ_ma = resp.data;
//                            $http.get(apiURL+"?a=get&t=prodfrac&idPro="+prod.id_Producto+"&idFrac="+prod.id_Fraccio)
//                                    .then(function(resp){
//                                        $scope.produ_frac = resp.data;
//                                    })
//                                    .catch(function(resp){
//                                        console.log(resp);
//                                    })
//                        })
//                        .catch(function(resp){
//                            console.log(resp);
//                        })
            };

            $scope.borraProductoGrilla = function(prodTemporal){
                $scope.index = $scope.pedidoTemporal.Productos.indexOf(prodTemporal);
                //borrar producto de la grilla..........
            };

            $scope.agregarProductoGrilla = function(event,prodTemporal){
                if(event.which === 13 )
                {
                    /*Si esta modificando, que despliegue y se posicione en Buscar*/
                    var encontrarProducto = $filter('filter')($scope.pedidoTemporal.Productos,{id_prod:prodTemporal.Id_Producto,id_fraccio:prodTemporal.Id_Fraccio},true)
                    if(encontrarProducto.length)
                    {

                    }/*Si esta agregando, que haga un push al array de grilla, despliegue y se posicione en Buscar*/
                    else
                    {
                        pedidoTemporal.Productos.push({
                            Nro_Pedido:prodTemporal.Nro_Pedido,
                            Id_Producto:prodTemporal.Id_Producto,
                            Id_Fraccio:prodTemporal.Id_Fraccio,
                            Cantidad:prodTemporal.Cantidad,
                            Estado:prodTemporal.Estado,
                            Codigo_Producto:prodTemporal.Codigo_Producto,
                            Descripcion_Producto:prodTemporal.Descripcion_Producto,
                            Fecha_Cotizacion:prodTemporal.Fecha_Cotizacion,
                            Nro_Cotizacion:prodTemporal.Nro_Cotizacion,
                            Nro_Despacho:prodTemporal.Nro_Despacho,
                            Nro_Lote:prodTemporal.Nro_Lote,
                            Precio:prodTemporal.Precio,
                            Precio_Lista:prodTemporal.Precio_Lista,
                            Renglon:prodTemporal.Renglon,
                            Rubro_Vta:prodTemporal.Rubro_Vta,
                            UmeVta:prodTemporal.UmeVta,
                            Id_Origen:prodTemporal.Id_Origen
                        })
                    }




                }
            };


            /////////////////////////////////////////
            // BUSCADOR DE CLIENTES
            $scope.clientes = [];
            $scope.clienteSeleccionado = [];
            
            $scope.consultaClienteDescripcion = function(des){
                //console.log(des);
                if(des !== ""){
                $http.get(apiURL+"?a=get&t=cli&des="+des)
                    .then(function(resp){
                        console.log(resp.data);
                        $scope.clientes = resp.data;
                        $scope.mostrarC = $scope.clientes.length > 0;
                    })
                    .catch(function(){
                        console.log("ERROR");
                    })
                }
                else
                {
                    $scope.mostrarC = false;
                }

            };

            $scope.seleccionCliente = function(clie){                
                console.log(clie);
                $scope.mostrarC = true;
                if(clie !== null){
                    $scope.pedidoTemporal.Cliente = clie;
                    $scope.mostrarC = false;
                }
            };
            
            ////////////////////////////////////////////////////////
            //BUSCADOR DE PRODUCTOS
            $scope.consultaProductoDescripcion = function(des){
                if(des !== ""){
                    $http.get(apiURL+"?a=get&t=prodma&des="+des)
                            .then(function(resp){
                                console.log(resp.data);
                                $scope.productos = resp.data;
                                $scope.mostrarP = $scope.productos.length > 0;
                            })
                            .catch(function(){
                                console.log("ERROR");
                             })                    
                }
                else
                {
                    $scope.mostrarP = false;
                }
            };
            
            $scope.seleccionProducto = function(prod){
                //console.log(prod);
                $scope.mostrarP = false;
                if(prod !== null){
                    $scope.productoTemporal = prod;
                    $scope.mostrarC = false;
                }
            }
            
            
            ///////////////////////////////////////////////////////
            
            $scope.resetearForm = function(pedidoForm){
                $('input').val('').removeAttr('checked').removeAttr('selected');
                formUp.slideUp();
                $scope.pedidoTemporal = {};
                pedidoForm.$setPristine();
                pedidoForm.$setUntouched();
            }

        });
