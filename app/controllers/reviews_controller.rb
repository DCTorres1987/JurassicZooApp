class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end 

    def show
        @review = Review.find(params[:id])
    end 

    def new 
    end 

    def create 
    end 

    def update
    end 

    def destroy
    end


end
