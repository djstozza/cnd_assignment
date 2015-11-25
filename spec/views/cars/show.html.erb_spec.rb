require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :vehicle_id => 1,
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
