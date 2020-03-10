class ResortsController < ApplicationController
  before_action :validate_user

  def validate_user
    @user = current_user
  end

  def index
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
    if params[:recommended].present?
      @resorts = Resort.joins(:weather_reports, :forecasts)
        .where('weather_reports.snow_depth > ?', 50)
        .where(weather_reports: { current: true })
        .where(forecasts: { condition: ['good', 'great'] })
        .where('forecasts.forecast_day::date = ?', Date.today) # + 1.day
    elsif params[:favorites].present?
      @user.favorites.any? ? @resorts = @user.resorts : @resorts = Resort.all
    else
      @resorts = Resort.all
    end
      @markers = map_maker(@resorts)
      respond_to do |format|
        format.html
        format.json { render json:@markers }
      end
  end

  def map_maker(resorts)
    resorts.map do |resort|
      snow_depth = WeatherReport.where("resort_id = ? AND current = ?", resort, true)[0].snow_depth
      snow_change = WeatherReport.where("resort_id = ? AND current = ?", resort, true)[0].snow_change
      {
        lat: resort.latitude,
        lng: resort.longitude,
        conditions: resort.conditions,
        snowDepth: snow_depth,
        infoWindow: render_to_string(partial: "info_window", locals: { resort: resort, snow_depth: snow_depth, snow_change: snow_change }, formats: [:html])
        # uncomment below to add a custom image
        # image_url: helpers.asset_url('marker.svg')
      }
    end
  end

  def show
    @resort = Resort.find(params[:id])
    @question = Question.new
    @answer = Answer.new
  end
end

# OLD SEARCH QUERIES
  # if params[:new_snow].present?
  #   # OLD SNOW-JAPAN METHOD
  #   @resorts = Resort.joins(:weather_reports).where('weather_reports.snow_fall = ? AND current = ?', true, true)
  # elsif params[:lots_snow].present?
  #   @resorts = Resort.joins(:weather_reports).where('weather_reports.snow_depth > ? AND current = ?', 99, true)


