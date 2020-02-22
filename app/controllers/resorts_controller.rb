class ResortsController < ApplicationController
  before_action :validate_user

  def validate_user
    @user = current_user
  end

  def index
    if params[:new_snow].present?
      @resorts = Resort.joins(:weather_reports).where('weather_reports.snow_change > ? AND current = ?', 0, true)
    elsif params[:lots_snow].present?
      @resorts = Resort.joins(:weather_reports).where('weather_reports.snow_depth > ? AND current = ?', 99, true)
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
      {
        lat: resort.latitude,
        lng: resort.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { resort: resort }, formats: [:html])
        # uncomment below to add a custom image
        # image_url: helpers.asset_url('marker.svg')
      }
    end
  end

  def show
    @resort = Resort.find(params[:id])
  end
end
