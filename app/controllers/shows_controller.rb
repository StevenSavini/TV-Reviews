class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def show
    @shows = Show.all
    @show = Show.find(params[:id])
    @reviews = @show.reviews
  end

end
