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

class Car < ActiveRecord::Base
	validates :vehicle_id, :presence => true, :uniqueness => true
	validates :latitude, :presence => true
	validates :longitude, :presence => true
	acts_as_mappable	:default_units => :kms,
						:default_formula => :sphere,
						:distance_field_name => :distance

end
