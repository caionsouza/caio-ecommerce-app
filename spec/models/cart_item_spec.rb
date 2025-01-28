require 'rails_helper'
require 'faker'

RSpec.describe CartItem, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:product) }

  it { should validate_presence_of(:cart) }
  it { should validate_presence_of(:product) }
  it { should validate_presence_of(:quantity) }

  describe 'creating a cart item' do
    let(:product) { create(:product, price: Faker::Commerce.price) }
    let(:cart) { create(:cart) }
    let(:cart_item) { create(:cart_item, cart: cart, product: product, quantity: Faker::Number.between(from: 1, to: product.stock)) }

    it 'creates a cart item with a random quantity' do
      expect(cart_item.quantity).to be_between(1, product.stock).inclusive
    end
  end

  describe 'valid quantity' do
    let(:product) { create(:product, stock: 5) }
    let(:cart) { create(:cart) }

    it 'is invalid if quantity exceeds stock' do
      cart_item = CartItem.new(cart: cart, product: product, quantity: 6)
      expect(cart_item).not_to be_valid
    end

    it 'is valid if quantity is within stock' do
      cart_item = CartItem.new(cart: cart, product: product, quantity: 5)
      expect(cart_item).to be_valid
    end
  end
end
