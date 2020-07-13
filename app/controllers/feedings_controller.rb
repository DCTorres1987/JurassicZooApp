class FeedingsController < ApplicationController
    before_action :require_login

    def new
        redirect_if_not_employed
        @feeding = Feeding.new(user_id: params[:user_id])   

    end 

    def create
        #creates record from params and save to instance variable
        #if record is saved it will redirect to index page
        @feeding = Feeding.create(feeding_params)
    
        if @feeding.save
            redirect_to user_feedings_path( @feeding.user_id)
        else 
            render :new
        end 

    end 

    def show 
        redirect_if_unauthorized
    end

    def index
        # checks to see if user is logged in and matches parameter user id
        # if matches it will set instance variable to current user
        # sets the number of dinosaurs not fed to instance variable
        # sets the number of dinosaurs fed to instance variable    
        # if not matched redirects to user show page    
 
            @user = current_user
            @number_of_dinosaurs = Dinosaur.all.size
            @dinosaurs_fed_today =  Feeding.where(["created_at >  ? and user_id = ?", Time.now.to_date, @user.id]).distinct.size     
 
    end 

    private

    def get_feeding
        Feeding.find_by(user_id: params[:user_id], id: params[:id])
    end
    
    def redirect_if_unauthorized
       redirect_to user_path(current_user.id) unless get_feeding
    end

    def worker_check
        Address.find_by(user_id: params[:user_id])
    end
    
    def redirect_if_not_employed
        redirect_to user_path(current_user.id) unless worker_check
    end 

    def feeding_params

        params.require(:feeding).permit(:sustenance, :user_id, :dinosaur_id )
    end 
end
