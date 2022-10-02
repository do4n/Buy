class RenameTypeToStyleAtProduct < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :type, :style
    end
end
