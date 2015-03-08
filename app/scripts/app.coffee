'use strict'

###*
 # @ngdoc overview
 # @name treeviewHeidelbergApp
 # @description
 # # treeviewHeidelbergApp
 #
 # Main module of the application.
###
angular
  .module('treeviewHeidelbergApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'angularTreeview'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .when '/treeview',
        templateUrl: 'views/treeview.html'
        controller: 'HeidelbergtreeviewCtrl'
      .otherwise
        redirectTo: '/'

