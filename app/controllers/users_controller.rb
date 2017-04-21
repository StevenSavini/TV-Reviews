class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if user_params["avatar"].class == String
      uploader = AvatarUploader.new
      uploader.store!(user_params["avatar"])
      @user.avatar = uploader.retrieve_from_store!(user_params["avatar"])
      @user.save
      redirect_to user_path(@user)
    elsif @user.update(user_params)
      flash[:notice] = "Profile picture saved successfully."
      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,
                                 :avatar)
  end
end
