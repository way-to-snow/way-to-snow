class ResortsController < ApplicationController
  before_action :validate_user

  def validate_user
    @user = current_user
  end

  def index
    if params[:best].present?
      @resorts = Resort.joins(:weather_reports, :forecasts)
        .where(weather_reports: { current: true })
        .where(forecasts: { condition: ['good', 'great'] })
        .where('forecasts.forecast_day::date = ?', Date.today) # + 1.day
    elsif params[:favorites].present?
      @user.favorites.any? ? @resorts = @user.resorts : @resorts = Resort.all
    else
      @resorts = Resort.all
    end
    @resorts = @resorts.includes(:weather_reports, :forecasts, :favorites).where("current = ?", true).references(:weather_reports)
    @markers = map_maker(@resorts)
    respond_to do |format|
      format.html
      format.json { render json:@markers }
    end
  end

  def map_maker(resorts)
    resorts.map do |resort|
      snow_depth = resort.weather_reports[0].snow_depth
      {
        lat: resort.latitude,
        lng: resort.longitude,
        conditions: resort.conditions,
        infoWindow: render_to_string(partial: "info_window", locals: { resort: resort, snow_depth: snow_depth }, formats: [:html])
      }
    end
  end

  def show
    @resort = Resort.find(params[:id])
    @question = Question.new
    @answer = Answer.new
  end
end

# REMOVED CODE FOR FILTERING WITH JSON...
# '?date=0&condition=good'
# @resorts = Resort.joins(:weather_reports, :forecasts)
# if(params[:date])
#   date = Date.today + params[:day].to_i.days
#   @resorts = @resorts.where('forecasts.forecast_day::date = ?', date )
# end
# if(condition = params[:condition])

#   @resorts = @resorts.where(forecasts: { condition: condition })
#     if (%w(good great).include?(condition))
#       @resorts = @resorts.where('weather_reports.snow_depth > ?', 50)
#     end
# end
