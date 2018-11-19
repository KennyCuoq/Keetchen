class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
  end


  def my_orders
    @customer = Customer.find(params[:id])
    @user = @customer.user
    @orders = @user.orders
    # @meal_dates = @orders.meal_dates
    # @meals = @meal_dates.meal

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy!

  end

  private

  def customer_params
    params.require(:customer).permit(:photo)
  end

end
