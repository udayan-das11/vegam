json.array!(@item_wh_transacs) do |item_wh_transac|
  json.extract! item_wh_transac, :id, :warehouse_id, :item_id, :transac_date, :amount, :transac_type, :reference_stockout_usage, :responsible_person
  json.url item_wh_transac_url(item_wh_transac, format: :json)
end
