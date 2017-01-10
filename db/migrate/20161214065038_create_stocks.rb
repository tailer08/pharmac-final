class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.belongs_to :medicine, index: true
      t.integer :quantity
      t.float :price
      t.boolean :isActive, :default => true
    #  t.date :expiration_date
   #   t.string :medType
    #  t.string :classification
      t.timestamps
    end
  end
end
