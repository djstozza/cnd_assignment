require 'faker'
FactoryGirl.define do
	factory :car do |f|
		f.id {Faker::Number.between(1, 100)}
		f.latitude {Faker::Address.latitude}
		f.longitude {Faker::Address.longitude}
	end
end