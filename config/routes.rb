Rails.application.routes.draw do
  # get '/products', to: 'products#index'
  # post '/products', to: 'products#create'
  # get '/products/new', to: 'products#new', as: :new_product
  # get '/products/:id', to: 'products#show', as: :product
  # get '/products/:id/edit', to: 'products#edit', as: :edit_product
  # delete '/products/:id', to: 'products#destroy'
  # patch '/products/:id', to: 'products#update'
  resources :products, path: '/' # Esta linea es equivalente a todas las anteriores. Con path: '/', hacemos que '/productos' resida en la raiz
end
