json.array!(@menu_items) do |menu_item|
  json.extract! menu_item, :id, :restaurant_id, :item_name, :item_desc, :price
  json.url menu_item_url(menu_item, format: :json)
end
