json.array!(@cars) do |car|
  json.extract! car, :id, :vehicle_id, :latitude, :longitude
  json.url car_url(car, format: :json)
end
