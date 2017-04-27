class ReviewsController < ApplicationController
  before_action :authorize_user

  def create
    @review = Review.new(review_params)
    @show = Show.find(params[:show_id])
    @user = current_user
    if @review.save
      Show.average_rating_calc(@show)
      flash[:notice] = "Review added successfully!"
      redirect_to show_path(@review.show)
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

  def destroy
    review = Review.find(params[:id])
    @show = review.show
    if Review.destroy(review.id)
      flash[:notice] = "Your review has been deleted."
    else
      flash[:alert] = "Error deleting review."
    end
    redirect_to show_path(@show)
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    if @review.save
      Show.average_rating_calc(@show)
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
        user: current_user
      )
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
