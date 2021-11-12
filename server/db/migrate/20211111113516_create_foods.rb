class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :store, null: false
      t.string :unit, null: false
      t.boolean :ignore, null: false, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
