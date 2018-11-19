class CustomersController < ApplicationController

 def show
  @customer = Customer.find(params[:id])
 end

 def index
  @customers = Customer.all
 end
end
