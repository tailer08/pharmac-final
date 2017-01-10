class CreateMedicines < ActiveRecord::Migration[5.0]
  def change
    create_table :medicines do |t|
      t.string :generic
      t.string :brand
      t.float :price
      t.integer :quantity
      t.integer :usableQuantity, :default => 0
      t.integer :mg
      t.timestamps
    end
  end
end
