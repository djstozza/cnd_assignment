require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up (FactoryGirl.build(:user))
    expect(page).to have_content('Log out')
  end

  scenario 'with invalid email' do
    sign_up (FactoryGirl.build(:user, email: nil))

    expect(page).to have_content("1 error prohibited this user from being saved: Email can't be blank")
  end

  scenario 'with blank password' do
    sign_up (FactoryGirl.build(:user, password: nil))

    expect(page).to have_content("1 error prohibited this user from being saved: Password can't be blank")
  end

  def sign_up user
    visit new_user_path
    find('input#user_email').set(user.email)
    find('input#user_username').set(user.username)
    find('input#user_latitude').set(user.latitude)
    find('input#user_longitude').set(user.longitude)
    find('input#user_password').set(user.password)
    find('input#user_password_confirmation').set(user.password)
    find('input#sign-up').click
  end
end