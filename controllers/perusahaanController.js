tesaApp.controller('perusahaanController',['$scope','$http', function($scope, $http) {

  var API = 'codeigniter/api/perusahaan/';
  $http.get(API + 'get/all').success(function(data){
        $scope.perusahaans = data.content;
    }).error(function(data){
        alert(data.error);
    });
  $scope.bidangs = ["IT","Agrikultur","Tata Kota"];

  $scope.refresh = function() {
    $http.get(API + 'get/all').success(function(data){
          $scope.perusahaans = data.content;
      }).error(function(data){
          alert(data.error);
      });
  }
  $scope.toggle = function(modalstate, id) {
    $scope.dataForm.$setUntouched();
    $scope.error = "";
    $scope.modalstate = modalstate;
    switch (modalstate) {
      case 'add':
            $scope.form_title = "Tambah Data Perusahaan Mitra";
            $scope.perusahaan = "";
            break;
        case 'edit':
            $scope.form_title = "Edit Data Perusahaan Mitra";
            $http.get(API + 'get/' +id).success(function(data){
                  $scope.perusahaan = data.content;
              }).error(function(data){
                  alert(data.error);
              });
            break;
        default:
            break;
    }
    $('#myModal').modal('show');
  }

  $scope.save = function() {
    $('#myModal').modal('hide');
    switch ($scope.modalstate) {
      case 'add':
          $http({
              method: 'POST',
              url: API + 'insert',
              data: $.param($scope.perusahaan),
              headers: {'Content-Type': 'application/x-www-form-urlencoded',}
          }).success(function(data){
            $scope.successMessage = data.message;
            $scope.refresh();
            $('#successModal').modal('show');
          }).error(function(data){
              alert(data.message);
          });
          break;
      case 'edit':
          $http({
              method: 'POST',
              url: API + 'update',
              data: $.param($scope.perusahaan),
              headers: {'Content-Type': 'application/x-www-form-urlencoded',}
          }).success(function(data){
              $scope.successMessage = data.message;
              $scope.refresh();
              $('#successModal').modal('show');
          }).error(function(data){
              alert(data.message);
          });
          break;
      default:
          break;
    }
  }

  $scope.confirmDelete = function(id) {
    var isConfirmDelete = confirm('Apakah Anda yakin ingin menghapus record ini?');
        if (isConfirmDelete) {
          $http.get(API + 'delete/' + id).success(function(data){
              $scope.refresh();
          }).error(function(data){
              alert(data.error);
          });
        } else {
            return false;
        }
  }
}]);
