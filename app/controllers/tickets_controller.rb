class TicketsController < ApplicationController

    def new
  
        @attractions = Attraction.where(zoo_id: params[:zoo_id])
        @ticket = Ticket.new(user_id: params[:user_id], zoo_id: params[:zoo_id])

    end
  
    def show
        @tickets = Ticket.find(params[:id])
    end 

    def create
        @ticket = Ticket.create(ticket_params)
        if @ticket.save
        redirect_to zoo_user_ticket_path(@ticket.user.id)
        else 
        render :new
        end 
    end

    private

    def ticket_params
        byebug
        params.require(:ticket).permit(:price, :time, :attraction_id, :user_id, :zoo_id)
    end         

end
