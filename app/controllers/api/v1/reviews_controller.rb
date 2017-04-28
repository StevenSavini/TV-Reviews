class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy, :update]

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    show = Show.find(review_params['show_id'])
    review.user = current_user
    if review.save
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

  def update
    review = Review.find(params[:id])
    vote = Vote.find_or_create_by(user: current_user, review: review)
    user_email = review.user
    if params["vote"] == "up" && vote.value < 1
      vote.value += 1
      review.total_votes += 1
      vote.save!
      review.save!
      ReviewMailer.review_email(user_email).deliver
      render json: {
       status: 201,
       message: ("successfully voted on a review"),
       review: review
      }.to_json
    elsif params["vote"] == "down" && vote.value > -1
      vote.value -= 1
      review.total_votes -= 1
      vote.save!
      review.save!
      ReviewMailer.review_email(user_email).deliver
      render json: {
       status: 201,
       message: ("successfully voted on a review"),
       review: review
      }.to_json
    else
      render json: {
        status: 500,
        review: review
      }.to_json
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating, :show_id)
  end
end
