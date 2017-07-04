var apiURL = 'loadData.php';
var mensjLog = $("#mensjLog");
var app = angular.module('appLogin', [])
    .controller('loginController',function($scope,$http,$window) {
        $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8;';
        $scope.Login = {};

        $scope.login = function(formLogin){
            if($.trim($scope.Login.Clave).length > 0 && $.trim($scope.Login.Usuario_Login).length > 0)
            {
                    if($scope.Login.Clave == "saporiti")
                    {
                        $http({
                            method:'POST',
                            url:apiURL+'?login&modif',
                            data:$.param($scope.Login),
                            headers:{'Content-Type':'application/x-www-form-urlencoded;charset=utf-8;'}
                        })
                            .then(function(resp){
                                if(resp.data) {
                                    $window.location.reload();
                                    console.log(resp.data);
                                    //mensjLog.html("<p>Ingrese una nueva contraseña</p>");
                                }
                                else
                                    console.log('manejar error');

                            })
                            .catch(function(resp){
                                console.log(resp);
                            });
                    }else
                    {
                        $http({
                            method:'POST',
                            url:apiURL+'?login',
                            data:$.param($scope.Login),
                            headers:{'Content-Type':'application/x-www-form-urlencoded;charset=utf-8;'}
                        })
                            .then(function(resp){
                                //console.log(resp);
                                if(resp.data)
                                    $window.location.reload();
                                else
                                    console.log('manejar error');

                            })
                            .catch(function(resp){
                                console.log(resp);
                            });
                    }

            }
        };

        $scope.logout = function(){
            $http({
                method:'POST',
                url:apiURL+'?logout',
                headers:{'Content-Type':'application/x-www-form-urlencoded;charset=utf-8;'}
            })
                .then(function(resp){
                    console.log($window.location.host);
                    $window.location.reload();
                })
                .catch(function(resp){
                    console.log(resp);
                });
        }

    });

