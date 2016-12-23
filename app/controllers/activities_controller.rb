class ActivitiesController < ApplicationController

    def create
        puts "Activity create action hit"
        @activity = Activity.new(activity_params)
        activity_data = @activity.getActivities(@activity.charId, @activity.membership_id)

        puts activity_data.to_json
        render json: activity_data
    end

    private
    def activity_params
        params.require(:activity).permit(:charId, :membership_id)
    end

end
