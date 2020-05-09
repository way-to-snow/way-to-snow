class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def ticket
    @resort = Resort.find(params[:id])
  end

  def share
    @resort = Resort.find(params[:id])
  end

  def itinerary
    @resort = Resort.friendly.find(params[:id])
  end
end
