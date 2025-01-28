class Product < ApplicationRecord
  validates :name, :price, :description, :stock, :image, presence: true
  has_many :order_items
  has_many :cart_items

  def available_stock?(quantity)
    if stock < quantity
      errors.add(:base, "Estoque insuficiente para o produto #{name}. Disponível: #{stock} unidades.")
      return false
    end
    true
  end

  def reduce_stock!(quantity_to_reduce)
    update!(stock: self.stock - quantity_to_reduce)
  end

  def replenish_stock!(quantity)
    update!(stock: self.stock + quantity)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end