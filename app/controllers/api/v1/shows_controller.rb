class Api::V1::ShowsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @reviews = []
    Show.find(params[:id]).reviews.each do |review|
      review_to_send = {}
      review_to_send[:id] = review.id
      review_to_send[:title] = review.title
      review_to_send[:description] = review.description
      review_to_send[:rating] = review.rating
      review_to_send[:total_votes] = review.total_votes
      @reviews << review_to_send
    end
    render json: { reviews: @reviews }
  end
end
