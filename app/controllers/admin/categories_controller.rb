class Admin::CategoriesController < Admin::BaseController
  private

  def category_params
    params.require(:category).permit(:name)
  end
end
