class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :menu, presence: true
  validates :menu_id_name, presence: true, uniqueness: true

  belongs_to :menu, primary_key: :menu_id
end
