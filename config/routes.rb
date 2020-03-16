Rails.application.routes.draw do
  root :to => 'pages#welcome'
  resources :users, :only => [:new, :create, :index]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'


  get '/collections/:id/add-samples' => 'collections#add_sample', :as => :add_samples
  resources :collections
  resources :samples, :only => [:new, :create, :index, :show, :edit, :update, :destroy]
end
