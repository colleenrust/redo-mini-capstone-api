Rails.application.routes.draw do
  get "/products" => "products#index" 
  get "/products/:id" => "products#show" 
  post "/products" => "products#create" 
  
  post "/users" => "users#create" 
  post "/sessions" => "sessions#create" 
  
  get "/orders" => "orders#index"
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  post "/carted_products" => "carted_products#create"
  get "/carted_products" => "carted_products#index"
  delete "/carted_products/:id" => "carted_products#destroy"

  get "/suppliers" => "suppliers#index"

  # REST API
  # CRUD through the web + naming conventions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
