json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :quantity, :brand, :category
  json.url product_url(product, format: :json)
end
