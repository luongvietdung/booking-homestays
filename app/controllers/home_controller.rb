# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @favorite_spaces = FavoriteSpace.newest
    @trends = Trend.includes(:rooms, :trend_rooms).newest
  end

  def show
    @favorite_space = FavoriteSpace.find(params[:id])
    @room_favorite_space = @favorite_space.rooms
                                          .includes(:price, :location, :room_images).page(params[:page]).per Settings.room_per
  end
end
