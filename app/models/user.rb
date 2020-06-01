class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A[a-z\d]{8,100}+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, presence: true, length: { maximum: 15}
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true
  validates :birthday, presence: true
  validates :rank, presence: true
  validates :password, presence: true, length: { minimum: 8, maximum: 32}, format: { with: VALID_PASSWORD_REGEX }
  
  has_secure_password
end
