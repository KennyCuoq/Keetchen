class OrdersController < ApplicationController
  before_action :determine_variables, only: [:new, :create]

   def index

   end

   def show
   end

   def new
    @order = Order.new()
    @order.pre_order = set_pre_order(@meal_date)
    @order.order_price_cents = set_order_price(@meal_date, @meal)

   end

   def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.meal_date = @meal_date
    @order.pre_order = set_pre_order(@meal_date)
    @order.order_price_cents = set_order_price(@meal_date, @meal)
    @order.save
    redirect_to meal_date_order_path(@meal_date, @order)
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

  def determine_variables
    @meal_date = MealDate.find(params[:meal_date_id])
    @meal = @meal_date.meal
  end

end
