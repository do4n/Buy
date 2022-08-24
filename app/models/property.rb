class Property < ApplicationRecord
	has_many :variant_properties, dependent: :destroy
end
