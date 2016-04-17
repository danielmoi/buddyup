Rails.application.routes.draw do
  root 'home#index'
  resources :users, :goals
end
