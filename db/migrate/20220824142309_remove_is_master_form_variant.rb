class RemoveIsMasterFormVariant < ActiveRecord::Migration[7.0]
  def change
    remove_column :variants, :is_master
  end
end
