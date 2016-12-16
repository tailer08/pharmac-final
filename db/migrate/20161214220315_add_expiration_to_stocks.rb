class AddExpirationToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :expiration_date, :date
  end
end
