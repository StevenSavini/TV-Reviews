class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @show = Show.find(params[:show_id])
    binding.pry
    @user = User.find(current_user)
    if @review.save
      flash[:success] = "Review added successfully!"
      redirect_to show_path(@review.show)
    else
      flash[:error] = @review.errors.full_messages.join(". \n")
      render :new
    end
  end


  def new
    @show = Show.find(params[:show_id])
    @review = Review.new
  end



  private

  def review_params
    params.require(:review).permit(:title, :description, :rating).merge(show: Show.find(params[:show_id])).merge(user: User.find(current_user))
  end

end
