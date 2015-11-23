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

class User < ActiveRecord::Base
	has_secure_password

	acts_as_mappable	:default_units => :kms,
						:default_formula => :sphere,
						:distance_field_name => :distance
end
