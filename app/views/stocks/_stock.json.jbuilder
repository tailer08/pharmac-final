json.extract! stock, :id, :medId, :quantity, :price, :created_at, :updated_at
json.url stock_url(stock, format: :json)