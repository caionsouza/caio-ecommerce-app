require 'rails_helper'
require 'faker'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:order_items) }
  it { should have_many(:products).through(:order_items) }

  it { should validate_presence_of(:total_price) }

  describe 'creating an order' do
    let(:user) { create(:user, nome: Faker::Name.name, email: Faker::Internet.email, cpf: Faker::Number.number(digits: 11)) }
    let(:order) { create(:order, user: user, total_price: Faker::Commerce.price) }

    it 'creates an order with a random total price' do
      expect(order.total_price).to be > 0
    end
  end

  describe 'total price' do
    let(:user) { create(:user) }
    let(:order) { create(:order, user: user) }
    let(:product1) { create(:product, price: 10.0) }
    let(:product2) { create(:product, price: 20.0) }

    it 'calculates total price correctly' do
      create(:order_item, order: order, product: product1, quantity: 2, price: 10.0)
      create(:order_item, order: order, product: product2, quantity: 1, price: 20.0)

      expect(order.total_price).to eq(40.0)
    end
  end
end
