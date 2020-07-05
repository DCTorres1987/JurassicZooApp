class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end 

    def show
        @review ||= Review.find(params[:id])
    end 

    def new 
        @review = Review.new(user_id: params[:user_id], zoo_id: params[:zoo_id])
    end 

    def create 
        @review = Review.create(review_params)
    
        if @review.save
        redirect_to zoo_user_review_path(@review.user_id, @review.zoo_id, @review.id)
        else 
       
        render :new
        end 
    end 

    def update
    end 

    def destroy
    end

    private

    def review_params
    
        params.require(:review).permit(:stars, :review, :user_id, :zoo_id)
    end   


end
