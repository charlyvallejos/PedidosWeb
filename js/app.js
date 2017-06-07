
    var apiURL = 'loadData.php';  // archivo en donde pasan los datos hacia las clases
    var app = angular.module('appSapo', ['angularUtils.directives.dirPagination']) // aplicacion de angular

        .controller('pedidosController',function($scope,$http){ //controlador pedidos
            $scope.pedidos = [];
            $scope.pedidoTemporal = {};
            //$scope.config = {headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}};

            //// Filtro de busqueda /////
            $scope.sort = function(keyname){
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            };

            /////// PAGINACION ///////////

            $scope.numXpag = 2;

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
                console.log("hola");
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
                $http.get(apiURL+"?a=get&t=ped_de&nro="+ped.Nro_Pedido)
                    .then(function(resp){
                        $scope.pedidoTemporal.Productos = resp.data;
                    })
                    .catch(function(resp){
                        console.log(resp);
                    });


                //Tambien traigo el cliente
                http.get(apiURL+"?a=get&t=cli&id="+ped.id_Cliente)
                    .then(function(resp){
                       $scope.pedidoTemporal.Cliente = resp.data;
                    })
                    .catch(function(resp){
                        console.log(resp);
                    });



                //Capturo el indice del array pedidos que seleccione
                $scope.index = $scope.pedidos.indexOf(ped);

                formUp.slideDown();
            };





            $scope.modificarPedido = function(form){

            }
        });


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
    btnEditar.on('click',function(e,pedido){
        e.preventDefault();
        console.log(pedido);
        formUp.slideToggle();
    });
    btnEliminar.on('click',function(e,pedido){
        e.preventDefault();
    });
