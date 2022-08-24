class CreateSubCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.integer :sub_category_id, index: true

      t.timestamps
    end
  end
end
