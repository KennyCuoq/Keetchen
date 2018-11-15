class Order < ApplicationRecord
  belongs_to :meal_date
  belongs_to :user
end
