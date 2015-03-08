'use strict'

###*
 # @ngdoc function
 # @name treeviewHeidelbergApp.controller:HeidelbergtreeviewCtrl
 # @description
 # # HeidelbergtreeviewCtrl
 # Controller of the treeviewHeidelbergApp
###
angular.module('treeviewHeidelbergApp')
	.controller 'HeidelbergtreeviewCtrl', ($scope) ->
		$scope.machine = [
			{module: "A", parameter: "p1", fromDate: "20151031"},
			{module: "A", parameter: "p2", fromDate: "20151032"},
			{module: "A", parameter: "p1", fromDate: "20151033"}
		]

		getTreeView = (machine)->
			result = []
			moduleMap = {}
			for item in machine
				if !moduleMap[item.module]?
					moduleMap[item.module] = {}
			
				if !moduleMap[item.module][item.parameter]?
					moduleMap[item.module][item.parameter] = {}
				if !moduleMap[item.module][item.parameter][item.fromDate]?
					moduleMap[item.module][item.parameter][item.fromDate] = []
				moduleMap[item.module][item.parameter][item.fromDate].push item

			tree = []

			id = 0
			for module of moduleMap
				id++
				moduleOb = {
					id : id
					title: module
					items: []
				}
				for parameter of moduleMap[module]
					id++
					parameterOb = {
						id : id
						title: parameter
						items: []
					}
					

					for fromDate of moduleMap[module][parameter]
						id++
						fromDateObj = {
							id: id
							title: fromDate
							items: []
						}
						for item in moduleMap[module][parameter][fromDate]
							id++
							itemObjec = {
						  	id: id
						  	title: item.name
						  	items: []
						  }
						fromDateObj.items.push itemObjec
					parameterOb.items.push fromDateObj
				moduleOb.items.push parameterOb
			moduleOb

		$scope.nodes = getTreeView($scope.machine)




