class MazeController < ApplicationController
  def show
    @direction = params[:direction]
    @room = Room.where(x: params[:x].to_i, y: params[:y].to_i).first
  end
end
