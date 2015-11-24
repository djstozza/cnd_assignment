ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Car.destroy_all
base_uri = "https://cndlunarlocator.herokuapp.com/vehicles/"
ending = "/locate.json"

i = 0

until HTTParty.get(base_uri + "#{i}" + ending)["message"] == "Resource not found"
	response = HTTParty.get(base_uri + "#{i}" + ending)
	Car.create :vehicle_id => response["vehicle_id"], :latitude => response["lat"], :longitude => response["long"]
	i +=1	
end

User.destroy_all
u1 = User.create :email => "admin@cdn.com.au", :username => "admin", :password => "12345678", :latitude => "0.681400", :longitude => "23.460550"