class MealDate < ApplicationRecord
  belongs_to :meal
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :date, uniqueness: true, presence: true
end
