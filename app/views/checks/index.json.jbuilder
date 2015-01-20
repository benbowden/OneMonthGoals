json.array!(@checks) do |check|
  json.extract! check, :id, :pin_id, :check
  json.url check_url(check, format: :json)
end
