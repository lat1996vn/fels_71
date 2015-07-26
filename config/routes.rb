Rails.application.routes.draw do
  root "static_pages#home"

  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :words, only: [:index]
  resources :words, only: [:index]
  namespace :admin do
    root "categories#index"
    resources :categories
  end
  resources :users do
    get "/:relationship" => "relationships#index", as: :relationship
  end
  resources :relationships, only: [:index, :create, :destroy]
end
