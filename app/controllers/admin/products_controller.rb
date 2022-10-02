class Admin::ProductsController < Admin::BaseController

  def new
    @product = Product.new
    if params[:style_product] == "simple"
      @product.property_value_floats.build(property_id: Property.find_by_name("price").id)
      @product.property_value_floats.build(property_id: Property.find_by_name("quantity").id)
    end
  end

  def create
    if params[:style_product] == "simple"
      product = Product.new(product_simple_params)
      if product.save
        redirect_to admin_products_path, alert: "create success"
      end
    elsif params[:style_product] == "configable"
      product = Product.new(product_params)
      sizes, colors, p_color, p_size, c_default = set_contractor_variant
      ActiveRecord::Base.transaction do
        if product.save
          sizes.reject(&:empty?).product(colors.reject(&:empty?)).each do |sc|
            _p = Product.create category_id: c_default.id, style: :variant
            ProductVariant.create product_id: product.id, variant_id: _p.id
            PropertyValueString.create value: sc.first, property_id: p_size.id, product_id: _p.id
            PropertyValueString.create value: sc.last, property_id: p_color.id, product_id: _p.id
          end
          redirect_to admin_products_path, alert: "create success"
        end
      end
    else
      redirect_to admin_products_path, alert: "An error has occurred"
    end
  rescue
    p ">>>>>>>>>>>>>>>> error"
  end

  private

  def product_simple_params
    params.require(:product).permit(
      :name, :description, :category_id, :style,
      property_value_floats_attributes: [:property_id, :value]
    )
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :style)
  end

  def set_contractor_variant
    sizes = params[:property_value_strings][:sizes]
    colors = params[:property_value_strings][:colors]
    _p_color = Property.find_by_name("color")
    _p_size = Property.find_by_name("size")
    _category_default = Category.find_by_name("default")

    [sizes, colors, _p_color, _p_size, _category_default]
  end
end
