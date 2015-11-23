require 'rails_helper'

RSpec.describe "cars/new", type: :view do
  before(:each) do
    assign(:car, Car.new(
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new car form" do
    render

    assert_select "form[action=?][method=?]", cars_path, "post" do

      assert_select "input#car_latitude[name=?]", "car[latitude]"

      assert_select "input#car_longitude[name=?]", "car[longitude]"
    end
  end
end
