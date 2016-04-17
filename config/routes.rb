Rails.application.routes.draw do

  root 'pages#home'
  resources :users, :goals, :subgoals, :orders, :categories

end
