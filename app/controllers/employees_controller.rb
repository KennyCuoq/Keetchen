class EmployeesController < ApplicationController

  def create
    @customer = Customer.find(params[:customer_id])
    @user = @customer.user
    @employee = Employee.new(user_id: @user.id)
    @employee.save
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def update_position
    @employee = Employee.find(params[:id])
    @employee.latitude = params["lat"]
    @employee.longitude = params["lng"]
    @employee.save!
    puts @employee.updated_at
    render json: { last_updated: @employee.updated_at.strftime('%H:%M:%S'), lat: @employee.latitude, lng: @employee.longitude}
    # @employee.latitude =
    # @employee.longitude =
    # @employee.save
  end

  def update
    @employee = Employee.find(params[:id])

    # find the employee
    # employee.update(cordrdssds)
    # binding.pry
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy!
  end

  private

  # def employee_params
  #   params.require(:employee).permit(:photo)
  # end
end
