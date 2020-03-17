Rails.application.routes.draw do
  root :to => 'pages#marketplace'
  get '/marketplace' => 'pages#marketplace'
  resources :users, :only => [:new, :create, :index, :show, :edit, :update]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :collections
  resources :samples, :only => [:new, :create, :index, :show, :edit, :update, :destroy]
end
