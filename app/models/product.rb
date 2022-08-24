class Product < ApplicationRecord
  belongs_to :category
  has_many :variants

  accepts_nested_attributes_for :variants
end
