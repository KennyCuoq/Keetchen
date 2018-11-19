class EmployeesController < ApplicationController

  def create
    @customer = Customer.find(params[:customer_id])
    @user = @customer.user
    @employee = Employee.new(user_id: @user.id)
    @employee.save
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
