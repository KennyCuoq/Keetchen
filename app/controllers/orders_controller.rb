class OrdersController < ApplicationController
  before_action :determine_variables, only: [:new, :create]

   def index
   end

   def confirm

    unless current_user.employee.nil?
    @qr_text = params[:qr]
    @order = Order.find_by(qr_code: @qr_text)
    if @order.nil?
      render json: {msg: "No record", qr_code: @qr_text, order: @order.to_json}
    elsif @order.status == "Picked up"
      render json: {msg: "Already used", qr_code: @qr_text, order: @order.to_json}
    else
      if @order.meal_date.date == Date.today
        @order.status = "Picked up"
        @order.save
        render json: {msg: "confirmed", qr_code: @qr_text, order: @order.to_json, name: @order.user.full_name, quantity: @order.quantity, date: @order.meal_date.date, meal: @order.meal_date.meal.name, photo: @order.user.customer.photo.url}
        current_user.employee.inventory -= 1
        current_user.employee.save!
        broadcast_order_updates
      else
        render json: {msg: "not today", qr_code: @qr_text, order: @order.to_json, name: @order.user.full_name, quantity: @order.quantity, date: @order.meal_date.date, meal: @order.meal_date.meal.name, photo: @order.user.customer.photo.url}
      end
    end
    else
      render json: {msg: "Your not allowed to perform this action"}
    end
   end

   def show
    @order = Order.find(params[:id])
    @text = @order.qr_code
    @qr = RQRCode::QRCode.new(@text, size: 4)
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
    # redirect_to meal_date_order_path(@meal_date, @order)
    # redirect_to meal_dates_path
    redirect_to new_meal_date_order_payment_path(@meal_date, @order)
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

  def broadcast_order_updates
    ActionCable.server.broadcast("update_channel_#{@order.user.id}", {
        # status_partial: ApplicationController.renderer.render (
        #   partial: "meal_dates/order_status",
        #   locals: { meal_date: @order.meal_date}
        # ),
        meal_date_id: @order.meal_date.id
      })
  end


end
