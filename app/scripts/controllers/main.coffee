'use strict'

###*
 # @ngdoc function
 # @name treeviewHeidelbergApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the treeviewHeidelbergApp
###
angular.module('treeviewHeidelbergApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
