class PlayersController < ApplicationController   

    def index
        respond_with Player.all
    end
    
    def create
        puts "player create action hit"
        @player = Player.new(player_params)
        membership_id = @player.getMemberId(@player.gamertag)
        acct_data = @player.getAcct(membership_id)

        puts acct_data.to_json
        render json: acct_data
        
        
        #@player = Player.new(player_params)
        #@player.memberId = @player.getMemberId(@player.gamertag)
        #@player.charId_1 = @player.getCharIds(@player.memberId, 0)
        #@player.charId_2 = @player.getCharIds(@player.gamertag, 1)
        #@player.charId_2 = @player.getCharIds(@player.gamertag, 2)

        #@player.save
    end

    def show
        respond_with Post.find(params[:gamertag])
    end




    private
        def player_params
            params.require(:player).permit(:gamertag)
        end
end
