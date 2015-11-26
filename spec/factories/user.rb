require 'faker'
FactoryGirl.define do
	factory :user do |f|
		f.id {Faker::Number.between(1, 100)}
		f.email {Faker::Internet.email}
		f.username {Faker::Internet.user_name}
		f.latitude {Faker::Address.latitude}
		f.longitude {Faker::Address.longitude}
		f.password {Faker::Internet.password}
	end
end