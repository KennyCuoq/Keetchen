class EmployeesController < ApplicationController

  def create
      @customer = Customer.find(params[:customer_id])
      @user = @customer.user
      @employee = Employee.new(user_id: @user.id)

    if @employee.save
      respond_to do |format|
        format.js
        format.html {redirect_to customers_path}
      end
    else
      respond_to do |format|
        format.js
        format.html {redirect_to customers_path}
      end
    end
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
    if @employee.destroy!
      respond_to do |format|
        format.js
        format.html {redirect_to customers_path}
      end
    else
      respond_to do |format|
        format.js
        format.html {redirect_to customers_path}
      end
    end

  end

  private

  # def employee_params
  #   params.require(:employee).permit(:photo)
  # end
end
