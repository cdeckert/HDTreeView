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
			{module: "A", parameter: "p1", fromDate: "20151031", id: "123"},
			{module: "A", parameter: "p2", fromDate: "20151032", id: "234"},
			{module: "A", parameter: "p1", fromDate: "20151033", id: "456"}
		]

		# factory... / service
		class Node
			constructor: (@label)->
				@children = []
				@colapsed = true

			push_back: (node)->
				@children.push node
		


		# 
		transform_to_map = (machine) ->
			result = {}
			for item in machine
				module = item["module"]
				parameter = item["parameter"]
				fromDate = item["fromDate"]
				result[module] = {} if !result[module]?
				result[module][parameter] = {} if !result[module][parameter]?
				result[module][parameter][fromDate] = [] if !result[module][parameter][fromDate]?
				result[module][parameter][fromDate].push item
			result

		getTreeView = (machine)->

			maped_items = transform_to_map(machine)

			result = []

			for module_key of maped_items
				module = new Node(module_key)
				module_item = mapped_items[module_key

				for parameter_key of module_item
					parameter = new Node(parameter_key)
					parameter_item = module_item[parameter_key]

					for fromDate_key of parameter_item
						fromDate = new Node(fromDate_key)
						fromDate_item = parameter_item[fromDate_key]

					#	for fromDate_record in fromDate_item
					#		fromDate.push_back(new Node(fromDate_record.id))



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
			moduleOb

		$scope.treedata = [getTreeView($scope.machine)]




