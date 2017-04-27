class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def show
    @show = Show.find(params[:id])
    @reviews = @show.reviews
  end

  def index
  @shows = Show.all
  if params[:search]
    @shows = Show.search(params[:search]).order("created_at DESC")
  else
    @shows = Show.all.order("created_at DESC")
  end
end

end
