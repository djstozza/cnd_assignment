# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  username        :string
#  latitude        :float
#  longitude       :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :text
#

require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it  "has a valid factory" do
  	FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without an email" do
  	FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "is invalid without a username" do
  	FactoryGirl.build(:user, username: nil).should_not be_valid
  end

  it "is invalid without a latitude" do
  	FactoryGirl.build(:user, latitude: nil).should_not be_valid
  end

  it "is invalid without a longitude" do
  	FactoryGirl.build(:user, longitude: nil).should_not be_valid
  end

  it "is invalid without a password" do
  	FactoryGirl.build(:user, password: nil).should_not be_valid
  end
  #TODO testing uniqueness for email and username
end
