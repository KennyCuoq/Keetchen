class Review < ApplicationRecord
  belongs_to :meal_date
  belongs_to :user
  validates :meal_date_id, :user_id, :rating, presence: true
end
