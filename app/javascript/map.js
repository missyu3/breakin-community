function initMap() {
  'use strict';

  var target =document.getElementById('target');
  var map;
  var tokyo = {lat: 35.681167,lng: 139.767052};
  var geocoder = new google.maps.Geocoder();

  map = new google.maps.Map(target, {
    center: tokyo,
    zoom: 15
  });

  map.addListener('click', function(e) {
    var marker = new google.maps.Marker({
      position: e.latLng,
      map: this,
      animation: google.maps.Animation.DROP
    });
    var infoWindow = new google.maps.InfoWindow({
      content: e.latLng.toString()
    });
    marker.addListener('click', function() {
      infoWindow.open(map, marker);
    });
    });

  document.getElementById('search').addEventListener('click', function() {
    geocoder.geocode({
      address: document.getElementById('address').value
    }, function(results, status) {
      if (status !== 'OK') {
        alert('Failed: ' + status);
        return;
      }
      if (results[0]) {
        new google.maps.Map(target, {
          center: results[0].geometry.location,
          zoom: 13
        })
      } else {
        alert('No results found');
        return;
      }
  });
});
}

window.addEventListener("load", initMap);