Rails.application.routes.draw do
  # get 'non_member/index'
  resources :non_member
  resources :outreach_reports
  resources :leadership_reports
  get 'messages/index'
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
