class AddMedTypeToMedicines < ActiveRecord::Migration[5.0]
  def change
    add_column :medicines, :medType, :string
    add_column :medicines, :classification, :string
  end
end
