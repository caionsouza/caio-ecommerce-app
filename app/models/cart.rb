class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :products, through: :cart_items
  
  def total_price
    cart_items.inject(0) { |sum, item| sum + item.product.price * item.quantity }
  end

  def add_product(product, quantity)
    item = cart_items.find_or_initialize_by(product_id: product.id)
    item.quantity = (item.quantity || 0) + quantity
    item.save
    product.reduce_stock!(quantity)
  end
  
  def remove_product(product)
    item = cart_items.find_by(product: product)
    product.replenish_stock!(item.quantity)
    item&.destroy
  end
end
