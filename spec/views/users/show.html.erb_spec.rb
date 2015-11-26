require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :id => 1,
      :email => "Email",
      :username => "Username",
      :latitude => 1.5,
      :longitude => 1.5,
      :password => "12345678",
      :password_confirmation => "12345678"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
