class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.references :user, foreign_key: true
      t.boolean :admin, default: false
      t.integer :inventory
      t.string :location

      t.timestamps
    end
  end
end
