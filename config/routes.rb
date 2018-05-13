Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "dashboard#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
  resources :customers
  resources :user_infos, only: [:new, :create]
  resources :brands
  resources :customer_notes

  namespace :admin do
    root "dashboard#index"
    resources :users
    resources :projects
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
  end
end
