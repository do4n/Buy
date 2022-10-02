class Product < ApplicationRecord
  belongs_to :category
  has_many :product_variants, dependent: :destroy
  has_many :property_value_floats, dependent: :destroy
  has_many :property_value_strings, dependent: :destroy
  has_many :properties, through: :property_value_floats
  has_many :properties, through: :property_value_strings

  accepts_nested_attributes_for :property_value_floats

  enum style: {simple: 1, configable: 2, variant: 3}

  scope :products_by, ->(styles){where(style: styles)}

  def variants
    Product.where(id: product_variants.pluck(:variant_id), style: :variant)
  end

  def property_string attr_name
    PropertyValueString.joins(:property).find_by(product_id: id, properties: {name: attr_name})
  end

  def property_float attr_name
    PropertyValueFloat.joins(:property).find_by(product_id: id, properties: {name: attr_name})
  end

  def variant_configable
    return unless variant?

    ProductVariant.find_by_variant_id(id).product
  end
end
