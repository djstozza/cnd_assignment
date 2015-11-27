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
  	d = distance([user.latitude, user.longitude], [car.latitude, car.latitude])
  	expect(d).to eq 3688
  end
end
