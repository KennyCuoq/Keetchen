class MealsController < ApplicationController
  def new
    @meal = Meal.new()
  end

  def create
    @meal = Meal.new(meal_params)
      if @meal.save
      redirect_to meals_path
    else
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :photo)
  end
end
