class History < ApplicationRecord
  validates :user_id, presence: true
  validates :menu_id, presence: true
  validates :food, presence: true
  validates :day, presence: true

  belongs_to :user
  belongs_to :menu, primary_key: :menu_id
end
