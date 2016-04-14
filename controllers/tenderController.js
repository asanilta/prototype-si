tesaApp.controller('tenderController',['$scope','$http', function($scope, $http) {
  var API = 'codeigniter/api/tender/';
  $http.get(API + 'get/all').success(function(data){
        $scope.tenders = data.content;
    }).error(function(data){
        alert("Error");
    });

    $scope.selectTender = function(index) {
      $scope.selectedTender = $scope.tenders[index];
      $('#pilih-tender').modal('hide');
    }

    $scope.toggle = function(modalstate, id) {
      $scope.dataForm.$setUntouched();
      $scope.error = "";
      $scope.modalstate = modalstate;
      switch (modalstate) {
        case 'add':
              $scope.form_title = "Tambah Tender Proyek Baru";
              $scope.tender = "";
              break;
          case 'edit':
              $scope.form_title = "Edit Data Tender Proyek";
              $http.get(API + 'get/' +id).success(function(data){
                    $scope.tender = data.content;
                }).error(function(data){
                    alert(data.error);
                });
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
                data: $.param($scope.tender),
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
                data: $.param($scope.tender),
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
      var isConfirmDelete = confirm('Apakah Anda yakin ingin menghapus data tender proyek ini?');
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
