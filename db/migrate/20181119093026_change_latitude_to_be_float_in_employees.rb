class ChangeLatitudeToBeFloatInEmployees < ActiveRecord::Migration[5.2]
  def change
    change_column :employees, :latitude, :float
  end
end
