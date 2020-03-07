class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  @resorts = @user.favorites
  end
end
