require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:password) }

  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:cpf) }

  it { should have_one(:cart) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe 'login' do
    let(:user) { create(:user) }

    context 'when using email to log in' do
      it 'logs in with valid email and password' do
        expect(User.authenticate(email: user.email, password: user.password)).to eq(user)
      end
    end

    context 'when using CPF to log in' do
      it 'logs in with valid CPF and password' do
        expect(User.authenticate(cpf: user.cpf, password: user.password)).to eq(user)
      end
    end
  end

  describe 'creating a user with Faker' do
    let(:user) do
      create(:user, nome: Faker::Name.name, email: Faker::Internet.email, cpf: Faker::Number.number(digits: 11), password: 'senha123')
    end

    it 'creates a user with a random name, email, and cpf' do
      expect(user.nome).to be_a(String)
      expect(user.email).to match(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/)
      expect(user.cpf).to match(/\d{11}/)
    end
  end
end
