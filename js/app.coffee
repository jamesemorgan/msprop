app = angular.module('msprop',[])

app.config( ($routeProvider) ->
	$routeProvider
		.when('/home', {templateUrl:"/partials/home.html"})
		.when('/about', {templateUrl:"/partials/about.html"})
		.otherwise('/',{redirectTo:"/home"})
)

mainctrl = ($scope, $location) ->
	$scope.init = ->
		$location.path("/home")

context = exports ? this
context.app = app
context.mainctrl = mainctrl
