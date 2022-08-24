class CreatePropertyValues < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_values do |t|
      t.string :value
      t.integer :amount
      t.references :variant_property, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
