require 'rails_helper'

describe "the signin process", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', :password => 'password')
  end

  it "signs me in" do
    visit '/login'
    
    find('input#session_email').set('user@example.com')
    find('input#session_password').set('password')
  
    find('input#sign-in').click
    expect(page).to have_content 'Toggle navigation Sign In(current) Sign Up (Space)Car Next Door Email Password'
  end
end
