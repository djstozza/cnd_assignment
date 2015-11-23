require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :email => "MyString",
      :username => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_username[name=?]", "user[username]"

      assert_select "input#user_latitude[name=?]", "user[latitude]"

      assert_select "input#user_longitude[name=?]", "user[longitude]"
    end
  end
end
