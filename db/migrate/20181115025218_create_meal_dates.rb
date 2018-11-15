class CreateMealDates < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_dates do |t|
      t.date :date
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
