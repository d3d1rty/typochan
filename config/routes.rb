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
    root to: 'public#index', as: :signed_in_root
  end

  # Clearance routes to constrain signed out users to the public pages
  constraints Clearance::Constraints::SignedOut.new do
    root to: 'public#index'
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

  get 'about', to: 'public#about', as: 'about'
  root 'public#index', as: 'home'
end
