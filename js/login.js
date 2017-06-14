var apiURL = 'loadData.php';
var app = angular.module('appLogin', [])
    .controller('loginController',function($scope,$http,$window) {
        $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8;';
        $scope.Login = {};

        $scope.login = function(formLogin){
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
        };

        $scope.logout = function(){
            $http({
                method:'POST',
                url:apiURL+'?logout',
                headers:{'Content-Type':'application/x-www-form-urlencoded;charset=utf-8;'}
            })
                .then(function(resp){
                    $window.location.reload();
                })
                .catch(function(resp){
                    console.log(resp);
                });
        }

    });

