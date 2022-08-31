class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, :measurement_unit, :price, :quantity, presence: true
  validates :name, length: { maximum: 25 }
  validates :measurement_unit, length: { maximum: 5 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
