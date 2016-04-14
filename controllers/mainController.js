tesaApp.controller('mainController',['$scope','$http', function($scope, $http) {
  var TENDER_API = 'codeigniter/api/tender/';
  $http.get(TENDER_API + 'get/1').success(function(data){
        $scope.selectedTender = data.content;
    }).error(function(data){
        alert("Error");
    });
  $scope.username = "Siswanda Harso Sumarto";
}]);
