Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :zoos, only: [:index, :show] do     

    resources :attractions, only: [:index, :show]
 
  end

  resources :users, only: [:create, :new, :show] do 
    resources :addresses, only: [:create, :new, :show]
    resources :tickets, only: [:index, :create, :new, :show]
    resources :reviews, only: [:index, :create, :new, :edit, :show, :update, :destroy]
    resources :feedings, only: [:index, :create, :new, :show]
    get '/five_stars', to: 'reviews#five_stars'
    get '/four_stars', to: 'reviews#four_stars'
    get '/three_stars', to: 'reviews#three_stars'
    get '/two_stars', to: 'reviews#two_stars'
    get '/one_stars', to: 'reviews#one_stars'
  end    

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  
  root 'zoo#index'


end

