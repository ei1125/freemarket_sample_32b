class Brand < ApplicationRecord
  validates :brand_name, uniqueness: true
  validates :brand_name, presence: true
  has_many :items 
end
