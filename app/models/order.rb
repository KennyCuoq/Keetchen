class Order < ApplicationRecord
  belongs_to :meal_date
  belongs_to :user
  validates :user_id, :meal_date_id, presence: true
  # validates :qr_code, uniqueness: true
  monetize :order_price_cents

end
