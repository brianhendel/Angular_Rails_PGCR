class ReportsController < ApplicationController

    def create
        puts "Report create action hit"
        @report = Report.new(report_params)
        report_detail = @report.getReport(@report.activityId)

        puts report_detail.to_json
        render json: report_detail
    end

    private
    def report_params
        params.require(:report).permit(:activityId)
    end

end
