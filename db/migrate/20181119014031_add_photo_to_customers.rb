class AddPhotoToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :photo, :string
  end
end
