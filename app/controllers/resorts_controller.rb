class ResortsController < ApplicationController
  def index
    if params[:slopes_length].present?
      @resorts = Resort.where('slopes_length > ?', 10)
    # elsif params[:favorites].present?
    #   raise
    #   if current_user.favorites.any?
    #     @resorts = current_user.favorites.resorts
    #   else
    #     flash.now[:alert] = "You don't have any favorite resorts yet!"
    #   end
    else
      @resorts = Resort.where.not(latitude: nil, longitude: nil)
    end
    map_maker(@resorts)
  end

  def map_maker(resorts)
    @markers = resorts.map do |resort|
      {
        lat: resort.latitude,
        lng: resort.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { resort: resort }),
        # image_url: helpers.asset_url('INSERT_FILE_FROM_ASSETS_HERE')
      }
    end
  end
end
