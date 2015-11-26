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
	validates :id, :presence => true, :uniqueness => true
	validates :email, :presence => true, :uniqueness => true
	validates :username, :presence => true, :uniqueness => true
	validates :latitude, :presence => true
	validates :longitude, :presence => true
end
