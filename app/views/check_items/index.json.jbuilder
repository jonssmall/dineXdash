json.array!(@check_items) do |check_item|
  json.extract! check_item, :id, :restaurant_id, :item_name, :item_desc, :price
  json.url check_item_url(check_item, format: :json)
end
