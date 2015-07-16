json.array!(@warehouses) do |warehouse|
  json.extract! warehouse, :id, :name, :location
  json.url warehouse_url(warehouse, format: :json)
end
