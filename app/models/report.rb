class Report < ApplicationRecord

    def createKillDetail(report)
        entries = report["Response"]["data"]["entries"]
		kill_types = ["HandCannon", "ScoutRifle", "PulseRifle", "AutoRifle", "FusionRifle", "Sniper", "SideArm", "Shotgun", "RocketLauncher", "Machinegun", "Sword", "Grenade", "Melee", "Super"]
        entry_array = []
        entries.each_with_index do |entry, idx|
            entry_array.push(
                {:player => {
                :displayName => entry["player"]["destinyUserInfo"]["displayName"],
                :iconPath => entry["player"]["destinyUserInfo"]["iconPath"],
                :characterClass => entry["player"]["characterClass"],
                :lightLevel => entry["player"]["lightLevel"],
				:score => entry["values"]["score"]["basic"]["value"],
				:team => entry["values"]["team"]["basic"]["displayValue"],
				:kills => {"total" => entry["extended"]["values"]["kills"]["basic"]["value"]}
			}})
			
			kill_types.each do |type|
				if entry["extended"]["values"]["weaponKills#{type}"].nil? 
					entry_array[idx][:player][:kills][type] = 0
				else
					entry_array[idx][:player][:kills][type] = entry["extended"]["values"]["weaponKills#{type}"]["basic"]["value"]	
				end
			end	

			entry_array[idx][:player][:kills][:primary] = entry_array[idx][:player][:kills]["HandCannon"] + entry_array[idx][:player][:kills]["ScoutRifle"] + entry_array[idx][:player][:kills]["PulseRifle"] + entry_array[idx][:player][:kills]["AutoRifle"]
			entry_array[idx][:player][:kills][:special] = entry_array[idx][:player][:kills]["FusionRifle"] + entry_array[idx][:player][:kills]["Sniper"] + entry_array[idx][:player][:kills]["SideArm"] + entry_array[idx][:player][:kills]["Shotgun"]
			entry_array[idx][:player][:kills][:heavy] = entry_array[idx][:player][:kills]["RocketLauncher"] + entry_array[idx][:player][:kills]["Machinegun"] + entry_array[idx][:player][:kills]["Sword"]
			entry_array[idx][:player][:kills][:ability] = entry_array[idx][:player][:kills]["Grenade"] + entry_array[idx][:player][:kills]["Melee"] + entry_array[idx][:player][:kills]["Super"]
			entry_array[idx][:player][:kills][:other] = entry_array[idx][:player][:kills]["total"] - entry_array[idx][:player][:kills][:primary] - entry_array[idx][:player][:kills][:special] - entry_array[idx][:player][:kills][:heavy] - entry_array[idx][:player][:kills][:ability]
        end
		puts entry_array
        return entry_array
    end

	def createTeamDetail(player_array, mainGt)
		#kill_types = ["HandCannon", "ScoutRifle", "PulseRifle", "AutoRifle", "FusionRifle", "Sniper", "SideArm", "Shotgun", "RocketLauncher", "Machinegun", "Sword", "Grenade", "Melee", "Super"]
		team_hash = {:player => {:kills => {}}, :alpha => {:kills => {}}, :bravo => {:kills => {}}, :names => ["Hand Cannon", "Scout Rifle", "Pulse Rifle", "Auto Rifle", "Fusion Rifle", "Sniper", "Sidearm", "Shotgun", "Rocket Launcher", "Heavy Machinegun", "Sword", "Grenade", "Melee", "Super", "Primary Total", "Special Total", "Heavy Total", "Ability Total", "Other Total"]}
			
			#{"HandCannon" => "Hand Cannon", "ScoutRifle" => "Scout Rifle", "PulseRifle" => "Pulse Rifle", "AutoRifle" => "Auto Rifle", "FusionRifle" => "Fusion Rifle", "Sniper" => "Sniper", "SideArm" => "Sidearm", "Shotgun" => "Shotgun", "RocketLauncher" => "Rocket Launcher", "Machinegun" => "Heavy Machinegun", "Sword" => "Sword", "Grenade" => "Grenade", "Melee" => "Melee", "Super" => "Super", :primary => "Primary Total", :special => "Special Total", :heavy => "Heavy Total", :ability => "Ability Total", :other => "Other Total"}}
		puts team_hash

		player_array.each_with_index do |player, idx|
			if player[:player][:displayName] == mainGt
				puts "Main player identified"
				player[:player][:kills].each_pair do |key, val|
					if team_hash[:player][:kills][key].nil?
						team_hash[:player][:kills][key] = 0
						team_hash[:player][:kills][key] += player[:player][:kills][key]
					else
						team_hash[:player][:kills][key] += player[:player][:kills][key]
					end
				end
			end
		end


		player_array.each_with_index do |player, idx|
			if player[:player][:team] == "Alpha"
				puts "Player on Alpha Team"
				player[:player][:kills].each_pair do |key, val|
					if team_hash[:alpha][:kills][key].nil?
						team_hash[:alpha][:kills][key] = 0
						team_hash[:alpha][:kills][key] += player[:player][:kills][key]
					else
						team_hash[:alpha][:kills][key] += player[:player][:kills][key]
					end
				end

			elsif player[:player][:team] == "Bravo"
				puts "Player on Bravo Team"
				player[:player][:kills].each_pair do |key, val|
					if team_hash[:bravo][:kills][key].nil?
						team_hash[:bravo][:kills][key] = 0
						team_hash[:bravo][:kills][key] += player[:player][:kills][key]
					else
						team_hash[:bravo][:kills][key] += player[:player][:kills][key]
					end
				end
			else
				puts "Non-standard team setup"
			end
		
		end
		puts team_hash
		return team_hash
	end

    def getReport(activityId, mainGt)
		report_url = "https://www.bungie.net/platform/Destiny/Stats/PostGameCarnageReport/#{activityId}"
		report_data_response = Unirest.get(report_url, headers:{'X-API-Key' => 'fbd958ef65034d4cad9fce1be14fbf29'})
		report_data = report_data_response.body
		
		report_detail = createKillDetail(report_data)
		team_detail = createTeamDetail(report_detail, mainGt)
		return team_detail
	end


end
