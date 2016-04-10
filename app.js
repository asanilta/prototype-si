var tesaApp = angular.module('tesaApp', ['ngRoute','ui.select','ngSanitize']);
tesaApp.config(['$routeProvider', function($routeProvider) {

       // $locationProvider.html5Mode(true);


       $routeProvider
           .when('/', {
             templateUrl : 'views/tenaga-ahli.html',
             controller : 'tenagaAhliController'
           })
           .when('/tenaga-ahli', {
             templateUrl : 'views/tenaga-ahli.html',
             controller : 'tenagaAhliController'
           })
           .when('/dokumen', {
             templateUrl: 'views/dokumen.html'
           })
   }]);
