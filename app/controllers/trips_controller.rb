class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:main]

  def main
    @trip = Trip.new
    # session[:trip] = nil
    @trip.posts.build
  end

  # def sub
  #   session[:title] = trip_params[:title]
  #   session[:prefecture] = trip_params[:prefecture]
  #   @trip = Trip.new
  #   @trip.posts.build
  # end

  # def done
  #   session[:title] = trip_params[:title]
  #   session[:prefecture] = trip_params[:prefecture]
  #   session[:text] = trip_params[:text]
  #   session[:image] = trip_params[:image]
  #   session[:time] = trip_params[:time]
  #   session[:place] = trip_params[:place]
  #   @trip = Trip.create(
  #   title: session[:title],
  #   prefecture: session[:prefecture],
  #   # text: session[:text],
  #   # image: session[:image],
  #   # time: session[:time],
  #   # place: session[:place],
  #  )
  #  if @trip.save!
  #   redirect_to "root"
  #  end
  #     render 'trips/sub'
  # end

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
    posts_attributes: [:title, :time, :place, :image, :text ,user_id: current_user.id]).merge(user_id: current_user.id)
  end
end
