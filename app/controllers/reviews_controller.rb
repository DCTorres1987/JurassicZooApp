class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end 

    def five_stars
        @reviews = Review.five_stars
        render :index
    end

    def four_stars
        @reviews = Review.four_stars
        render :index
    end

    def three_stars
        @reviews = Review.three_stars
        render :index
    end

    def two_stars
        @reviews = Review.two_stars
        render :index
    end

    def one_stars
        @reviews = Review.one_stars
        render :index
    end

    def show
        @review ||= Review.find(params[:id])
        @reviews = Review.all.select{|r| r.zoo_id == params[:zoo_id].to_i}
    end 

    def new 
        @review = Review.new(zoo_id: params[:zoo_id], user_id: params[:user_id])
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
