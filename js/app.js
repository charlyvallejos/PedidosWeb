
    var apiURL = 'loadData.php';  // archivo en donde pasan los datos hacia las clases
    var app = angular.module('appSapo', ['angularUtils.directives.dirPagination']) // aplicacion de angular

        .controller('pedidosController',function($scope,$http){ //controlador pedidos
            $scope.pedidos = [];
            $scope.CantidadPedidos = 0;
            $scope.pedidoSeleccionado = {};
            $scope.pedidoTemporal = {};
            //$scope.config = {headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}};

            //// Filtro de busqueda /////
            $scope.sort = function(keyname){
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            };


            //////////////////////////////


            /// PAGINACION //
            $scope.pagActual = 1;
            $scope.numXpag = 1;
            $scope.totalPaginas = Math.ceil($scope.CantidadPedidos / $scope.numXpag);
            $scope.inicio = ($scope.pagActual - 1) * $scope.numXpag;

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

            $scope.consultaPedidoLimitado = function(inicio,fin){
                //$scope.pedidos = [];
                $http.get(apiURL+"?a=get&t=ped&ini="+inicio+"&fin="+fin)
                    .then(function(resp){
                        $scope.pedidos = resp.data;
                    })
                    .catch(function(resp){
                        console.log(resp);
                    })
            };



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
