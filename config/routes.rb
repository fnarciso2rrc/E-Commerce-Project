Rails.application.routes.draw do
  # get "users/edit"
  get "home/index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  scope "/checkout" do 
    get "shipping_information", to: "checkout#shipping_information", as: "checkout_shipping_information"
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
    post "update_shipping_information", to: "checkout#update_shipping_information", as: "update_shipping_information"  # Add this line

  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories
  resources :products
  resources :customers
  resources :cart_items
  resources :carts, only: [:show]
  resources :orders

  root to: "home#index"










  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
