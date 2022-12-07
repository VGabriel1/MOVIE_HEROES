Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  resources :lists do
    resources :pages, only: [:edit, :update, :destroy]
  end

  resources :lists do
    resources :bookmarks, only: [:new, :create, :edit, :update]
  end
  resources :bookmarks, only: [:destroy]
  get "dashboard", to: "pages#dashboard"
  get "home", to: "pages#home"
end
