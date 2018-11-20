class AddLatitudeToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :latitude, :integer
  end
end
