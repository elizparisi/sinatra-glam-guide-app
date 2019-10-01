class User < ActiveRecord::Base

  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :products
  has_many :reviews

  has_secure_password

end
