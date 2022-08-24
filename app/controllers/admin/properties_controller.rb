class Admin::PropertiesController < Admin::BaseController
  private

  def property_params
    params.require(:property).permit(:key)
  end
end
