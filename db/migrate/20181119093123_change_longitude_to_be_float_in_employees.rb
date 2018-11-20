class ChangeLongitudeToBeFloatInEmployees < ActiveRecord::Migration[5.2]
  def change
    change_column :employees, :longitude, :float
  end
end
