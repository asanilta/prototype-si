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

    $scope.bidangs = ["IT","Agrikultur","Tata Kota"];
    $scope.tims = [{"username":"asanilta","nama_lengkap":"Asanilta Fahda"},{"username":"vanya","nama_lengkap":"Vanya Deasy Safrina"}];

    $scope.selected_perusahaan = {"nama_perusahaan": "PT ABC","alamat":"Jalan ABC No. 123","telp":"022 7272727","email":"abc@abc.com","bidang":["IT", "Tata Kota"]};
    $scope.rekomendasi_perusahaan = {"nama_perusahaan": "PT DEF","alamat":"Jalan DEF No. 123","telp":"022 27272727","email":"def@def.com","bidang":["IT"]};
    $scope.rekomendasi_tenaga_ahli = {"id_ktp":"12345","nama_tenaga_ahli":"Asanilta Fahda","jenis_kelamin":"P","telp":"081219705514","bidang_keahlian":["IT"]};
    $scope.selected_tenaga_ahli = [{"nama_tenaga_ahli":"Vanya Deasy Safrina","jenis_kelamin":"P","telp":"08121111111","bidang_keahlian":["IT"]},{"nama_tenaga_ahli":"Asep","jenis_kelamin":"L","telp":"0812222222","bidang_keahlian":["Agrikultur"]}];
    $scope.rekomendasi_tender = [{"nama_tender":"Pekerjaan Blablabla","instansi_pengada":"Kemeterian Perdamaian","tim":["Asanilta Fahda","Vanya Deasy Safrina"],"bidang":["IT"]}];

    $scope.toggle = function(modalstate) {
      // $scope.dataForm.$setUntouched();
      $scope.error = "";
      $scope.modalstate = modalstate;
      switch (modalstate) {
        case 'add':
              $scope.form_title = "Tambah Tender Proyek Baru";
              $scope.tender = "";
              break;
          case 'edit':
              $scope.form_title = "Edit Data Tender Proyek";
              $scope.tender = $scope.selectedTender;
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
