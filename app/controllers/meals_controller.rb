class MealsController < ApplicationController
  def new
    @meal = Meal.new()
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to admin_customer_path(current_user.customer)
    else
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:date, :meal_id)
  end
end
