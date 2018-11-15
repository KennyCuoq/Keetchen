class Order < ApplicationRecord
  belongs_to :meal_date
  belongs_to :user
  validates :user_id, :meal_date_id, :status, :quantity, :pre_order, presence: true
  validates :qr_code, uniqueness: true
end
