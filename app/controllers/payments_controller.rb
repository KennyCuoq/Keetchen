class PaymentsController < ApplicationController
   before_action :set_order

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.order_price_cents,
      description:  "Payment for teddy #{@meal.name} for order #{@order.id}",
      currency:     @order.order_price.currency
    )

    @order.update(payment: charge.to_json, state: 'paid')
    redirect_to meal_date_order_path(@order)

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_meal_date_order_payment_path(@order)
  end

  private

  def set_order
  @meal_date = MealDate.find(params[:meal_date_id])
  @order = current_user.orders.where(status: "Pending").find(params[:order_id])
  @meal = @meal_date.meal
  end

end
