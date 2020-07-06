Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :zoos, only: [:index, :show] do 

    resources :attractions, only: [:index, :show]

    resources :users, only: [:create, :new, :show] do 

      resources :tickets, only: [:create, :new, :show]
      resources :reviews, only: [:new, :create, :show, :index, :edit, :destroy]
    end 

    
  end

  root 'zoo#index'


end

