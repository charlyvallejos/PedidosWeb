var apiURL = 'loadData.php';
var app = angular.module('appCliente', ['angularUtils.directives.dirPagination'])
    .controller('clientesController',function($scope,$http){
        $scope.clientes = [];

        $scope.sort = function(keyname){
            $scope.sortKey = keyname;
            $scope.reverse = !$scope.reverse;
        };

        $scope.numXpag = 5;

        $scope.consultaClientes = function(){
            $http.get(apiURL+"?a=get&t=cli")
                .then(function(resp){
                    console.log(resp.data);
                    $scope.clientes = resp.data;
                })
                .catch(function(resp){
                    console.log(resp);
                });
        };
    });