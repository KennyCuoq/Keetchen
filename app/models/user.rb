class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :meal_dates, through: :orders
  has_many :meals, through: :meal_dates
  has_many :reviews, dependent: :destroy
  has_one :customer, dependent: :destroy
  has_one :employee, dependent: :destroy
  validates :first_name, :last_name, :email, presence: true

  after_create :create_customer


  def create_customer
    @customer = Customer.new(user_id: self.id)
    @customer.save
  end

end
