
    var apiURL = 'loadData.php';  // archivo en donde pasan los datos hacia las clases
    var app = angular.module('appSapo', ['angularUtils.directives.dirPagination']) // aplicacion de angular
        .filter('ceil',function(){  //filtro para hacerle la funcion ceil
            return function(input){
                return Math.ceil(input);
            };
        })
        .controller('pedidosController',function($scope,$http){ //controlador pedidos
            $scope.CantidadPedidos = 0;
            $scope.pedidos = [];
            $scope.pedidoSeleccionado = {};
            $scope.pedidoTemporal = {};
            $scope.config = {headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}};


            /// PAGINACION //

            $scope.pagActual = 1;
            $scope.itemsPerPage = 2

            //////////////////////////////


            $scope.consultaPedidos = function(){
                $http.get(apiURL+"?a=get&t=ped")
                    .then(function(resp){
                        //$scope.CantidadPedidos = resp.data.length;
                    })
                    .catch(function(resp){
                        console.log(resp);
                    })
            };

            $scope.consultaPedidoLimitado = function(pagActual){
                $scope.pedidos = [];
                $http.get(apiURL+"?a=get&t=ped&ini="+$scope.itemsPerPage+"&fin="+pagActual)
                    .then(function(resp){
                        $scope.pedidos = resp.data;
                        console.log($scope.pedidos);
                        $scope.CantidadPedidos = resp.data == null ? 0 : resp.data.length;
                        console.log($scope.CantidadPedidos);
                    })
                    .catch(function(resp){
                        console.log(resp);
                    })
            };

            $scope.consultaPedidoLimitado($scope.pagActual);

            $scope.consultaPedidoNro = function(nro){
                $http.get(apiURL+"?a=get&t=ped&nro="+nro)
                    .then(function(resp){
                        console.log(resp.data);
                    })
                    .catch(function(resp){
                        console.log("ERROR");
                    })
            };
            $scope.modificarPedido = function(form){

            }
        });
