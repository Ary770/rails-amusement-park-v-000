class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end
  
  def show
    @attraction = set_attraction
    @ride = Ride.new(user: current_user, attraction: @attraction)
  end
  
  def edit
    @attraction = set_attraction
  end
  
  def update
    if current_user.admin
      @attraction = set_attraction
      @attraction.update(attraction_params)
      redirect_to @attraction
    else
      redirect_to attractions_path
    end
  end
  
  def new
    @attraction = Attraction.new
  end
  
  def create
    if current_user.admin
      @attraction = Attraction.new(attraction_params)
      @attraction.save
      redirect_to @attraction
    else
      redirect_to attractions_path
    end
  end
  
  private
    def set_attraction
      Attraction.find_by(id: params[:id])
    end
    
    def attraction_params
      params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
    end
  
end
 