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

app.directive('navpill', ($location) ->
	{
		restrict: 'E',
		template: """<li class="{{active}}"><a ng-click="navigate('{{page}}')">{{label}}</a></li>""",
		replace : true,
		scope: {page: '@', label: '@'},
		controller: ($scope, $element, $attrs) ->
			$scope.active = if $location.path().search($attrs.page) isnt -1 then 'active'  else ''
	}
)

mainctrl = ($scope, $location) ->
	$scope.init = ->
		$location.path($location.path())

	$scope.navigate = (page) ->
		$location.path("/#{page}")

context = exports ? this
context.app = app
context.mainctrl = mainctrl
