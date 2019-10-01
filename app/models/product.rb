class Product < ActiveRecord::Base

  has_many :reviews
  belongs_to :user

  validates :name, :description, :image_url, :rating, presence: true

end
