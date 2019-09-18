# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :load_room, :load_area, :load_location, only: :show

  def index
    @q = Room.search(params[:searchroom])
    @rooms = @q.result(distinct: true).includes(:price, :location, :area).page(params[:page]).per(16)
    @key = params[:searchroom]["name_or_location_name_or_area_name_cont"]
  end

  def show
    @items = @location + @area + @room
    render json: @items.sort
  end

  private

  def load_location
    @location = Location.select(:name).where("name like '%#{params[:term]}%'").collect(&:name)
  end

  def load_area
    @area = Area.select(:name).where("name like '%#{params[:term]}%'").collect(&:name)
  end

  def load_room
    @room = Room.select(:name).where("name like '%#{params[:term]}%'").collect(&:name)
  end
end
