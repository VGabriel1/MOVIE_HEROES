Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  resources :lists do
    resources :pages, only: [:edit, :update, :destroy]
  end

  resources :lists do
    resources :bookmarks
  end
  get "dashboard", to: "pages#dashboard"
end
