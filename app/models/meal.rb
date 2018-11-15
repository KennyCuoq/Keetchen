class Meal < ApplicationRecord
  has_many :meal_dates
  has_many :orders, through: :meal_dates
  has_many :users, through: :orders
  has_many :customers, through: :users
  has_many :reviews
#   has_many :orders, through: :meal_dates
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :photo, presence: true
end
