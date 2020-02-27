class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end

  def create
    @resort = Resort.find(params[:resort_id])
    @favorite = current_user.favorites.find_or_create_by(resort: @resort)

    render json: { favorite: @favorite, count: @resort.favorites.count }
  end

  def destroy
    @resort = Resort.find(params[:resort_id])
    @favorite = current_user.favorites.find_by(resort: @resort)
    @favorite&.destroy

    render json: { deleted: !!@favorite, count: @resort.favorites.count }
  end

  private

  def favorite_params
    params.permit(:resort_id)
  end
end
