Rails.application.routes.draw do
  resources :users
  resources :products do
    get :recommendations, on: :collection
  end
  resources :orders
  resources :order_items
  resources :users

  # Authentication routes
  post '/signup', to: 'authentication#signup'
  post '/login', to: 'authentication#login'
end
