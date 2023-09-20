# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users # , controllers: { registrations: 'users/registrations' }

  # resources :users, only: %i[edit update]

  resources :cemeteries do
    resources :graves, only: %i[create destroy update edit] # exept: %[new show]
  end

  # get '/cemeteries', to: 'cemeteries#index'
  # get 'cemeteries/new', to: 'cemeteries#new'
  # post 'cemeteries', to: 'cemeteries#create'
end
