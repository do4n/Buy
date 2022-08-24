class Variant < ApplicationRecord
  belongs_to :product
  has_many :variant_properties, dependent: :destroy

  accepts_nested_attributes_for :variant_properties
end
