var apiURL = 'loadData.php';
var panelUp = $('.ClienteConsulta');
var app = angular.module('appCliente', ['angularUtils.directives.dirPagination'])
    .controller('clientesController',function($scope,$http){

        $scope.clientes = [];
        $scope.clienteTemporal = {};

        $scope.sort = function(keyname){
            $scope.sortKey = keyname;
            $scope.reverse = !$scope.reverse;
        };

        $scope.numXpag = 5;

        $scope.consultaClientes = function(){
            $http.get(apiURL+"?a=get&t=cli")
                .then(function(resp){
                    $scope.clientes = resp.data;
                })
                .catch(function(resp){
                    console.log(resp);
                });
        };

        $scope.selectCliente = function (cli) {
            $scope.clienteTemporal = cli;

            //Capturo el indice del array pedidos que seleccione
            $scope.index = $scope.clientes.indexOf(cli);

            panelUp.slideDown();
        };
    });