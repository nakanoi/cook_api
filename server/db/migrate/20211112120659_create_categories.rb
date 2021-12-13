class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :category_id, null: false
      t.string :url, null: false
      t.string :query, null: false

      t.timestamps
    end
    add_index :categories, [:category_id, :url, :query], unique: true, name: 'ingredient_index'
  end
end
