class EmployeesController < ApplicationController
  def index
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def update_position
    p 'HELLO'
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
end
