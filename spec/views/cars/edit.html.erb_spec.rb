require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :id => 1,
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(@car), "post" do

      assert_select "input#car_latitude[name=?]", "car[latitude]"

      assert_select "input#car_longitude[name=?]", "car[longitude]"
    end
  end
end
