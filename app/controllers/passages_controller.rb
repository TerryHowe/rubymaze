class PassagesController < ApplicationController
   def index
      @passages = Passage.all
   end

   def show
      @passage = Passage.find(params[:id])
   end

   def new
      @passage = Passage.new
   end

   def edit
      @passage = Passage.find(params[:id])
   end

   def create
      @passage = Passage.new
      @passage.source = Room.find(params['passage']['source'])
      @passage.destination = Room.find(params['passage']['destination'])
      @passage.direction = params['passage']['direction'].to_i
      if @passage.save
         redirect_to @passage
      else
         render 'new'
      end
   end

   def update
      @passage = Passage.find(params[:id])
 
      if @passage.update(passage_params)
        redirect_to @passage
      else
        render 'edit'
      end
   end

   def destroy
      @passage = Passage.find(params[:id])
      @passage.destroy
      redirect_to passages_path
   end

   private
      def passage_params
         params.require(:passage).permit(:source, :destination, :direction)
      end
end
