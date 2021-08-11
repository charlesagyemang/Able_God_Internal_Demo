Rails.application.routes.draw do
  resources :programmes
  resources :lineups
  resources :services
  resources :leaders
  resources :members
  resources :departments
  devise_for :users
  root to: 'members#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
