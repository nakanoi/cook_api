class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.string :img, null: false, unique: true
      t.string :medium_img, null: false, unique: true
      t.string :small_img, null: false, unique: true
      t.string :title, null: false
      t.integer :menu_id, null: false, unique: true
      t.text :content, null: false
      t.string :url, null: false, unique: true
      t.string :poster, null: false
      t.string :indication, null: false
      t.string :cost, null: false

      t.timestamps
    end
  end
end
