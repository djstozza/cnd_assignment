# == Schema Information
#
# Table name: cars
#
#  id         :integer          default(0)
#  vehicle_id :integer
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Car < ActiveRecord::Base
end
