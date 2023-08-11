Rails.application.routes.draw do
  get '/products', to: 'products#index'
  post '/products', to: 'products#create'
  get '/products/new', to: 'products#new', as: :new_product
  get '/products/:id', to: 'products#show', as: :product
end
