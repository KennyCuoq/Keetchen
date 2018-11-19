class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

<<<<<<< HEAD
 def show
  @customer = Customer.find(params[:id])
 end

 def index
  @customers = Customer.all
 end
=======
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
  end

  def customer_params
    params.require(:customer).permit(:photo)
  end
>>>>>>> 85ce00c22c51215586bdef8cf02835ceabcf64f2
end
