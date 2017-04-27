class VotesController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    user = current_user
    user_email = review.user
    vote = Vote.find_or_create_by(review: review, user: user)
    if params["button"] == "upvote" && vote.value < 1
      vote.value += 1
      review.total_votes += 1
      vote.save!
      review.save!
      ReviewMailer.review_email(user_email).deliver
    elsif params["button"] == "downvote" && vote.value > -1
      vote.value -= 1
      review.total_votes -= 1
      vote.save!
      review.save!
      ReviewMailer.review_email(user_email).deliver
    else
      flash[:alert] = "You can't #{params['button']} anymore!"
    end
    redirect_to show_path(review.show)
  end
end
