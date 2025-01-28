class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  
  validates :cart, presence: true
  validates :product, presence: true
  validates :quantity, presence: true
  
  def total_price
    self.product.price * self.quantity
  end
end


