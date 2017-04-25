class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @favorites = @user.favorites
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile picture saved successfully."
      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if current_user.admin?
      User.destroy(user.id)
      flash[:notice] = "User deleted."
    else
      flash[:alert] = "Error deleting user."
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,
                                 :avatar)
  end
end
