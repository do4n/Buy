class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, only: %i[edit update destroy]

	def index
		@categories = Category.all
	end

  def new
    @category = Category.new
  end

  def create
    category = Category.new params_category

    if category.save
      redirect_to admin_categories_path, alert: "Create susseccfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update params_category
      redirect_to admin_categories_path, alert: "Update susseccfully"
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_path, alert: "Delete susseccfully"
    else
      render :index
    end
  end

  private

  def load_category
    @category = Category.find_by(id: params[:id])
  end

  def params_category
    params.require(:category).permit(:name)
  end
end
