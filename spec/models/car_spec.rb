# == Schema Information
#
# Table name: cars
#
#  id         :integer          not null, primary key
#  vehicle_id :integer
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'
require 'spec_helper'

RSpec.describe Car, type: :model do
  it  "has a valid factory" do
  	FactoryGirl.create(:car).should be_valid
  end

  it "is invalid without a vehicle_id" do
  	FactoryGirl.build(:car, vehicle_id: nil).should_not be_valid
  end

  it "is invalid without a latitude" do
  	FactoryGirl.build(:car, latitude: nil).should_not be_valid
  end

  it "is invalid without a longitude" do
  	FactoryGirl.build(:car, longitude: nil).should_not be_valid
  end

  #TODO testing for uniqueness
end
