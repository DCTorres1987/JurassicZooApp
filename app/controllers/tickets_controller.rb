class TicketsController < ApplicationController

    def new
  
        @attractions = Attraction.where(zoo_id: params[:zoo_id])
        @ticket = Ticket.new(user_id: params[:user_id])
    end
  
    def index
        byebug
        @tickets = Ticket.find(params[:id])
    end 

end
