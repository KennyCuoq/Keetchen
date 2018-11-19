class EmployeesController < ApplicationController
  def index
  end

  def show
    @employee = Employee.find(params[:id])
  end
end
