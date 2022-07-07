Rails.application.routes.draw do
  root "events#index"

  resources :users, only: [:show]

  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end

  devise_for :users
end
