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
  get "/created_events", to: "events_management#created_events"
  get "/invited_events", to: "events_management#invited_events"
  root "static_pages#home"
  resources :users
  resources :events
  resources :notifications, only: :show

  namespace :admin do
    root to: "static_pages#tables"
    get "/static_pages/tables", to: "static_pages#tables", as: "show_user"
    resources :users
  end
end
