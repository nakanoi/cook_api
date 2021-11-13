class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.references :menu, null: false
      t.string :name, null: false
      t.string :menu_id_name, null: false

      t.timestamps
    end
    add_index :ingredients, [:menu_id_name], unique: true
    add_foreign_key :ingredients, :menus, column: :menu_id, primary_key: :menu_id
  end
end
