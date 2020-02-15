class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user = current_user
    @favorite.save
  end

  def destroy
  end

  private

  def favorite_params
    params.permit(:resort_id)
  end
end
