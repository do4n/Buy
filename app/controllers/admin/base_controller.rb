class Admin::BaseController < ApplicationController
	layout 'admin_application'

  before_action :auto_set_resource, only: %i[edit update destroy]

  def index
    instance_variable_set("@#{resource_name.pluralize}", resource_class.all)
  end

  def new
    instance_variable_set("@#{resource_name}", resource_class.new)
  end

  def create
    instance_variable_set("@#{resource_name}", resource_class.new(resource_params))

    return render :new unless resoure_object.valid?

    resoure_object.save
    auto_redirect_url resource_name,"Create susseccfully"
  end

  def edit; end

  def update
    resoure_object.assign_attributes(resource_params)

    return render :edit unless resoure_object.valid?

    resoure_object.save
    auto_redirect_url resource_name, "Update susseccfully"
  end

  def destroy
    resoure_object.destroy
    auto_redirect_url resource_name, "Delete susseccfully"
  end


  private

  def resource_name
    @resource_name ||= controller_name.singularize
  end

  def resource_class
    @resource_class ||= resource_name.classify.constantize
  end

  def resource_params
    @resource_params ||= send("#{resource_name}_params")
  end

  def resoure_object
    instance_variable_get("@#{resource_name}")
  end

  def auto_set_resource(resource = nil)
    resource ||= resource_class.find_by(id: params[:id])
    instance_variable_set("@#{resource_name}", resource)
  end

  def auto_redirect_url name_object, msg
    case name_object
    when "property" then redirect_to admin_properties_path, alert: msg
    when "category" then redirect_to admin_categories_path, alert: msg
    when "product" then redirect_to admin_product_variants_path(resoure_object), alert: msg
    else redirect_to root_path
    end
  end
end
