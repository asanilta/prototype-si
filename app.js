var tesaApp = angular.module('tesaApp',['ngRoute','ui.select','ngSanitize','ngCookies','ngFileUpload']);
tesaApp.config(['$routeProvider', function($routeProvider) {

       // $locationProvider.html5Mode(true);

       $routeProvider
           .when('/', {
             templateUrl : 'views/daftar-tender.html',
           })
           .when('/login', {
             templateUrl : 'views/login.html'
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
             templateUrl: 'views/dokumen.html',
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
