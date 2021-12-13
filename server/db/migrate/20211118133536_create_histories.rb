class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :menu, null: false
      t.string :food, null: false
      t.date :day, null: false

      t.timestamps
    end
    add_foreign_key :histories, :menus, column: :menu_id, primary_key: :menu_id
  end
end
