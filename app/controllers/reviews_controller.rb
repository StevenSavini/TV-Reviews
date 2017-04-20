class ReviewsController < ApplicationController

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



  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
    .merge(show: Show.find(params[:show_id]))
    .merge(user: User.find(current_user))
  end

end
