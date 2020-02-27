class ChartsController < ApplicationController
  def snow
    @weather = WeatherReport.group_by_day(:created_at).count
    render json: @weather
  end
end
