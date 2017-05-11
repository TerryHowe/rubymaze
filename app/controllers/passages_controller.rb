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
      @passage = Passage.new(passage_params)
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
