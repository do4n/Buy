class RenameKeyToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties, :key, :name
  end
end
