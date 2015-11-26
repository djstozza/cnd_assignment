# == Schema Information
#
# Table name: cars
#
#  id         :integer          not null, primary key
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Car < ActiveRecord::Base
	validates :id, :presence => true, :uniqueness => true
	validates :latitude, :presence => true
	validates :longitude, :presence => true
end
