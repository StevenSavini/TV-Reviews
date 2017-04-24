class ReviewsController < ApplicationController
  before_action :authorize_user

  def create
    @review = Review.new(review_params)
    @show = Show.find(params[:show_id])
    @user = User.find(current_user)
    if @review.save
      flash[:notice] = "Review added successfully!"
      redirect_to show_path(@review.show)
    else
      flash[:alert] = @review.errors.full_messages.join(". \n")
      render :new
    end
  end

  def new
    @show = Show.find(params[:show_id])
    @review = Review.new
  end

  def edit
    @show = Show.find(params[:show_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)

    if @review.save
      flash[:notice] = "Review successfully updated"
      redirect_to show_path(@review.show)
    else
      flash[:alert] = "Unable to update. There was an error"
      redirect_to edit_show_review_path(@review.show, @review)
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating).merge(
      show: Show.find(params[:show_id])).merge(
      user: User.find(current_user)
      )
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
