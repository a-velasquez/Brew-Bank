Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :reviews 

  resources :beers do
    resources :reviews, only: [:new, :index, :show]
  end
  resources :users, only: [:show] do 
    resources :beers 
  end
  resources :categories
end
