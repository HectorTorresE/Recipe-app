class Recipe < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :cooking_time, :preparation_time, numericality: { greater_than: 0 }, presence: true
  has_many :recipe_foods
end
