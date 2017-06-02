var apiURL = "http://localhost:8080/pedidosWeb/";
var appCliente = angular.module('appCliente',[])

.controller('clienController',function($scope,$http){
    $scope.config = {headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}};
    $scope.clientes = {};
    $scope.traerClientes = function(){
        $http.get(apiURL+"controladorCliente.php")
            .then(function(response){
                $scope.clientes = response.data;
            })
    };
});

