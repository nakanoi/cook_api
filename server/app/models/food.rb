class Food < ApplicationRecord
  validates :name, presence: true
  validates :store, presence: true
  validates :unit, presence: true
  validates :user, presence: true
  validates :token, presence: true

  belongs_to :user
end
