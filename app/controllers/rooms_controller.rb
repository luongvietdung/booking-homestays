# frozen_string_literal: true

class RoomsController < ApplicationController
  def show
    @rooms = []
    @room = Room.find params[:id]
    user = @room.user
    rooms = user.rooms.map(&:id).reject{|r| r == @room.id}
    rooms.each{|rooms| @rooms << Room.find(rooms)}
  end
end
