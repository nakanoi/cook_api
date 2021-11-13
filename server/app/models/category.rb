class Category < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :query, presence: true, uniqueness: true
end
