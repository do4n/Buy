class RemoveTypeFormProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :type
  end
end
