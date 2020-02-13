class ResortsController < ApplicationController
  def index
    @resorts = Resort.where.not(latitude: nil, longitude: nil)

    @markers = @resorts.map do |resort|
      {
        lat: resort.latitude,
        lng: resort.longitude
      }
    end
  end
end
