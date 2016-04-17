Rails.application.routes.draw do
  root :to => 'pages#welcome'

  resources :users, :only => [:new, :create, :index, :update]

  resources :conversations, only: [:index, :show, :new, :create] do
    resources :messages do
  end
#   member do
#     post :reply
#     post :trash
#     post :untrash
# end
end

  get '/users/edit' => 'users#edit', :as => 'edit_user'

  get '/signup' => 'users#new'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
