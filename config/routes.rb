Rails.application.routes.draw do
  root "events#index"

  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end

  devise_for :users

  resources :users, only: [:show]
  resources :events
  resources :attendances, only: [:create]

  delete "attendances", to: "attendances#destroy"
end
