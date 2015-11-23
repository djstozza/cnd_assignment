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

RSpec.describe Car, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
