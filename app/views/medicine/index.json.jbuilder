json.array!(@medicines) do |medicine|
  json.extract! medicine, :id, :generic, :brand, :price, :quantity, :mg
  json.url medicine_url(medicine, format: :json)
end
