class RemoveLocationFromEmployees < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :location, :string
  end
end
