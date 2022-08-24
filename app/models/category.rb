class Category < ApplicationRecord
	has_many :products, dependent: :destroy
  has_many :sub_categories, dependent: :destroy
end
