# frozen_string_literal: false

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'

  # get 'signup', to: 'users#new'
  # post 'signup', to: 'users#create'
  #
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'

  # resources :sessions, only: %i[new create destroy]

  resources :projects do
    member do
      get :edit
      patch :update
    end
  end

  resources :tasks do
    resources :timers do
      member do
        patch :stop
      end
    end
  end
end
