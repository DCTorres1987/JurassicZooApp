class ZoosController < ApplicationController

    def index
        @zoos = Zoo.all
        
    end

    def show 
         @zoo ||= Zoo.find_by(id: params[:id])
         if @zoo.nil?
            redirect_to zoos_path
         end 
    end

    
end
