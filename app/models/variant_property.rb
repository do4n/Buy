class VariantProperty < ApplicationRecord
  belongs_to :variant
  belongs_to :property
  has_many :property_values, dependent: :destroy

  accepts_nested_attributes_for :property_values
end
