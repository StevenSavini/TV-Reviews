class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(favorite_params)
    @show = Show.find(params[:show_id])
    @user = User.find(current_user)
    if @favorite.save
      flash[:notice] = "Favorite added successfully!"
      redirect_to show_path(@favorite.show)
    else
      flash[:alert] = @favorite.errors.full_messages.join(". \n")
      render :new
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :show_id).merge(
    show: Show.find(params[:show_id])).merge(
    user: User.find(current_user)
    )
  end

end
