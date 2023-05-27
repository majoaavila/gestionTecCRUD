Rails.application.routes.draw do
  devise_for :employees, :path_prefix => 'my'
  resources :employees
  resources :products
  resources :suppliers
  resources :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "clients#index"
  post "employees/confirm_password_employees/:id", to: "employees#confirm_password", as: "confirm_password_employees"
  post "clients/confirm_password_clients/:id", to: "clients#confirm_password", as: "confirm_password_clients"
  post "products/confirm_password_products/:id", to: "products#confirm_password", as: "confirm_password_products"
  post "suppliers/confirm_password_suppliers/:id", to: "suppliers#confirm_password", as: "confirm_password_suppliers"
end
