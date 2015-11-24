Rails.application.routes.draw do
  get 'session/new'

  resources :users
  root :to => 'session#new'
  resources :cars
  
  get '/session' => 'session#show'
  get '/login' => 'session#new'
  get '/session' => 'session#show'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
