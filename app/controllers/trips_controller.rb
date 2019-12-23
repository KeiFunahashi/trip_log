class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:main]

  def main
    @trip = Trip.new
    @trip.posts.build
    # 5.times{@trip.posts.build}
  end

  def sub
    @trip = Trip.new
    @trip.posts.new
  end

  def create
    @trip= Trip.new(trip_params)
    if @trip.save!
      redirect_to root_path
    else 
      render "trips/main"
    end
  end

  def trip_params
    params.require(:trip).permit(
    :prefecture,
    :title,
    posts_attributes: [:id, :title, :time, :place, :image, :text]).merge(user_id: current_user.id)
  end
end
