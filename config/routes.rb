Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :reviews 

  resources :beers do
    resources :reviews, only: [:new, :index, :show]
  end
  resources :users do 
    resources :beers 
  end
  resources :categories do 
    resources :beers, only: [:index]
  end

end
