class CreatePropertyValueFloats < ActiveRecord::Migration[7.0]
  def change
    create_table :property_value_floats do |t|
      t.references :property, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
