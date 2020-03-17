class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true

  has_many :collections
  has_many :samples
end
