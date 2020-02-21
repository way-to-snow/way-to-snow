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
      map_maker(@resorts)
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
    @question = Question.new
  end

  def update
    @resort = Resort.find(params[:resort_id])
    @question = Question.new(question_params)
    @question.resort = @resort
    @question.user = current_user
    if @question.save!
     redirect_to resort_path(@resort)
    else
     render 'resorts/show'
    end
end
  # def new_snow
  #   Resort.all.select do |resort|
  #     resort.weather_reports.order('date DESC').first.snow_change.positive?
  #   end
  # end
end

    # if params[:snow].present?
    #   @resorts = Resort.where('slopes_length > ?', 10)
    # elsif params[:favorites].present?
    #   @user.favorites.any? ? @resorts = @user.resorts : (redirect_to action: 'index')
    # else
    #   @resorts = Resort.where.not(latitude: nil, longitude: nil)
    # end

