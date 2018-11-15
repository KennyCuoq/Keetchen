class AddPreOrderPriceToMeals < ActiveRecord::Migration[5.2]
  def change
    add_monetize :meals, :day_price, currency: { present: false }
  end
end
