class Activity < ApplicationRecord
	
    def getActivities(charId, membership_id)
		activity_url = "https://www.bungie.net/platform/Destiny/Stats/ActivityHistory/1/#{membership_id}/#{charId}/?mode=AllPvP"
		activity_data_response = Unirest.get(activity_url, headers:{'X-API-Key' => 'fbd958ef65034d4cad9fce1be14fbf29'})
		activity_data = activity_data_response.body
		
		return activity_data
	end

end
