Rails.application.routes.draw do
  root :to => 'pages#explore'
  get '/explore' => 'pages#explore'
  resources :users, :only => [:new, :create, :index, :show, :edit, :update]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :collections, :only => [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :samples, :only => [:new, :create, :index, :show, :edit, :update, :destroy]
end
