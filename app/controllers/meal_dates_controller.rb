class MealDatesController < ApplicationController
  def index
    @meal_dates = MealDate.where("date >= ?", Date.today).first(5)
    @employees = Employee.where.not(latitude: nil, longitude: nil)
    @markers = @employees.map do |employee|
      {
        lng: employee.longitude,
        lat: employee.latitude,
        employee_id: employee.id,
        infoWindow: { content: render_to_string(partial: "/employees/map_window", locals: { employee: employee }) }
      }
    end
    # @boats = @boats.where("daily_price < ?", params[:filter_price].to_i)
    # set_price
  end

  def new
    @meal_date = MealDate.new()
  end

  def create
    @meal_date = MealDate.new(meal_date_params)
      if @meal_date.save
        redirect_to admin_customer_path(current_user.customer)
      else
          render :new
      end
    end


  private

  def meal_date_params
    params.require(:meal_date).permit(:date, :meal_id)
  end

  # def qr_code
  #   @orders = Order.all

  # end

  # def set_price
  #   @meal_dates.each do |meal_date|
  #     if meal_date.date == Date.today
  #       # @price = meal_date.meal.pre_order_price
  #       @price = 5
  #       # binding.pry
  #     else
  #       # @price = meal_date.meal.day_price
  #       @price = 0
  #     end
  #   end
  # end

  # def set_date_format
  #   @meal_dates.map do |meal_date|
  #     meal_dates.date.strftime
  #   end
  # end
end
