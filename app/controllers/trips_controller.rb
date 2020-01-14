class TripsController < ApplicationController
  before_action :move_to_index
  before_action :authenticate_user!, only: [:main]

  def main
    @trip = Trip.new
    # session[:trip] = nil
    @trip.posts.build
  end

  def create
    @trip= Trip.new(trip_params)
    if @trip.save!
      redirect_to root_path
    else 
      render "trips/main"
    end
  end

  def show
@trip = Trip.find(params[:id])
  end
  
  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
  end
  
  def trip_params
    params.require(:trip).permit(
    :prefecture,
    :title,
    posts_attributes: [:title, :time, :place, :image, :text ,user_id: current_user.id]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
  
end
