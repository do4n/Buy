class RemoveValueFormProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :value
  end
end
