class ZoosController < ApplicationController

    def index
        @zoos = Zoo.all
        
    end

    def show 
         @zoo ||= Zoo.find_by(id: params[:id])
         zoo_exist?
    end

    
end
