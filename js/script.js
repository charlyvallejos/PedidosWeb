// Code goes here
var apiURL = 'loadData.php';
var myApp = angular.module('myApp', ['angularUtils.directives.dirPagination']);

function MyController($scope,$http) {

    $scope.currentPage = 1;
    $scope.pageSize = 10;
    $scope.pedidos = [];

    $scope.consultaPedidos = function(){
        $http.get(apiURL+"?a=get&t=ped")
            .then(function(resp){
                $scope.pedidos = resp.data;
            })
            .catch(function(resp){
                console.log(resp);
            })
    };
    $scope.consultaPedidos();
    $scope.pageChangeHandler = function(num) {
        console.log('meals page changed to ' + num);
    };
}

function OtherController($scope) {
    $scope.pageChangeHandler = function(num) {
        console.log('going to page ' + num);
    };
}

myApp.controller('MyController', MyController);
myApp.controller('OtherController', OtherController);/**
 * Created by noeliar on 06/06/2017.
 */
