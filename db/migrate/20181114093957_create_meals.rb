class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.integer :day_price
      t.integer :pre_order_price

      t.timestamps
    end
  end
end
