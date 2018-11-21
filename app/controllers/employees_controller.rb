class EmployeesController < ApplicationController

  def create
      @customer = Customer.find(params[:customer_id])
      @user = @customer.user
      @employee = Employee.new(user_id: @user.id)
      @employee.save
    # if @employee.save
    #   respond_to do |format|
    #     format.html {redirect_to customers_path}
    #     format.js
    #   end
    # else
    #   respond_to do |format|
    #     format.html {redirect_to customers_path}
    #     format.js
    #   end
    # end
      redirect_to customers_path
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def update_position
    @employee = Employee.find(params[:id])
    @employee.latitude = params["lat"]
    @employee.longitude = params["lng"]
    @employee.save!
    render json: { last_updated: @employee.updated_at.strftime('%H:%M:%S'), lat: @employee.latitude, lng: @employee.longitude}
  end

  def refill_inventory
    @employee = Employee.find(params[:id])
    @employee.inventory = 50
    @employee.save!
    redirect_to employee_path(@employee)
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy!
    redirect_to customers_path
  end

  private

  # def employee_params
  #   params.require(:employee).permit(:photo)
  # end
end
