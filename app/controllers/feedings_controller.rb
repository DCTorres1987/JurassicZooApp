class FeedingsController < ApplicationController
    def new
        @dinosaurs = Dinosaur.all
        @feeding = Feeding.new(user_id: params[:user_id])         
        @time_now = Time.now.to_s(:long).to_datetime
        @fed = Feeding.where(["user_id = ?", params[:user_id]]).order("created_at DESC").group(:dinosaur_id)
     
        
    end 

    def create
        @feeding = Feeding.create(feeding_params)
    
        if @feeding.save
            redirect_to user_feedings_path( @feeding.user_id)
        else 
            render :new
        end 
    end 

    def index
        @user = current_user
    end 

    private

      

    def feeding_params

        params.require(:feeding).permit(:sustenance, :user_id, :dinosaur_id )
    end 
end
