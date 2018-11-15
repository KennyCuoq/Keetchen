class Review < ApplicationRecord
  belongs_to :meal
  belongs_to :user
  validates :meal_id, :user_id, :rating, presence: true
end
