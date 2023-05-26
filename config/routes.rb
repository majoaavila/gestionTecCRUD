Rails.application.routes.draw do
  devise_for :employees
  resources :employees
  resources :products
  resources :suppliers
  resources :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "clients#index"
end
