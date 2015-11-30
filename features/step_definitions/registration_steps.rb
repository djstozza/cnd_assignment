Given(/^I am on the sign up page$/) do
  visit '/users/new'
end

When(/^I sign up as a user with email '(.*)'$/) do |email|
  fill_in 'Email', :with => 'test@example.com'
  find('input#user_username').set('test')
  find('input#user_latitude').set('12.434')
  find('input#user_longitude').set('54.23')
  fill_in 'Password', :with => 'password'
  fill_in 'Password confirmation', :with => 'password'
  find('input#sign-up').click
end

Then(/^I should have an account$/) do
  assert_equal 1, User.count
end

Given(/^I am on the login page$/) do
  visit '/login'
end

Given(/^I have already registered as '(.*)'$/) do |email|
  User.create :email => 'test@example.com', :username => 'test', :latitude => '12.434', :longitude => '54.23', :password => 'password', :password_confirmation => 'password'
end

When(/^I login with '(.*)'$/) do |email|
  fill_in 'Email', :with => email
  fill_in 'Password', :with => 'password'
  find('input#sign-in').click
end

Then (/I should be on the '(.*)' page/) do |page_name|
  assert page.current_path == ("#{page_name.downcase.gsub(' ','_')}_path")
end