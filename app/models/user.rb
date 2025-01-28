class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable
  has_one :cart
  has_many :orders
  attr_writer :login

  def login
    @login || self.cpf || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      Rails.logger.debug("Login value: #{login}")  # Log para o valor do login
      user = where(conditions.to_h).where(["cpf = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:cpf) || conditions.has_key?(:email)
      user = where(conditions.to_h).first
    end
    Rails.logger.debug("User found: #{user.inspect}")  # Log para o usuário encontrado
    return user
  end
end