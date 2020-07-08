class ReviewsController < ApplicationController
    before_action :require_login
    
    def index
        @reviews = Review.all
    end 

    # Methods for Review Filter________
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
    # _____________________________

    def show        
        @review = get_review

        if @review.nil?
            redirect_to zoos_path        
        else 
            @reviews = Review.all.select{|r| r.zoo_id == params[:zoo_id].to_i}
        end

    end 

    def new 
        @review = get_review

        if @review.nil?
            @review = Review.new(zoo_id: params[:zoo_id], user_id: params[:user_id]) 
                      
        else
            send_to_user_review_page  
                       
        end
    end 

    def create 
        @review = current_user.reviews.build(review_params)
    
        if @review.save
            send_to_user_review_page

        else        
            render :new
        end 
    end 

    def edit
        @review = get_review 
    end

    def update
        @review = get_review 

        @review.update(review_params)
        
        if @review.save
            send_to_user_review_page
        else 
            flash[:alert] = "Did not update."
            render :edit
        end

    end 

    def destroy
        get_review.destroy
        redirect_to zoo_user_path(@user.zoo_id, @user.id)
    end

    private

    def send_to_user_review_page
        redirect_to zoo_user_review_path(@review.zoo_id, @review.user_id,  @review.id)

    end

    def get_review
        @review = Review.find_by(zoo_id: params[:zoo_id], user_id: params[:user_id])
    end


    def review_params
    
        params.require(:review).permit(:stars, :review, :user_id, :zoo_id)
    end   


end
