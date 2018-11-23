class EmployeesController < ApplicationController

  def create
      @customer = Customer.find(params[:customer_id])
      @user = @customer.user
      @employee = Employee.new(user_id: @user.id, inventory: 0)
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

  def update
    @employee = Employee.find(params[:id])
    refill_inventory
    ActionCable.server.broadcast("employees_details_channel", {
      employee_id: @employee.id,
      infoWindow: ApplicationController.renderer.render(
        partial: "employees/map_window",
        locals: { employee: @employee }
      ),
      last_updated: @employee.updated_at.strftime('%H:%M:%S'),
      lat: @employee.latitude,
      lng: @employee.longitude,
      inv: @employee.inventory
    })
  end

  def update_position
    @employee = Employee.find(params[:id])
    @employee.latitude = params["lat"]
    @employee.longitude = params["lng"]
    @employee.save!
    ActionCable.server.broadcast("employees_details_channel", {
      employee_id: @employee.id,
      updateType: 'geo',
      infoWindow: ApplicationController.renderer.render(
        partial: "employees/map_window",
        locals: { employee: @employee }
      ),
      last_updated: @employee.updated_at.strftime('%H:%M:%S'),
      lat: @employee.latitude,
      lng: @employee.longitude,
      inv: @employee.inventory
    })
    render json: { last_updated: @employee.updated_at.strftime('%H:%M:%S'), lat: @employee.latitude, lng: @employee.longitude}
  end

  def refill_inventory
    @employee = Employee.find(params[:id])
    if @employee.inventory.nil?
      @employee.inventory = 0
    end
    unless params[:employee][:refill_amount].nil?
      @amount = params[:employee][:refill_amount]
      @employee.inventory += params[:employee][:refill_amount].to_i
      if @employee.save!
        respond_to do |format|
          format.js
          format.html {redirect_to admin_customer_path(@employee.user.customer)}
        end
      else
        respond_to do |format|
          format.js
          format.html {redirect_to admin_customer_path(@employee.user.customer)}
        end
      end
    end
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
