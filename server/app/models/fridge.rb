class Fridge < ApplicationRecord
  validates :user, presence: true

  belongs_to :user
  has_many :foods
end
