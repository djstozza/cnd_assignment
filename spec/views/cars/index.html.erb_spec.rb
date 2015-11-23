require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        :latitude => 1.5,
        :longitude => 1.5
      ),
      Car.create!(
        :latitude => 1.5,
        :longitude => 1.5
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
