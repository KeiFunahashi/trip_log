class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:main]

  def main
    @trip = Trip.new
    session[:trip] = nil
    # 5.times{@trip.posts.build}
  end

  def sub
    session[:title] = trip_params[:title]
    session[:prefecture] = trip_params[:prefecture]
    session[:user_id] = trip_params[:user_id]
    @trip = Trip.new
    @trip.posts.build
  end

  def create
    @trip= Trip.new(
      title: session[:title],
      prefecture: session[:prefecture],
      user_id: session[:user_id],  
      # posts_attributes: [:id, :title, :time, :place, :image, :text]
)
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
