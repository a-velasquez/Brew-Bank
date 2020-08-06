Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  # get '/auth/google_oauth2/callback', to: 'sessions#omniauth'  
  # more dynamic route 
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :reviews 
  resources :users, only: [:new, :create, :show]
  resources :beers do
    resources :reviews, only: [:new, :index]
  end
  resources :categories
  
  

end
