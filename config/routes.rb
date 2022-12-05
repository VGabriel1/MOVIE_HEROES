Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  resources :lists do
    resources :pages, only: [:update, :destroy]
  end
  get "dashboard", to: "pages#dashboard"
end
