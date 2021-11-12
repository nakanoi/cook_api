class Category < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true
  validates :url, presence: true
  validates :query, presence: true
end
