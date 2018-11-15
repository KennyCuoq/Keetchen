class Employee < ApplicationRecord
  belongs_to :user
  validates :admin, :user_id, presence: true
end
