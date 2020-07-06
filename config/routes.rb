Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :zoos, only: [:index, :show] do     

    resources :attractions, only: [:index, :show]

    resources :users, only: [:create, :new, :show] do 

      resources :tickets, only: [:create, :new, :show]
      resources :reviews, only: [:new, :create, :show, :index, :edit, :destroy]
      get '/five_stars', to: 'reviews#five_stars'
      get '/four_stars', to: 'reviews#four_stars'
      get '/three_stars', to: 'reviews#three_stars'
      get '/two_stars', to: 'reviews#two_stars'
      get '/one_stars', to: 'reviews#one_stars'
    end 

    
  end

  root 'zoo#index'


end

