json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :city, :state, :packing_list, :category, :created_at, :updated_at, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :slug
  json.url suggestion_url(suggestion, format: :json)
end
