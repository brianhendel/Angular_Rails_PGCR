app.controller('MainCtrl', [
	'$scope',
	'$http',
	'player',
	'hash',
	function ($scope, $http, player, hash) {
		$scope.mainGt = "";
		$scope.memberData = player.player;
		$scope.hash = hash.hash
		$scope.activities = [];
		$scope.fireteam = [];

		$scope.setMainGt = function () {
			$scope.mainGtSet = true
			player.getMemberData($scope.mainGt);
		};

		$scope.selectActivity = function (activity) {
			$scope.selectedActivity = activity.activityId;
		};


		$scope.editFireteam = function (player) {
			if ($scope.fireteam.includes(player))
				return;
			else
				$scope.fireteam.push(player);
		};


	}
])