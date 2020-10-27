Rails.application.routes.draw do
  root 'sessions#welcome'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  delete '/logout' => 'sessions#destroy'

  get '/animes/most_reviewed' => 'animes#most_reviewed'

  get "/auth/:provider/callback" => 'sessions#facebook'
  
  resources :reviews
  resources :animes do
    resources :reviews, only: [:new, :create, :index, ]
  end
  resources :users do 
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
