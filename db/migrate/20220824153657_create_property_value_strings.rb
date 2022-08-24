class CreatePropertyValueStrings < ActiveRecord::Migration[7.0]
  def change
    create_table :property_value_strings do |t|
      t.references :property, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
