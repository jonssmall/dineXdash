json.array!(@checks) do |check|
  json.extract! check, :id, :user_id, :restaurant_id, :paid_at
  json.url check_url(check, format: :json)
end
