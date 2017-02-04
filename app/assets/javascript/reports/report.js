app.factory('report', [
		'$http',
		function ($http) {
			var r = {
				report: []
			};

			r.getReport = function(activityId, mainGt) {
				$http.post('/reports', {"report": { "activityId": activityId, "mainGt": mainGt}})
				.then(function(response) {
					console.log(response.data)
					angular.copy(response.data, r.report)
				})
			};
			return r;
		}
	])