'use strict'

###*
 # @ngdoc function
 # @name treeviewHeidelbergApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the treeviewHeidelbergApp
###
angular.module('treeviewHeidelbergApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
