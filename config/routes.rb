# frozen_string_literal: true

Rails.application.routes.draw do
  get 'main/index'
  get 'signin/signin'
  post 'signin/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :people do
    collection do
      get 'new_person_user'
      post 'create_person_user'
    end
  end
  devise_for :users
  resources :users, only: [:edit]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root "main#index"
end
