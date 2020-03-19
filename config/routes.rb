Rails.application.routes.draw do
  root :to => 'pages#explore'
  get '/explore' => 'pages#explore'
  resources :users, :only => [:new, :create, :index, :show, :edit, :update]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/samples/new_audio' => 'samples#new_audio'
  post '/samples/new_audio' => 'samples#create_audio'

  resources :collections, :only => [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :samples
  # resources :samples, :only => [:new, :create, :index, :show, :edit, :update, :destroy]

end
