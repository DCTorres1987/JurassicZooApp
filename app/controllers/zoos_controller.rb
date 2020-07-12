class ZoosController < ApplicationController

    def index
        #retrieves all zoos
        @zoos = Zoo.all
        
    end

    def show 
        #retrieves zoo by id
         @zoo ||= Zoo.find_by(id: params[:id])
         #checks to see if zoo exists
         zoo_exist?
    end

    
end
