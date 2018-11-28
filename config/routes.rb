##
# = routes.rb
# Author::    Mushaka Solutions
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# Routes for the application
Rails.application.routes.draw do
  # Clearance routes to constrains signed in users to the dashboard
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'pages#show', as: :signed_in_root, id: 'home'
  end

  # Clearance routes to constrain signed out users to the public pages
  constraints Clearance::Constraints::SignedOut.new do
    root to: 'pages#show', id: 'home'
  end

  # Clearance routes for users and passwords for password resets
  resources :users, controller: 'users', only: [:create] do
    resource :password, controller: 'clearance/passwords',
                        only: %i[create edit update]
  end

  # Clearance routes for passwords
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]

  # Clearance routes for login
  resource :session, controller: 'sessions', only: %i[create new]

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'dashboard/review', to: 'dashboard#review', as: 'dashboard_review'

  resources :boards do
    member do
      get 'feed'
    end
    resources :posts do
      member do
        post 'flag'
        post 'unflag'
      end
      resources :replies, only: %i[create destroy] do
        member do
          post 'flag'
          post 'unflag'
        end
      end
    end
  end

  resources :pages, only: %i[index show new edit create update destroy]

  root 'pages#show', as: 'home', id: 'home'
end
