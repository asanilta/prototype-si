tesaApp.controller('tenderController',['$scope','$http', '$window','$cookies', function($scope, $http, $window,$cookies) {
  var API = 'codeigniter/api/tender/';
  var USER_API = 'codeigniter/api/user/';

  if ($cookies.getObject("user")==null) {
    $window.location.href = "#login";
    $cookies.putObject("selectedTender",null);
  } else {
    $scope.user = $cookies.getObject("user");
    if ($scope.user.role=="staf") {
      $scope.tenders = $scope.user.tender;
    } else {
      $http.get(API + 'get/all').success(function(data){
        $scope.tenders = data.content;
      });
    }
  }

  if ($cookies.getObject("selectedTender")!=null) {
      $scope.selectedTender = $cookies.getObject("selectedTender");
  }

    $scope.login = function(username) {
    $http.get(USER_API + 'get/' + username).success(function(data){
      $scope.user = data.content;
      if ($scope.user.role=="staf") {
        $scope.tenders = $scope.user.tender;
      } else {
        $http.get(API + 'get/all').success(function(data){
          $scope.tenders = data.content;
        });
      }
      $window.location.href = "#tender";
      $cookies.putObject("user",$scope.user);
    });
  }

  $scope.logout = function() {
    $scope.user = null;
    $cookies.putObject("user",null);
    $cookies.putObject("selectedTender",null);
    $window.location.href = "#login";
  }


  $http.get(USER_API + 'get/all').success(function(data){
    $scope.tims = data.content;
  });

    $scope.selectTender = function(id) {
      $http.get(API + 'get/' + id).success(function(data){
            $scope.selectedTender = data.content;
            $cookies.putObject("selectedTender",$scope.selectedTender);
        }).error(function(data){
            alert("Error");
        });
      $('#pilih-tender').modal('hide');
    }

    $scope.bidangs = ["IT","Agrikultur","Tata Kota"];

    // $scope.newTender.nama_tender = "Tes";

    // $scope.selected_perusahaan = {"nama_perusahaan": "PT ABC","alamat":"Jalan ABC No. 123","telp":"022 7272727","email":"abc@abc.com","bidang":["IT", "Tata Kota"]};
    // $scope.rekomendasi_perusahaan = {"nama_perusahaan": "PT DEF","alamat":"Jalan DEF No. 123","telp":"022 27272727","email":"def@def.com","bidang":["IT"]};
    // $scope.rekomendasi_tenaga_ahli = {"id_ktp":"12345","nama_tenaga_ahli":"Asanilta Fahda","jenis_kelamin":"P","telp":"081219705514","bidang_keahlian":["IT"]};
    // $scope.selected_tenaga_ahli = [{"nama_tenaga_ahli":"Vanya Deasy Safrina","jenis_kelamin":"P","telp":"08121111111","bidang_keahlian":["IT"]},{"nama_tenaga_ahli":"Asep","jenis_kelamin":"L","telp":"0812222222","bidang_keahlian":["Agrikultur"]}];
    // $scope.rekomendasi_tender = [{"nama_tender":"Pekerjaan Blablabla","instansi_pengada":"Kemeterian Perdamaian","tim":["Asanilta Fahda","Vanya Deasy Safrina"],"bidang":["IT"]}];

    $scope.toggle = function(modalstate) {
      // $scope.tenderForm.$setUntouched();
      $scope.error = "";
      $scope.modalstate = modalstate;
      switch (modalstate) {
        case 'add': {
              $scope.form_title = "Tambah Tender Proyek Baru";
              $scope.tender = "";
            } break;
          case 'edit': {
              $scope.form_title = "Edit Data Tender Proyek";
              $scope.tender = $scope.selectedTender;
            }  break;
          default:
            break;
      }
      $('#tenderModal').modal('show');
    }

    $scope.save = function() {
      $('#myModal').modal('hide');
      switch ($scope.modalstate) {
        case 'add':
          alert(JSON.stringify($scope.tender));
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
