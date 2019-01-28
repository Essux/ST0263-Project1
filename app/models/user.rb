class User < ApplicationRecord
  has_many :locations
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 4}
  has_secure_password
end
