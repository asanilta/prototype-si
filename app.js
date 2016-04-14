var tesaApp = angular.module('tesaApp', ['ngRoute','ui.select','ngSanitize']);
tesaApp.config(['$routeProvider', function($routeProvider) {

       // $locationProvider.html5Mode(true);


       $routeProvider
           .when('/', {
             templateUrl : 'views/daftar-tender.html',
           })
           .when('/tender', {
             templateUrl : 'views/daftar-tender.html',
           })
           .when('/info-tender', {
             templateUrl : 'views/info-tender.html',
           })
           .when('/tenaga-ahli', {
             templateUrl : 'views/tenaga-ahli.html',
             controller : 'tenagaAhliController'
           })
           .when('/dokumen', {
             templateUrl: 'views/dokumen.html'
           })
           .when('/perusahaan-mitra', {
             templateUrl: 'views/perusahaan-mitra.html',
             controller : 'perusahaanController'
           })
           .when('/progres-tender', {
            templateUrl: 'views/progres.html',
            controller : 'progresController'
           });
   }]);

tesaApp.controller('tesaController', function ($scope, $http) {

    $http.get('api/tasks').success(function(data){
        $scope.tasks = data;
    }).error(function(data){
        $scope.tasks = data;
    });

    $scope.refresh = function(){
        $http.get('api/tasks').success(function(data){
            $scope.tasks = data;
        }).error(function(data){
            $scope.tasks = data;
        });
    }

    $scope.addTask = function(){
        var newTask = {title: $scope.taskTitle};
        $http.post('api/tasks', newTask).success(function(data){
            $scope.refresh();
            $scope.taskTitle = '';
        }).error(function(data){
            alert(data.error);
        });
    }

    $scope.deleteTask = function(task){
        $http.delete('api/tasks/' + task.id);
        $scope.tasks.splice($scope.tasks.indexOf(task),1);
    }

    $scope.updateTask = function(task){
        $http.put('api/tasks', task).error(function(data){
            alert(data.error);
        });
        $scope.refresh();
    }

});
