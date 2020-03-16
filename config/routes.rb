Rails.application.routes.draw do
  root :to => 'pages#welcome'
  resources :users, :only => [:new, :create, :index]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :collections, :only => [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :samples, :only => [:new, :create, :index, :show, :edit, :update, :destroy]
end
