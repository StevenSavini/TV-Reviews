class FavoritesController < ApplicationController

  def create
    @user = current_user
    @show = Show.find(params[:show_id])


    if  Favorite.create(user_id: @user, show_id: @show)
      flash[:notice] = "Show has been added to favorites"
      redirect_to root_path
    end
  end

end
