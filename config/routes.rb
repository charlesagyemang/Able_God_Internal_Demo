Rails.application.routes.draw do
  get 'sundry/new_member_qr'
  get 'sundry/add_new_member'
  get 'sundry/member_created_successfully'
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
end
