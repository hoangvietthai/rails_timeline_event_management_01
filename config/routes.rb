Rails.application.routes.draw do
  get "notifications/show"
  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :events

  namespace :admin do
    root to: "static_pages#index"
    get "/static_pages/tables", to: "static_pages#tables", as: "showuser"
  end
end
