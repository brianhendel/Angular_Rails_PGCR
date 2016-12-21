.factory('activities', [
		'$http',
		function ($http) {
			var a = {
				activities: [
				]
			};

			a.getAll = function() {
				return $http.get('/activities.json').success(function(data) {
					angular.copy(data, a.activities)
				})
			}


			return a;
		}
	])




/*
app.factory('players', [
		function () {
			var p = {
				players: [
					{ gamertag: "LevBuyout", score: 4500, kills: 25, deaths: 10 },
					{ gamertag: "brehmsstrahlung", score: 4500, kills: 25, deaths: 10 },
					{ gamertag: "ShootEverything", score: 3500, kills: 18, deaths: 15 },
					{ gamertag: "TheUnclePappy", score: 3500, kills: 18, deaths: 15 },
					{ gamertag: "coredog007", score: 2000, kills: 12, deaths: 15 },
					{ gamertag: "UncleRofflemeyer", score: 2000, kills: 12, deaths: 15 }
				]
			};
			return p;
		}
	])

	.controller('KillStatsCtrl', [
		'$scope',
		'$stateParams',
		'players',
		function ($scope, $stateParams, players) {
			$scope.activity = activities.activities[$stateParams.activityId]

		}
	]);
					{ activityId: 1, mode: 31, mainScore: 3650, mainKills: 31, mainDeaths: 9, mainStanding: "Victory" },
					{ activityId: 2, mode: 31, mainScore: 4120, mainKills: 29, mainDeaths: 14, mainStanding: "Victory" },
					{ activityId: 3, mode: 31, mainScore: 3770, mainKills: 12, mainDeaths: 2, mainStanding: "Victory" },
					{ activityId: 4, mode: 31, mainScore: 5390, mainKills: 19, mainDeaths: 16, mainStanding: "Victory" },
					{ activityId: 5, mode: 31, mainScore: 2865, mainKills: 21, mainDeaths: 11, mainStanding: "Victory" },
					{ activityId: 6, mode: 31, mainScore: 4635, mainKills: 22, mainDeaths: 15, mainStanding: "Victory" }
	
	*/