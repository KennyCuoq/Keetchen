class Employee < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  attr_accessor :refill_amount

end
