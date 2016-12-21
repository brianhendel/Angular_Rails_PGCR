class ActivitiesController < ApplicationController

    def index
        respond_with Activity.all
    end

    def create
        respond_with Activity.create(act_params)
    end

    def show
        respond_with Activity.find(params[:activityId])
    end



    private
        def act_params
            params.require(:activity).permit(:activityId)
        end

end
