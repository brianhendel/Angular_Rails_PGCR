class Player < ApplicationRecord
    validates :gamertag, presence: true, uniqueness: true
	

    def getMemberId(gamertag)
        puts "Hit getMemberId method"
        membership_url = "https://www.bungie.net/platform/Destiny/1/Stats/GetMembershipIdByDisplayName/#{gamertag}"
		membership_data = Unirest.get(membership_url, headers:{'X-API-Key' => 'fbd958ef65034d4cad9fce1be14fbf29'})
		membership_id = membership_data.body["Response"]

		puts membership_id
		return membership_id
	end

	def getAcct(membership_id)
		acct_url = "https://www.bungie.net/platform/Destiny/1/Account/#{membership_id}/Summary"
		acct_data_response = Unirest.get(acct_url, headers:{'X-API-Key' => 'fbd958ef65034d4cad9fce1be14fbf29'})
		acct_data = acct_data_response.body
		
		return acct_data
	end

end

=begin
	def getCharIds(membership_id, char_num)
		account_url = "https://www.bungie.net/platform/Destiny/1/Account/#{membership_id}/Summary"
		account_data_response = Unirest.get(account_url, headers:{'X-API-Key' => 'fbd958ef65034d4cad9fce1be14fbf29'})
		account_data = account_data_response.body

		puts account_data

		charId_1 = account_data["Response"]["data"]["characters"][0]["characterBase"]["characterId"].to_i
		charId_2 = account_data["Response"]["data"]["characters"][1]["characterBase"]["characterId"].to_i
		charId_3 = account_data["Response"]["data"]["characters"][2]["characterBase"]["characterId"].to_i
    end
=end