class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus, id: false do |t|
      t.string :name, null: false
      t.string :img, null: false
      t.string :medium_img, null: false
      t.string :small_img, null: false
      t.string :title, null: false
      t.bigint :menu_id, null: false, primary_key: true
      t.text :content, null: false
      t.string :url, null: false
      t.string :poster, null: false
      t.string :indication, null: false
      t.string :cost, null: false

      t.timestamps
    end
    add_index :menus, [:menu_id, :url], unique: true, name: 'menu_index'
  end
end
