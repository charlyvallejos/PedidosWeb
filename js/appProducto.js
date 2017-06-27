var apiURL = 'loadData.php';
var app = angular.module('appProducto', ['angularUtils.directives.dirPagination'])
    .controller('productosController',function($scope,$http){

        $scope.productos = [];
        $scope.productoTemporal = {};

        $scope.sort = function(keyname){
            $scope.sortKey = keyname;
            $scope.reverse = !$scope.reverse;
        };

        $scope.numXpag = 5;

        $scope.consultaProductos = function(){
            $http.get(apiURL+"?a=get&t=prodma")
                .then(function(resp){
                    $scope.productos = resp.data;
                })
                .catch(function(resp){
                    console.log(resp);
                });
        };
    });