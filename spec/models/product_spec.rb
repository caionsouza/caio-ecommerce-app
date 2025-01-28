require 'rails_helper'
require 'faker'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:stock) }

  it { should validate_numericality_of(:stock).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:price).is_greater_than(0) }

  it { should have_many(:cart_items) }
  it { should have_many(:carts).through(:cart_items) }

  describe 'creating a product with Faker' do
    let(:product) do
      create(:product, name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price: Faker::Commerce.price, stock: Faker::Number.between(from: 1, to: 100))
    end

    it 'creates a product with a random name, description, price, and stock' do
      expect(product.name).to be_a(String)
      expect(product.description).to be_a(String)
      expect(product.price).to be > 0
      expect(product.stock).to be >= 1
    end
  end

  describe 'availability' do
    let(:product) { create(:product, stock: 5) }

    it 'adds to cart only if stock is sufficient' do
      expect(product.can_be_added_to_cart?(6)).to be_falsey
      expect(product.can_be_added_to_cart?(5)).to be_truthy
    end
  end
end
