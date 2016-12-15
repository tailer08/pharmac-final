class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.belongs_to :medicines, index: true
      t.integer :quantity
      t.integer :price
      t.date :expiration_date
      t.timestamps
    end
  end
end
