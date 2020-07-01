class WorkersController < ApplicationController

def new
    @worker = Worker.new
end

def create
    @worker = Worker.create(worker_params)
    return redirect_to controller: 'workers', action: 'new' unless @worker.save
    session[:worker_id] = @worker.id
    redirect_to controller: 'zoo', action: 'index'

end

def worker_params
    params.require(:worker).permit(:name, :password)
end

end
