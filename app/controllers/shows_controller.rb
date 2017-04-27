class ShowsController < ApplicationController

  def show
    @show = Show.find(params[:id])
    @reviews = @show.reviews
  end

  def index
    @shows = Show.all
    @shows = if params[:search]
      Show.search(params[:search]).order("created_at DESC")
    else
      Show.all.order("created_at DESC")
    end
  end
end
