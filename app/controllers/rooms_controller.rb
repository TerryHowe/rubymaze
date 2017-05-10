class RoomsController < ApplicationController
   def index
      @rooms = Room.all
   end

   def show
      @room = Room.find(params[:id])
   end

   def new
   end

   def create
      @room = Room.new(room_params)
      @room.save
      redirect_to @room
   end

   private
      def room_params
         params.require(:room).permit(:x, :y)
      end
end
