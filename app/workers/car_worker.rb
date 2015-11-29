class CarWorker
	include Sidekiq::Worker
	def perform
		base_uri = "https://cndlunarlocator.herokuapp.com/vehicles/"
	    ending = "/locate.json"

	    i = 0
	    arr = []
	    while JSON.parse(Curl.get(base_uri + "#{i}" + ending).body_str)["message"] != "Resource not found"
	        response = JSON.parse(Curl.get(base_uri + "#{i}" + ending).body_str)
	        arr << response
	        i +=1
	    end

	    arr.each_with_index do |car, i|
	        vehicle = Car.where(:id => i).first
	        if vehicle.present? && vehicle.latitude == car['latitude'] && vehicle.longitude == car['longitude']
	          	next
	        elsif vehicle.present? && (vehicle.latitude != car['latitude'] || vehicle.longitude != car['longitude'])
	          	vehicle.destroy
	          	Car.create :id => car["vehicle_id"], :latitude => car["lat"], :longitude => car["long"]
	          	i+=1
	        else
	          	Car.create :id => car["vehicle_id"], :latitude => car["lat"], :longitude => car["long"]
	          	i+=1
	        end
	    end
	end
end