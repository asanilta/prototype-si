tesaApp.controller('dokumenController',['$scope','$http', '$window','$cookies','Upload', function($scope, $http, $window,$cookies,Upload) {
  var API = 'codeigniter/api/dokumen/';

  if ($scope.currentDirectory==null) {
    if ($cookies.getObject("currentDirectory")==null) {
        openRoot();
    } else {
      $scope.currentDirectory = $cookies.getObject("currentDirectory");
    }
  }

  function openRoot() {
    $scope.openPath = {};
    $scope.openPath.letak_dokumen = "";
    $http({
        method: 'POST',
        url: API + 'get',
        data: $.param($scope.openPath),
        headers: {'Content-Type': 'application/x-www-form-urlencoded',}
    }).success(function(data){
      $scope.currentDirectory = {};
      $scope.currentDirectory.name = "Dokumen";
      $scope.currentDirectory.path = "./dokumen";
      $scope.currentDirectory.up_level = null;
      $scope.currentDirectory.contents = data.content;
    });

  }

  $scope.openDirectory = function(path) {
    if (path=="") {
      openRoot();
    } else {
      $scope.openPath.letak_dokumen = path.substr(10);
      $http({
          method: 'POST',
          url: API + 'get',
          data: $.param($scope.openPath),
          headers: {'Content-Type': 'application/x-www-form-urlencoded',}
      }).success(function(data){
          $scope.currentDirectory = {};
          $scope.currentDirectory.path = path;
          var temppath = path.substr(10,path.length-11);
          if (temppath.indexOf('/') > -1) {
            $scope.currentDirectory.name = temppath.substr(temppath.lastIndexOf('/'));
            $scope.currentDirectory.up_level = temppath.substr(0,path.lastIndexOf('/'));
          } else {
            $scope.currentDirectory.name = temppath;
            $scope.currentDirectory.up_level = "";
          }
          $scope.currentDirectory.contents = data.content;
          $cookies.putObject("currentDirectory",currentDirectory);
          $window.location.href = "#dokumen";
      });
    }
  }

  $scope.uploadFile = function(file) {
    Upload.upload({
           url: API+'upload',
           data: {file: file, 'username': $scope.user.username, 'letak_dokumen':'$scope.currentDirectory.letak_dokumen'/'$scope.nama_dokumen'}
    });
    $scope.refreshFolder();
  }

  $scope.newFolder = function(folderName) {
    $scope.folder ={};
    $scope.folder.nama_dokumen = folderName;
    $scope.folder.letak_dokumen = $scope.currentDirectory.path.substr(10);
    $scope.folder.username = $scope.user.username;
    $http({
        method: 'POST',
        url: API + 'newfolder',
        data: $.param($scope.folder),
        headers: {'Content-Type': 'application/x-www-form-urlencoded',}
    }).success(function(data){
        $scope.refreshFolder();
    });
  }

  $scope.refreshFolder = function () {
    $scope.openDirectory($scope.currentDirectory.path.substr(10));
  }
}]);
