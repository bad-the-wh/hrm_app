Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  authenticated :user do
    namespace :api do
      resources :employees, except: [:index, :show]
      resources :leave_requests, except: [:index, :show]
      resources :performance_evaluations, except: [:index, :show]
      resources :announcements, except: [:index, :show]
    end
  end

  namespace :api do
    resources :employees, only: [:index, :show]
    resources :leave_requests, only: [:index, :show]
    resources :performance_evaluations, only: [:index, :show]
    resources :announcements, only: [:index, :show]
  end

  root to: 'employees#index'  # Corrected root path
end
