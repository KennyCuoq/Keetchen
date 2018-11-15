class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.integer :day_price, :default => 5
      t.integer :pre_order_price, :default => 4.5

      t.timestamps
    end
  end
end
