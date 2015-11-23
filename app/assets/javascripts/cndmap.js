initMap = function () {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 0, lng: 0},
    zoom: 1,
    streetViewControl: false,
    mapTypeControlOptions: {
      mapTypeIds: ['moon']
    }
  });

  var moonMapType = new google.maps.ImageMapType({
    getTileUrl: function(coord, zoom) {
      var normalizedCoord = getNormalizedCoord(coord, zoom);
      if (!normalizedCoord) {
        return null;
      }
      var bound = Math.pow(2, zoom);
      return '//mw1.google.com/mw-planetary/lunar/lunarmaps_v1/clem_bw' +
          '/' + zoom + '/' + normalizedCoord.x + '/' +
          (bound - normalizedCoord.y - 1) + '.jpg';
    },
    tileSize: new google.maps.Size(256, 256),
    maxZoom: 9,
    minZoom: 0,
    radius: 1738000,
    name: 'Moon'
  });
  

  map.mapTypes.set('moon', moonMapType);
  map.setMapTypeId('moon');
  if ($('div.mapShow').length > 0) {
    var carLatLng = {lat: gon.car.latitude, lng: gon.car.longitude};

    var marker = new google.maps.Marker({
      position: carLatLng,
      map: map,
      title: 'Vehicle ' + gon.car.vehicle_id
    });
    marker.setMap(map);

    var contentString = '<div id="content">'+
        '<div id="siteNotice">'+
        '</div>'+
        '<h2 id="firstHeading" class="firstHeading">Vehicle ' + gon.car.vehicle_id +'</h2>'+
        '<div id="bodyContent">'+
        '<p><b>Latitude:</b> ' + gon.car.latitude + ', <b>Longitude:</b> ' + gon.car.longitude + '</p>'+
        '</div>'+
        '</div>';

    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });

    marker.addListener('click', function() {
      infowindow.open(map, marker);
    });
  }

  if ($('div.indexMap').length > 0) {
    _.each(gon.cars, function (car) {
    var carLatLng = {lat: car.latitude, lng: car.longitude};

    var marker = new google.maps.Marker({
      position: carLatLng,
      map: map,
      title: 'Vehicle ' + car.vehicle_id
    });
    marker.setMap(map);

    var contentString = '<div id="content">'+
        '<div id="siteNotice">'+
        '</div>'+
        '<h2 id="firstHeading" class="firstHeading">Vehicle ' + car.vehicle_id +'</h2>'+
        '<div id="bodyContent">'+
        '<p><b>Latitude:</b> ' + car.latitude + ', <b>Longitude:</b> ' + car.longitude + '</p>'+
        '</div>'+
        '</div>';

    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });

    marker.addListener('click', function() {
      infowindow.open(map, marker);
    }); 
  })

  }
  
}


// Normalizes the coords that tiles repeat across the x axis (horizontally)
// like the standard Google map tiles.
getNormalizedCoord = function (coord, zoom) {
  var y = coord.y;
  var x = coord.x;

  // tile range in one direction range is dependent on zoom level
  // 0 = 1 tile, 1 = 2 tiles, 2 = 4 tiles, 3 = 8 tiles, etc
  var tileRange = 1 << zoom;

  // don't repeat across y-axis (vertically)
  if (y < 0 || y >= tileRange) {
    return null;
  }

  // repeat across x-axis
  if (x < 0 || x >= tileRange) {
    x = (x % tileRange + tileRange) % tileRange;
  }

  return {x: x, y: y};
}