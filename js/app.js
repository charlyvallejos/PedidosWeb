
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
            $scope.mostrar = false;
            $scope.clientes = [];
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

                $http.get(apiURL+"?a=get&t=ped_de&nro="+ped.Nro_Pedido)
                    .then(function(resp){
                        $scope.pedidoTemporal.Productos = resp.data;
                        console.log(resp.data);
                    })
                    .catch(function(resp){
                        console.log(resp);
                    });



                //Capturo el indice del array pedidos que seleccione
                $scope.index = $scope.pedidos.indexOf(ped);

                //formUp.slideDown();
            };
            
            /////////////////////////////////////////
            // CLIEN_MA
            
            $scope.consultaClienteDescripcion = function(des){                
                //console.log(descri);
                $http.get(apiURL+"?a=get&t=cli&des="+des)
                    .then(function(resp){
                        //console.log(resp.data);
                        $scope.clientes = resp.data;
                        if($scope.clientes.length > 0)
                        {
                            $scope.mostrar = true;
                        }
                        else
                        {
                            $scope.mostrar = false;
                        }
                    })
                    .catch(function(){
                        console.log("ERROR");
                    })
            
            }
            
            $scope.seleccionCliente = function(clie){
                console.log(clie);
                $scope.mostrar = false;
                $scope.Razon_Social = clie;
                
            }
            
            
            
            /////////////////////////////////////////


        });


/*
 http.get(apiURL+"?a=get&t=cli&id="+ped.id_Cliente)
 .then(function(pepe){
 $scope.pedidoTemporal.Cliente = pepe.data;
 console.log(pepe.data);
 })
 .catch(function(resp){
 console.log(resp);
 });
 */
