Rails.application.routes.draw do
  devise_for :users
  
  namespace :api do
    resources :employees
    resources :leave_requests
    resources :performance_evaluations
    resources :announcements
  end

  root 'employees#index'
end
