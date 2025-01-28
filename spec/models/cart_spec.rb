require 'rails_helper'
require 'faker'

RSpec.describe Cart, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:cart_items) }
  it { should have_many(:products).through(:cart_items) }

  describe 'creating a cart' do
    let(:user) { create(:user, nome: Faker::Name.name, email: Faker::Internet.email, cpf: Faker::Number.number(digits: 11)) }
    let(:cart) { create(:cart, user: user) }

    it 'creates a cart associated with a user' do
      expect(cart.user).to eq(user)
    end
  end

  describe 'total price' do
    let(:user) { create(:user) }
    let(:cart) { create(:cart, user: user) }
    let(:product1) { create(:product, price: 10.0) }
    let(:product2) { create(:product, price: 20.0) }

    it 'calculates total price correctly' do
      create(:cart_item, cart: cart, product: product1, quantity: 2)
      create(:cart_item, cart: cart, product: product2, quantity: 1)

      expect(cart.total_price).to eq(40.0)
    end
  end
end
