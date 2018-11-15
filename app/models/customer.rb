class Customer < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  def orders
    self.user.orders
  end
end
