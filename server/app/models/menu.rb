class Menu < ApplicationRecord
  self.primary_key = :menu_id

  validates :name, presence: true
  validates :img, presence: true, uniqueness: true
  validates :medium_img, presence: true, uniqueness: true
  validates :small_img, presence: true, uniqueness: true
  validates :title, presence: true
  validates :menu_id, presence: true, uniqueness: true
  validates :content, presence: true
  validates :url, presence: true, uniqueness: true
  validates :poster, presence: true
  validates :indication, presence: true
  validates :cost, presence: true

  has_many :ingredients
end
