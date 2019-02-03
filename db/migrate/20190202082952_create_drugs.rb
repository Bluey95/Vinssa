class CreateDrugs < ActiveRecord::Migration[5.2]
  def change
    create_table :drugs do |t|
      t.string :name
      t.integer :quantity
      t.integer :number
      t.decimal :price
      t.string :desc
      t.date :expiration

      t.timestamps
    end
  end
end
