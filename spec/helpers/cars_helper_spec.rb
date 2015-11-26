require 'rails_helper'
require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the CarsHelper. For example:
#
# describe CarsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CarsHelper, type: :helper do
  it "should use the Haversine formula to measure the distnace between the coordinates of a user and a car" do
  	user = FactoryGirl.build(:user, latitude: 65, longitude: 65)
  	car = FactoryGirl.build(:car, latitude: -32, longitude: -43)
 #  	def distance loc1, loc2
 #  		rad_per_deg = Math::PI/180
	#     moon_radius_km = 1737 
	#     dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg
	#     dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg
	#     lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
	#     lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }
	#     a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
	#     c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
	#     moon_radius_km * c
	# end
  	d = distance([user.latitude, user.longitude], [car.latitude, car.latitude])
  	expect(d).to eq 3686
  end
end
