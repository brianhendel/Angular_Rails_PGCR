app.factory('report', [
		'$http',
		function ($http) {
			var r = {
				report: []
			};

			r.getReport = function(activityId) {
				$http.post('/reports', {"report": { "activityId": activityId}})
				.then(function(response) {
					console.log(response.data)
					angular.copy(response.data, r.report)
				})
			};
			return r;
		}
	])