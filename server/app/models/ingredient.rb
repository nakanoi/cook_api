class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :menu, :presence: true

  belongs_to :menu
end
