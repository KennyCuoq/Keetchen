class MealDatesController < ApplicationController
  def index
    @meal_dates = MealDate.where("date >= ?", (Date.today + 1))
    @meal_dates = MealDate.where("date < ?", (Date.today + 5))

    # @boats = @boats.where("daily_price < ?", params[:filter_price].to_i)
    # set_price
  end

  private

  # def qr_code
  #   @orders = Order.all

  # end

  # def set_price
  #   @meal_dates.each do |meal_date|
  #     if meal_date.date == Date.today
  #       # @price = meal_date.meal.pre_order_price
  #       @price = 5
  #       # binding.pry
  #     else
  #       # @price = meal_date.meal.day_price
  #       @price = 0
  #     end
  #   end
  # end

  # def set_date_format
  #   @meal_dates.map do |meal_date|
  #     meal_dates.date.strftime
  #   end
  # end
end
