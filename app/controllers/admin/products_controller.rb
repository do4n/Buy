class Admin::ProductsController < Admin::BaseController

  private

  def product_params
    params.require(:product).permit(
      :name, :description, :category_id,
      variants_attributes: [:is_master]
    )
  end
end
