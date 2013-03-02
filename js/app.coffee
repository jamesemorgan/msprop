app = angular.module('msprop',[])

app.config( ($routeProvider) ->
	$routeProvider
	.when('/home', {templateUrl:"/partials/home.html"})
	.when('/about', {templateUrl:"/partials/about.html"})
	.when('/contact', {templateUrl:"/partials/contact.html"})
	.when('/testimonials', {templateUrl:"/partials/testimonials.html"})
	.when('/services', {templateUrl:"/partials/services.html"})
	.otherwise('/',{redirectTo:"/home"})
)

mainctrl = ($scope, $location) ->
	$scope.init = ->
		$location.path("/home")

	$scope.navigate = (page) ->
		$location.path("/#{page}")

context = exports ? this
context.app = app
context.mainctrl = mainctrl
