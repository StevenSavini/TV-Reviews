class ShowsController < ApplicationController

  def show
    @show = Show.find(params[:id])
    @reviews = @show.reviews.order("total_votes DESC")
    Show.average_rating_calc(@show)
  end

  def index
    @shows = Show.all
    @shows =
      if params[:search]
        Show.search(params[:search]).order("created_at DESC")
      else
        Show.all.order("created_at ASC")
      end
  end
end
