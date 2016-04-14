tesaApp.controller('tenagaAhliController',['$scope','$http', function($scope, $http) {

  var API = 'codeigniter/api/tenaga-ahli/';
  $http.get(API + 'get/all').success(function(data){
        $scope.tas = data.content;
    }).error(function(data){
        alert("Error");
    });
  //   $scope.tas = [
  //   {
  //     "nik": "5705b00a753357de12c8a84c",
  //     "nama": "Lori Williams",
  //     "jenis_kelamin": "female",
  //     "email": "loriwilliams@opportech.com",
  //     "telp": "+62 (941) 485-3171",
  //     "alamat": "366 Kansas Place, Calvary, Florida, 4647",
  //     "updated_at": "2015-06-25T02:13:57 -07:00",
  //     "bidang": [{"id":1,"nama":"IT"},{"id":2,"nama":"Agrikultur"}]
  //   },
  //   {
  //     "nik": "5705b00aac1134c4303163ab",
  //     "nama": "Latasha Fitzgerald",
  //     "jenis_kelamin": "female",
  //     "email": "latashafitzgerald@opportech.com",
  //     "telp": "+62 (801) 488-2847",
  //     "alamat": "646 Jackson Street, Chelsea, Hawaii, 8312",
  //     "updated_at": "2016-02-06T01:49:24 -07:00",
  //     "bidang": ""
  //   },
  //   {
  //     "nik": "5705b00a1a8d9b296bc8988a",
  //     "nama": "Juanita Justice",
  //     "jenis_kelamin": "female",
  //     "email": "juanitajustice@opportech.com",
  //     "telp": "+62 (812) 570-3455",
  //     "alamat": "758 Bedell Lane, Norwood, West Virginia, 5161",
  //     "updated_at": "2015-09-08T02:20:00 -07:00",
  //     "bidang": [{"id":1,"nama":"IT"},{"id":2,"nama":"Agrikultur"}]
  //   },
  //   {
  //     "nik": "5705b00a4b91db82020b82a5",
  //     "nama": "Michael Freeman",
  //     "jenis_kelamin": "female",
  //     "email": "michaelfreeman@opportech.com",
  //     "telp": "+62 (968) 401-2316",
  //     "alamat": "599 Grove Street, Noxen, American Samoa, 9644",
  //     "updated_at": "2015-05-01T06:43:40 -07:00",
  //     "bidang": [{"id":1,"nama":"IT"},{"id":2,"nama":"Agrikultur"}]
  //   },
  //   {
  //     "nik": "5705b00a247041c84e596418",
  //     "nama": "Harrington Colon",
  //     "jenis_kelamin": "male",
  //     "email": "harringtoncolon@opportech.com",
  //     "telp": "+62 (874) 435-3586",
  //     "alamat": "346 Rockaway Parkway, Bridgetown, Federated States Of Micronesia, 974",
  //     "updated_at": "2015-03-24T08:39:32 -07:00",
  //     "bidang": [{"id":1,"nama":"IT"},{"id":2,"nama":"Agrikultur"}]
  //   }
  // ];

  $scope.bidangs = [{"id":1,"nama":"IT"},{"id":2,"nama":"Agrikultur"},{"id":3,"nama":"Tata Kota"}];


  $scope.toggle = function(modalstate, id) {
    $scope.dataForm.$setUntouched();
    $scope.error = "";
    $scope.modalstate = modalstate;
    switch (modalstate) {
      case 'add':
            $scope.form_title = "Tambah Data Baru";
            $scope.ta = "";
            break;
        case 'edit':
            $scope.form_title = "Edit Data";
            break;
        default:
            break;
    }
    $('#myModal').modal('show');
  }

  $scope.save = function() {
    switch ($scope.modalstate) {
      case 'add':
      case 'edit':
          break;
      default:
          break;
    }
  }

  $scope.confirmDelete = function() {
    var isConfirmDelete = confirm('Apakah Anda yakin ingin menghapus record ini?');
        if (isConfirmDelete) {
            //dbService u/ delete
        } else {
            return false;
        }
  }
}]);
