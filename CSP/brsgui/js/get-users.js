angular.element(document).ready(function() {
            angular.bootstrap(document, ['UiGridModule', 'UiSourceModule']);
        });

function ctrl($scope,$http) {
	var role = document.getElementsByTagName("input").role.value;
	console.log(role);
    // ������ GET � RESTful web API
   $http.get("http://194.177.21.52:57772/brs/form/objects/Users." + role + "/all").success(function(data) {
        // �������� ����� ������� � ���������� companie
        $scope.data = data.children;
        console.log($scope.data[0]);
   }).error(function(data, status) {
        // ����� ���������� �� ������, ���� ������� ���������
       alert("["+status+"]   ������ ��� �������� �������������!["+data+"]");
   });
   }