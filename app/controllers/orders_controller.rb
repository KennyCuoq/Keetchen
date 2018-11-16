class OrdersController < ApplicationController
   def index

   end

   def show
   end

   def new
    @meal_date = MealDate.find(params[:meal_date_id])
    @order = Order.new()

   end

   def create
    @meal_date = MealDate.find(params[:meal_date_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @meal = @meal_date.meal
    @order.meal_date = @meal_date
    @order.pre_order = set_pre_order(@meal_date)
    @order.order_price_cents = set_order_price(@meal_date, @meal)
    @order.save
   end

   def update
   end

   private

  def order_params
    params.require(:order).permit(:quantity)
  end

  def set_pre_order(meal_date)
    meal_date.date != Date.today
  end

  def set_order_price(meal_date, meal)
    set_pre_order(meal_date) ? meal.pre_order_price_cents : meal.day_price_cents
  end

end
