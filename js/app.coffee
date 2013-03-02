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
			
			## Your scopes are not in order, I think the scope of this directive measn your outer parent scope isnt called
			$scope.navigate = (page) ->
				## Invoke your parent scopes method
				$scope.$parent.navigate(page)
				## I was thinkg you could also use $scope.$emit and then cancel this event in your parent scope 
				## if you didnt want to tightly couple your directive to and controller 
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
