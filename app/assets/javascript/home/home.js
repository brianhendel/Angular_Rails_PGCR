app.controller('MainCtrl', [
	'$scope',
	'$http',
	'player',
	'activities',
	'report',
	'hash',
	function ($scope, $http, player, activities, report, hash) {
		$scope.mainGt = null;
		$scope.charSet = null;
		$scope.actSet = null;
		$scope.memberData = player.player;
		$scope.hash = hash.hash
		$scope.activities = activities.activities;
		$scope.report = report.report;
		$scope.fireteam = [];

		$scope.setMainGt = function () {
			$scope.mainGtSet = true;
			player.getMemberData($scope.mainGt);
		};

		$scope.setChar = function (charId, membership_id) {
			$scope.charSet = true;
			console.log(charId)
			activities.getActivityData(charId, membership_id);
		}

		$scope.selectActivity = function (activity) {
			$scope.actSet = activity.activityDetails.instanceId;
			report.getReport(activity.activityDetails.instanceId);
		};

		$scope.editFireteam = function (player) {
			if ($scope.fireteam.includes(player))
				return;
			else
				$scope.fireteam.push(player);
		};
	}
])