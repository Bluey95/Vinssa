class AddSupplierToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :supplier, :boolean
  end
end
