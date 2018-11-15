class RenameDaysToMealDates < ActiveRecord::Migration[5.2]
  def change
    rename_table :days, :meal_dates
  end
end
