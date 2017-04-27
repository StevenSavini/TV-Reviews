class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destory]

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    show = Show.find(review_params['show_id'])
    review.user = current_user
    if review.save
      flash[:notice] = "Review added successfully"
      review_to_send = {}
      review_to_send[:id] = review.id
      review_to_send[:title] = review.title
      review_to_send[:description] = review.description
      review_to_send[:rating] = review.rating
      review_to_send[:created_at] = review.created_at
      render json: {
       status: 201,
       message: ("successfully created a review"),
       review: review_to_send
      }.to_json
    else
      render json: {
        status: 500,
        error: review.errors
      }.to_json
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating, :show_id)
  end
end
