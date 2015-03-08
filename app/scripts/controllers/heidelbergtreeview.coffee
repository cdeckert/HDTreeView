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
			{module: "B", parameter: "p2", fromDate: "20151032"},
			{module: "A", parameter: "p1", fromDate: "20151033"}
		]

		# factory... / service
		class Node
			constructor: (item, field)->
				@colapsed = true
				@label = item[field]
				@children = []

			push_back: (node)->
				@children.push node
		

		# 
		transform_to_map = (machine, fields...) ->

			temp = {}
			for field in fields
				temp[field] = {}

			for item in machine
				for field in fields
					temp[field][item[field]] = [] if !temp[field][item.field]? 
					temp[field][item[field]].push item
			temp
				

			#for item in machine
				


		getTreeView = (machine)->




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
					label: module
					children: []
					collapsed: true
				}
				for parameter of moduleMap[module]
					id++
					parameterOb = {
						id : id
						label: parameter
						children: []
						collapsed: true
					}
					

					for fromDate of moduleMap[module][parameter]
						id++
						fromDateObj = {
							id: id
							label: fromDate
							children: []
							collapsed: true
						}
						for item in moduleMap[module][parameter][fromDate]
							id++
							itemObjec = {
								id: id
								label: item.name
								children: []
								collapsed: true
							}
						fromDateObj.children.push itemObjec
					parameterOb.children.push fromDateObj
					moduleOb.children.push parameterOb
				tree.push moduleOb
			tree

		$scope.treedata = getTreeView($scope.machine)




