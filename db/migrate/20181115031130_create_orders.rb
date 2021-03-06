class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :meal_date, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status, default: 'Pending'
      t.integer :quantity, default: 1
      t.string :qr_code
      t.boolean :pre_order, default: false

      t.timestamps
    end
  end
end
