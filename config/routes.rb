Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :zoos, only: [:index, :show] do 
    resources :workers, only: [:create, :new, :show]
    resources :users, only: [:create, :new, :show] do 
      resources :tickets, only: [:create, :new, :show]
      resources :reviews, only: [:index, :new, :create, :update, :destroy]
    end 
    resources :attractions, only: [:index, :show]
  end

  root 'zoo#index'


end
