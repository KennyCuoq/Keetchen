
class OrdersController < ApplicationController
  before_action :determine_variables, only: [:new, :create]

   def index

   end

   def show
    @order = Order.find(params[:id])
    @text = @order.qr_code
    @qr = RQRCode::QRCode.new(@text, size: 4)
    # @png = @qr.as_png(
    #       resize_gte_to: false,
    #       resize_exactly_to: false,
    #       fill: 'white',
    #       color: 'black',
    #       size: 120,
    #       border_modules: 4,
    #       module_px_size: 6,
    #       file: 'mypicture.png'
          # file: '../assets/images/qrcodes/image.png'
          # )
    # @randomtext = Qrio::Qr.load('mypicture.png').qr.text
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
    @order.qr_code = (0...26).map { ('a'..'z').to_a[rand(26)] }.join
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
