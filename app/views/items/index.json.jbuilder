json.array!(@items) do |item|
  json.extract! item, :id, :name, :category, :uom
  json.url item_url(item, format: :json)
end
