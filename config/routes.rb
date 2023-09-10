Rails.application.routes.draw do
  root "pages#index"

  resources :cemeteries

  # get '/cemeteries', to: 'cemeteries#index'
  # get 'cemeteries/new', to: 'cemeteries#new'
  # post 'cemeteries', to: 'cemeteries#create'

end
