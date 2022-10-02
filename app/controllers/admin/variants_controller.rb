class Admin::VariantsController < ApplicationController
  layout 'admin_application'

  before_action :load_product, only: :index
  before_action :load_variant, only: :update

  def index
    @variants = @product.variants
  end

  def update
    @variant_price.assign_attributes(value: params[:price])
    @variant_amount.assign_attributes(value: params[:quantity])

    return render :index unless @variant_price.valid? && @variant_amount.valid?

    @variant_price.save
    @variant_amount.save
    redirect_to admin_product_variants_path(@variant.variant_configable), alert: "Update Success"
  end

  def destroy
    variant = Product.find_by(id: params[:id])
    product_id = variant.variant_configable.id
    return render :index unless variant.destroy

    redirect_to admin_product_variants_path(product_id), alert: "Destroy Success"
  end

  private

  def load_product
    @product = Product.find_by(id: params[:product_id])
  end

  def load_variant
    @variant = Product.includes(:properties).find_by(id: params[:id])
    @variant_price = @variant.property_float(:price) || @variant.property_value_floats.build(property: Property.find_by_name(:price))
    @variant_amount = @variant.property_float(:quantity) || @variant.property_value_floats.build(property: Property.find_by_name(:quantity))
  end
end
  