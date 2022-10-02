class PropertyValueFloat < ApplicationRecord
  belongs_to :property
  belongs_to :product

  delegate :name, to: :property
end
