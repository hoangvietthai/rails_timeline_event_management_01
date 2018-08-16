Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
  }

  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/created_events", to: "events_managements#created_events"
  get "/invited_events", to: "events_managements#invited_events"
  get "/search_events", to: "events_managements#search_events"
  root "static_pages#home"
  resources :users
  resources :events
  resources :notifications, only: :show
  resources :invites, only: [:new, :create, :edit, :update]
  resources :comments
  resources :user_events
  resources :events_managements
  
  namespace :admin do
    root to: "static_pages#tables"
    get "/static_pages/tables", to: "static_pages#tables", as: "show_user"
    resources :users
  end
end
