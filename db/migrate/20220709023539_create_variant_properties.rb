class CreateVariantProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_properties do |t|
      t.references :variant, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
