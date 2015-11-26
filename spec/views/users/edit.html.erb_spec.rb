require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "MyString",
      :username => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :password => "12345678",
      :password_confirmation => "12345678"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_username[name=?]", "user[username]"

      assert_select "input#user_latitude[name=?]", "user[latitude]"

      assert_select "input#user_longitude[name=?]", "user[longitude]"

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"
    end
  end
end
