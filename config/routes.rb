Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :zoos, only: [:index, :show] do 
    resources :workers, only: [:new, :show]
    resources :users, only: [:new, :show]
  end
  # get '/zoos/workers/:id', to: 'workers#show', as 'worker'



  root 'zoo#index'


end
