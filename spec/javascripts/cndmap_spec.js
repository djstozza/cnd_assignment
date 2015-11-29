describe('Working Haversine formula', function() {
  it("works out the shortest distance between two coordinates on a sphere", function() {
    var userLatLng = {lat: 65, lng: 65};
    var carLatLng = {lat: -32, lng: -43};
    expect(distance(userLatLng, carLatLng)).toBe('3829 km');
  });
});
