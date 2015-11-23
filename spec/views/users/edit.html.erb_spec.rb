require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "MyString",
      :username => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_username[name=?]", "user[username]"

      assert_select "input#user_latitude[name=?]", "user[latitude]"

      assert_select "input#user_longitude[name=?]", "user[longitude]"
    end
  end
end
