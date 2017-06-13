var apiURL = 'loadData.php';
var app = angular.module('appLogin', [])
    .controller('loginController',function($scope,$http) {

        $scope.Login = {};
        $scope.config = {headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}};

        $scope.login = function(formLogin){
            if(formLogin.Usuario_Login.$valid && formLogin.Clave.$valid){
                $http.post(apiURL+"?login",$scope.Login,$scope.config)
                    .then(function(resp){
                    if(resp.data)
                        $location.path('/PedidosWeb');
                    else
                    {

                    }
                })
            }
            else
            {

            }
        }
    });

