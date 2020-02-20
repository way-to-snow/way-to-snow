class ResortsController < ApplicationController
  before_action :validate_user

  def validate_user
    @user = current_user
  end

  def index
    if params[:snow].present?
      @resorts = new_snow
    elsif params[:favorites].present?
      @user.favorites.any? ? @resorts = @user.resorts : @resorts = Resort.all
    else
      @resorts = Resort.all
      map_maker(@resorts)
    end
  end

  def map_maker(resorts)
    @markers = resorts.map do |resort|
      {
        lat: resort.latitude,
        lng: resort.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { resort: resort }),
        # uncomment below to add a custom image
        # image_url: helpers.asset_url('marker.svg')
      }
    end
  end

  def show
    @resort = Resort.find(params[:id])
  end

  def new_snow
    Resort.all.select do |resort|
      resort.weather_reports.order('date DESC').first.snow_change.positive?
    end
  end
end

    # if params[:snow].present?
    #   @resorts = Resort.where('slopes_length > ?', 10)
    # elsif params[:favorites].present?
    #   @user.favorites.any? ? @resorts = @user.resorts : (redirect_to action: 'index')
    # else
    #   @resorts = Resort.where.not(latitude: nil, longitude: nil)
    # end

