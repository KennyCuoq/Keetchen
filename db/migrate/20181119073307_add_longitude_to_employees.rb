class AddLongitudeToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :longitude, :integer
  end
end
