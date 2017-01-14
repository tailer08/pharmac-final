class CreateMedicines < ActiveRecord::Migration[5.0]
  def change
    create_table :medicines do |t|
      t.string :generic
      t.string :brand
      t.float :price
      t.integer :quantity
      t.integer :available, :default => 0
      t.boolean :isExpiring, :default =>false
      t.integer :mg
      t.timestamps
    end
  end
end
