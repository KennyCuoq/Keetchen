class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
  end

  def customer_params
    params.require(:customer).permit(:photo)
  end
end
