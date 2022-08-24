class AddColumnsToProductVariants < ActiveRecord::Migration[7.0]
  def change
    add_column :product_variants, :variant_id, :integer
    add_index :product_variants, :variant_id
  end
end
