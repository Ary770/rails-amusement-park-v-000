class RidesController < ApplicationController
  
  def create
    @ride = Ride.new(user: current_user, attraction: Attraction.find_by(id: params[:id]))
    @ride.save
    take_ride = @ride.take_ride
    if take_ride == true
      redirect_to user_path(current_user), notice: "Thanks for riding the #{@ride.attraction.name}!" 
    else
      redirect_to user_path(current_user), notice: take_ride
    end
  end
  
end
