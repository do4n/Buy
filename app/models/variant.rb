class Variant < ApplicationRecord
  belongs_to :product
  has_many :variant_properties
end
