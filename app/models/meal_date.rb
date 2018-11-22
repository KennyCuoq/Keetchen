class MealDate < ApplicationRecord
  belongs_to :meal
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :date, uniqueness: true, presence: true

  def qr_code(user)
    # raise
    # Order.where("user_id = ?", current_user)
    # Order.uncached do
      order = user.orders.where("meal_date_id = ?", self)
      if order.nil?
        qr_generated = 'empty'
      else
        if !order.empty?
          qr_string = order[0].qr_code
          qr_generated = RQRCode::QRCode.new(qr_string, size: 4)
        else
          qr_generated = 'empty'
        end
      end
      return qr_generated
    # end
    # order[0].qr_code if !order.empty?
    # order ? order[0].id : 'DOGEEE'
    # hello[0].id
    # raise
  end


  def has_reviewed?(user)
    self.reviews.find_by(user_id: user.id)
  end
end
