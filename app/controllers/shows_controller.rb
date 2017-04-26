class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def show
    @show = Show.find(params[:id])
    @reviews = @show.reviews.order('total_votes DESC')
  end

end
