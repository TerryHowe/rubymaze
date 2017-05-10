class RoomsController < ApplicationController
   def index
      @rooms = Room.all
   end

   def show
      @room = Room.find(params[:id])
   end

   def new
      @room = Room.new
   end

   def edit
      @room = Room.find(params[:id])
   end

   def create
      @room = Room.new(room_params)
      if @room.save
         redirect_to @room
      else
         render 'new'
      end
   end

   private
      def room_params
         params.require(:room).permit(:x, :y)
      end
end
