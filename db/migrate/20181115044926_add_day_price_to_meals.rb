class AddDayPriceToMeals < ActiveRecord::Migration[5.2]
  def change
    add_monetize :meals, :pre_order_price, currency: { present: false }
  end
end
