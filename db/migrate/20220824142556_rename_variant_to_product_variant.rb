class RenameVariantToProductVariant < ActiveRecord::Migration[7.0]
  def up
    rename_table :variants, :product_variants
  end

  def down
    rename_table :product_variants, :variants
  end
end
