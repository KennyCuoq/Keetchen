class MealDate < ApplicationRecord
  belongs_to :meal
  has_many :orders, dependent: :destroy
  validates :date, uniqueness: true, presence: true
end
