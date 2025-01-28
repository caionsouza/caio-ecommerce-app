Rails.application.routes.draw do
  root "products#index" # Define a página inicial como o catálogo de produtos

  # Rotas para autenticação
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'show_product_description/:id', to: 'products#show_product_description', as: 'show_product_description'

  # Rotas de usuários

  # Rotas de produtos
  resources :products, only: [:index, :show]

  # Rotas para o carrinho
  resources :carts do
    post 'add_item_to_user_cart', on: :member
    delete 'remove_item/:id', to: 'carts#remove_item', as: 'remove_item'
    get 'checkout', to: 'carts#checkout', as: 'checkout'
    patch 'update_item_quantity/:cart_item_id', to: 'carts#update_item_quantity', as: 'update_item_quantity'
  
    resources :cart_items, only: [:destroy]
  end

  get '/orders/:id/success', to: 'orders#success', as: 'order_success'
end
