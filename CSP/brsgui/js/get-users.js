angular.element(document).ready(function() {
            angular.bootstrap(document, ['UiGridModule', 'UiSourceModule']);
        });

function ctrl($scope,$http) {
	var role = document.getElementsByTagName("input").role.value;
	console.log(role);
    // Запрос GET к RESTful web API
   $http.get("http://194.177.21.52:57772/brs/form/objects/Users." + role + "/all").success(function(data) {
        // Помещаем ответ сервера в переменную companie
        $scope.data = data.children;
        console.log($scope.data[0]);
   }).error(function(data, status) {
        // Вывод информации об ошибке, если таковая возникнет
       alert("["+status+"]   Ошибка при загрузки пользователей!["+data+"]");
   });
   }