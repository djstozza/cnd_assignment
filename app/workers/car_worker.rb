class CarWorker
	include Sidekiq::Worker
	def perform
		base_uri = "https://cndlunarlocator.herokuapp.com/vehicles/"
	    ending = "/locate.json"
	    i = 0
	    arr = []
	   	# Since the index of all the cars is inaccessable (as far as I can tell), I needed to call each car individually using Curb (I found Curb to be a lot faster at curling the data from the API into my app than HTTParty).

	    # There are two types of responses that can occur by calling the LunarLocation API: (1) - A valid response in the form {"vehicle_id":1,"lat":34.41,"long":35.51}, which I parsed into the array as JSON or (2) - An invalid response, which occurs when no lunar vehicle exists {"message":"Resource not found"}.

	    # I used while loop to iterate through each response until an invalid response occurred. The valid responses were then parsed into an array as JSON.

	    while JSON.parse(Curl.get(base_uri + "#{i}" + ending).body_str)["message"] != "Resource not found"
	        response = JSON.parse(Curl.get(base_uri + "#{i}" + ending).body_str)
	        arr << response
	        i +=1
	    end

	    # I then compared the vehicle JSON data in the array to the cars in my database by matching a lunar vehicle's vehicle_id to a car's id (the vehicle_id is equivalent to a car id in my cars table).

	    # Once matched, one of three things can occur: (1) If there isn't a car with an id that matches the vehicle_id of the lunar vehicle in the API (i.e. it doesn't exist yet), then a car will be created and added to the cars table based on the lunar vehicle's JSON data. (2) If a car's id matches a lunar vehicles vehicle_id and the latitude and longitude are equivalent, it will skip to the next car since nothing needs to be updated. (3) if a car's id matches a lunar vehicle's vehicle_id but either the latitude or longitude don't match (the car has moved from it's listed position in the database), the car is destoryed and replaced with the lunar vehicle's JSON data a la option (1).

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