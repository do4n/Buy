class PropertyValueFloat < ApplicationRecord
  belongs_to :property
  has_many :products, dependent: :destroy
end
