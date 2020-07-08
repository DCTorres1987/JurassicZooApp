class TicketsController < ApplicationController
    before_action :require_login

    def new
  
        @attractions ||= Attraction.where(zoo_id: params[:zoo_id])
        @ticket = Ticket.new(zoo_id: params[:zoo_id], user_id: params[:user_id])

    end
  
    def show
        @ticket ||= Ticket.find(params[:id])
    end 

    def create
        @ticket = Ticket.create(ticket_params)
    
        if @ticket.save
            redirect_to zoo_user_ticket_path(@ticket.zoo_id, @ticket.user_id, @ticket.id)
        else 
            render :new
        end 
    end

    private

    def ticket_params
    
        params.require(:ticket).permit(:time, :price, :attraction_id, :user_id, :zoo_id)
    end         

end
