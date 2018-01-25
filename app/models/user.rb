class User < ApplicationRecord
  require 'bcrypt'
  include BCrypt

  has_and_belongs_to_many :places

  validates :first_name, :last_name, :email, :password_hash, presence: true
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Not proper email format'}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.login(email, password)
    user = User.find_by_email(email)
    if user.password == password
      return user
    else
      nil
    end
  end
end
