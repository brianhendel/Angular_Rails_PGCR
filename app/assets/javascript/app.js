var app = angular.module('pgcr', ['ui.router', 'templates'])

app.config([
	'$stateProvider',
	'$urlRouterProvider',
	function ($stateProvider, $urlRouterProvider) {
		$stateProvider
			.state('home', {
				url: '/home',
				templateUrl: 'home/_home.html',
				controller: 'MainCtrl'
			})

			.state('player', {
				url: '/player',
				templateUrl: 'players/_player.html',
				controler: 'PlayerCtrl',
			})

			.state('activity', {
				url: '/activity',
				templateUrl: 'activities/_activities.html',
				controller: 'ActivityCtrl',
			});

		$urlRouterProvider.otherwise('home'); 
	}])
