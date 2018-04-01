var webApp = angular.module('webApp', []); 
webApp.controller('webCtrl', ['$scope','$http', function ($scope, $http) {
        $scope.createUser = function(){ 
        	var $roles = $("input[type='hidden']").val(); // Insecure
        	var cls = "Users."+$roles;
        	var url = "http://194.177.21.52:57772/brs/form/object/user/reg";
            var dataObj = {
                Surname : $scope.surname,
                Name : $scope.name,
                Patronymic : $scope.patronymic,
                Login : $scope.login,
                Roles : $roles,
                Password : $scope.password
            }; 
            var res = $http.post(url, JSON.stringify(dataObj));
            res.success(function(data, status, headers, config) {
            var objId = data.Id;

 $('.regMessage').append("<div class='alert alert-success alert-dismissable'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Пользователь зарегистрирован!</div>");
            	$scope.Login='';
            	$scope.Password='';
            	$scope.Surname='';
            	$scope.Name='';
            	$scope.Birthday='';
            	$scope.Email='';
            });
            res.error(function(data, status, headers, config) {
   $('.regMessage').append("<div class='alert alert-danger alert-dismissable'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Произошла ошибка! Пользователь не был зарегистрирован!</div>");
            });            
    	};
}])