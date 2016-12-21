app.service('hash', [
		function () {
			var h = {
                class: [
                    {"0" : "Titan"},
                    {"1" : "Hunter"},
                    {"2" : "Warlock"}  
                ],

                gender: [
                    {"0" : "Male"},
                    {"1" : "Female"}                    
                ]
			};

			return h;
		}
	])