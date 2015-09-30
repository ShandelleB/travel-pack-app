json.array!(@destinations) do |destination|
  json.extract! destination, :id, :city, :state, :packing_list, :category
  json.url destination_url(destination, format: :json)
end
