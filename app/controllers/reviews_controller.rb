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
    
        @review = Review.find_by(user_id: params[:user_id], id: params[:id])
  
    end 

    def new 
        @review = Review.new(user_id: params[:user_id]) 
    end 

    def create 
        #retrieves review by attraction id

        @review = get_review_by_attraction
        #if review dosent' exist create review record useing review paramss
        #if review exist it will render review show page
        #if review saves successfully it will render show page

        if @review.nil? 
            @review = current_user.reviews.build(review_params)
    
            if @review.save
                send_to_review_show_page

            else        
                render :new
            end 

        else
            send_to_review_show_page
        end

    end 

    def edit
        @review = get_review_by_id
    end

    def update
        @review = get_review_by_id 
        @review.update(review_params)
        
        if @review.save
            redirect_to user_review_path(@review.user_id,  @review.id)
        else 
            flash[:alert] = "Did not update."
            render :edit
        end

    end 

    def destroy
        get_review.destroy
        redirect_to user_path(@user.id)
    end

    private

    def get_review_by_id
        @review = Review.find_by(id: params[:id]) 
    end


    def get_review_by_attraction
        @review = Review.find_by(user_id: params[:user_id], attraction_id: params["review"][:attraction_id])
    end

    def send_to_review_show_page
        @review = get_review_by_attraction
        redirect_to user_review_path(@review.user_id,  @review.id)
    end


    def review_params
    
        params.require(:review).permit(:stars, :review, :user_id, :attraction_id)
    end   


end
