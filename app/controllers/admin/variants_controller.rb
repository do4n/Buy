class Admin::VariantsController < Admin::BaseController
  private

  def variant_params
    params.require(:variant).permit(
      :is_master, :product_id, variant_properties_attributes: [
        :property_id,
        property_values_attributes: [
          :value, :amount
        ]
      ]
    )
  end
end
