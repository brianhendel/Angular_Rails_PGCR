class Report < ApplicationRecord

    def createKillDetail(report)
        entries = report["Response"]["data"]["entries"]
		kill_types = ["HandCannon", "ScoutRifle", "PulseRifle", "AutoRifle", "FusionRifle", "Sniper", "SideArm", "Shotgun", "RocketLauncher", "Machinegun", "Sword", "Grenade", "Melee", "Super"]
        entry_array = [];
        entries.each_with_index do |entry, idx|
            entry_array.push(
                {:player => {
                :displayName => entry["player"]["destinyUserInfo"]["displayName"],
                :iconPath => entry["player"]["destinyUserInfo"]["iconPath"],
                :characterClass => entry["player"]["characterClass"],
                :lightLevel => entry["player"]["lightLevel"],
                :score => entry["player"]["lightLevel"], #NEED TO REPLACE THIS
                :team => entry["player"]["lightLevel"], #NEED TO REPLACE THIS
				:kills => {"total" => entry["extended"]["values"]["kills"]["basic"]["value"]}
			}})
			
			puts entry_array[idx]
			kill_types.each do |type|
				if entry["extended"]["values"]["weaponKills#{type}"].nil? 
					entry_array[idx][:player][:kills][type] = 0
				else
					entry_array[idx][:player][:kills][type] = entry["extended"]["values"]["weaponKills#{type}"]["basic"]["value"]	
				end
			end	
			
        end

        return entry_array
    end

    def getReport(activityId)
		report_url = "https://www.bungie.net/platform/Destiny/Stats/PostGameCarnageReport/#{activityId}"
		report_data_response = Unirest.get(report_url, headers:{'X-API-Key' => 'fbd958ef65034d4cad9fce1be14fbf29'})
		report_data = report_data_response.body
		
		report_detail = createKillDetail(report_data)
		return report_detail
	end


end
