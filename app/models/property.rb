class Property < ApplicationRecord
	has_many :property_value_floats, dependent: :destroy
  has_many :property_value_strings, dependent: :destroy
end
