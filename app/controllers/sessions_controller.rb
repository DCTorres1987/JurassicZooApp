class SessionsController < ApplicationController

    def new
    end
  
    def create
      worker = User.find_by(name: params[:worker][:name])
  
      worker = worker.try(:authenticate, params[:worker][:password])
  
      return redirect_to(controller: 'sessions', action: 'new') unless worker
  
      session[:worker_id] = worker.id
  
      @worker = worker
  
      redirect_to controller: 'zoo', action: 'index'
    end
  
    def destroy
      session.delete :worker_id
  
      redirect_to '/'
    end
end
