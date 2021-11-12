class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :category_id
      t.string :url
      t.string :query

      t.timestamps
    end
  end
end
