Rails.application.routes.draw do

  root 'pages#home'

  resources :goals, :subgoals, :orders, :categories

  get '/users/edit' => 'users#edit'

  resources :users, :only => [:new, :create, :index, :update, :show]


  resources :conversations, only: [:index, :show, :new, :create] do
    resources :messages do
    end
  end


  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
