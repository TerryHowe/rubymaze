class MazeController < ApplicationController
  def maze
    @direction = params[:direction]
    @room = Room.where(x: params[:x].to_i, y: params[:y].to_i).first
  end
end
