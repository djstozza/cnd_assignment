require 'faker'
FactoryGirl.define do
	factory :user do |f|
		f.email {Faker::Internet.email}
		f.username {Faker::Internet.user_name}
		f.latitude {Faker::Address.latitude}
		f.longitude {Faker::Address.longitude}
		f.password {Faker::Internet.password}
	end
end