Rails.application.routes.draw do

  root 'pages#home'

  resources :users, :goals

end
