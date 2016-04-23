tesaApp.controller('tenagaAhliController',['$scope','$http', function($scope, $http) {
  var API = 'codeigniter/api/tenaga-ahli/';
  $http.get(API + 'get/all').success(function(data){
        $scope.tas = data.content;
    }).error(function(data){
        alert("Error");
    });

  $scope.refresh = function() {
    $http.get(API + 'get/all').success(function(data){
          $scope.tas = data.content;
      }).error(function(data){
          alert("Error");
      });
  }

  $scope.toggle = function(modalstate, id) {
    $scope.dataForm.$setUntouched();
    $scope.error = "";
    $scope.modalstate = modalstate;
    switch (modalstate) {
      case 'add':
            $scope.form_title = "Tambah Data Tenaga Ahli";
            $scope.ta = "";
            break;
        case 'edit':
            $scope.form_title = "Edit Data Tenaga Ahli";
            $http.get(API + 'get/' +id).success(function(data){
                  $scope.ta = data.content;
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
              data: $.param($scope.ta),
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
              data: $.param($scope.ta),
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
