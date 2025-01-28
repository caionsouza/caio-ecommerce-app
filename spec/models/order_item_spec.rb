require 'rails_helper'
require 'faker'

RSpec.describe OrderItem, type: :model do
  it { should belong_to(:order) }
  it { should belong_to(:product) }

  it { should validate_presence_of(:order) }
  it { should validate_presence_of(:product) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:price) }

  describe 'creating an order item' do
    let(:product) { create(:product, price: Faker::Commerce.price) }
    let(:order) { create(:order) }
    let(:order_item) { create(:order_item, order: order, product: product, quantity: Faker::Number.between(from: 1, to: 5), price: product.price) }

    it 'creates an order item with a random quantity and price' do
      expect(order_item.quantity).to be_between(1, 5).inclusive
      expect(order_item.price).to eq(product.price)
    end
  end

  describe 'price consistency' do
    let(:product) { create(:product, price: 10.0) }
    let(:order) { create(:order) }

    it 'uses product price for order item' do
      order_item = OrderItem.create(order: order, product: product, quantity: 2)
      expect(order_item.price).to eq(product.price)
    end
  end
end
