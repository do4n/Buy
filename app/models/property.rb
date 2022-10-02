class Property < ApplicationRecord
	has_many :products, through: :property_value_strings
  has_many :products, through: :property_value_floats
end
