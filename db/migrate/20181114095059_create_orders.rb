class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :day, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status
      t.integer :quantity
      t.string :qr_code
      t.boolean :pre_order
      t.integer :order_price

      t.timestamps
    end
  end
end
