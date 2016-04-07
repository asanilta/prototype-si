var tesaApp = angular.module('tesaApp', [require('angular-route'),'ui.select','ngSanitize']);
tesaApp.config(['$routeProvider', function($routeProvider) {
       $routeProvider
           .when('/', {
             templateUrl : 'tenaga-ahli.html',
             controller : 'tenagaAhliController'
           })
           .when('/tenaga-ahli', {
             templateUrl : 'tenaga-ahli.html',
             controller : 'tenagaAhliController'
           });
   }]);
