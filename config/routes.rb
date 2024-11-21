Rails.application.routes.draw do
  resources :users
  resources :products
  resources :orders
  resources :order_items

  # Authentication routes
  post '/signup', to: 'authentication#signup'
  post '/login', to: 'authentication#login'
end
