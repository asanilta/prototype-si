tesaApp.controller('tenderController',['$scope','$http', function($scope, $http) {
  var API = 'codeigniter/api/tender/';
  $http.get(API + 'get/all').success(function(data){
        $scope.tenders = data.content;
    }).error(function(data){
        alert("Error");
    });
}]);
