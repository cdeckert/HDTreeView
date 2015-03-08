'use strict'

describe 'Controller: HeidelbergtreeviewCtrl', ->

  # load the controller's module
  beforeEach module 'treeviewHeidelbergApp'

  HeidelbergtreeviewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    HeidelbergtreeviewCtrl = $controller 'HeidelbergtreeviewCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
