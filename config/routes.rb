Rails.application.routes.draw do

  root 'pages#home'
  get 'lol' => 'pages#lol'

  resources :categories


  post '/goals/:goal_id/buddyup' => 'goals#buddyup'

  post '/goals/:goal_id/achieved' => 'goals#achieved'
  # post 'goals/:goal_id/buddyup' => 'goals#buddyup'

  resources :goals do
    resources :orders do
    end

    resources :messages do
    end

    resources :subgoals do
    end
  end

  get '/users/edit' => 'users#edit'

  resources :users, :only => [:new, :create, :index, :update, :show]

  get '/signup' => 'users#new'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'



end
