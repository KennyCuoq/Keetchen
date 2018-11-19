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

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy!
  end

  private

  def customer_params
    params.require(:customer).permit(:photo)
  end

end
