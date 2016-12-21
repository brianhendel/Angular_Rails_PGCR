app.factory('player', [
		'$http',
		function ($http) {
			var p = {
				player: [],
				characters: []
			};

			p.getMemberData = function(gamertag) {
				$http.post('/players', {"player": { "gamertag": gamertag}})
				.then(function(response) {
					console.log(response.data)
					angular.copy(response.data, p.player)
				})

				
			};

			return p;
		}
	])