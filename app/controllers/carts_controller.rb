class CartsController < ApplicationController
  before_action :set_cart, only: [:checkout, :show, :remove_item]

  def show
  end

  def remove_item
    @cart_item = @cart.cart_items.find(params[:id])

    product = @cart_item.product

    product.replenish_stock!(@cart_item.quantity)
  
    if @cart_item.destroy
      redirect_to cart_path(@cart), notice: "Item removido com sucesso!"
    else
      redirect_to cart_path(@cart), alert: "Houve um erro ao remover o item."
    end
  end

  def checkout
    if @cart.cart_items.empty?
      redirect_to cart_path, alert: "Seu carrinho está vazio!"
    else
      @order = Order.create!(user: current_user, total_price: @cart.total_price)
      
      @cart.cart_items.each do |cart_item|
        @order.order_items.create!(product: cart_item.product, quantity: cart_item.quantity, price: cart_item.product.price)
        cart_item.destroy
      end
      
      redirect_to order_success_path(@order), notice: "Compra realizada com sucesso!"
    end
  end

  def add_item_to_user_cart
    @cart = current_user.cart || current_user.build_cart
    product = Product.find(params[:product_id]) 
    quantity = params[:quantity].to_i
    
    unless product.available_stock?(quantity)
      redirect_to product_path(product), alert: product.errors.full_messages.join(", ")
      return
    end

    @cart.add_product(product, params[:quantity].to_i)

    if @cart.save
      redirect_to cart_path(current_user.cart.id), notice: 'Produto adicionado ao carrinho com sucesso!'
    else
      redirect_back fallback_location: root_path, alert: 'Não foi possível adicionar o produto.'
    end
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end
