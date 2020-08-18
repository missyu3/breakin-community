function initMap() {
  'use strict';

  const target =document.getElementById('target');
  const tokyo = {lat: 35.681167,lng: 139.767052};
  const geocoder = new google.maps.Geocoder();

  const map = new google.maps.Map(target, {
    center: tokyo,
    zoom: 8,
    clickableIcons: false
  });

  const markerA = new google.maps.Marker({
    position: tokyo,
    map: map,
    title: 'tokyo'
  })
  const about = document.getElementById("about") 
  const saitama = {lat: 35.831167,lng: 139.667052};
  const markerB = new google.maps.Marker({
    position: saitama,
    map: map,
    title: about.innerHTML
  })
  markerB.addListener('click', function() {
    const infoWindow = new google.maps.InfoWindow({
      // content: e.latLng.toString()
      content: about.innerHTML
    });
      infoWindow.open(map, markerB);
  })

  // // クリック位置にマーカー表示させ、マーカーをクリックするとウィンドウに緯度経度を表示
  // map.addListener('click', function(e) {
  //   var marker = new google.maps.Marker({
  //     position: e.latLng,
  //     map: this,
  //     animation: google.maps.Animation.DROP
  //   });
  //   var infoWindow = new google.maps.InfoWindow({
  //     // content: e.latLng.toString()
  //     content: about.innerHTML
  //   });
  //   marker.addListener('click', function() {
  //     infoWindow.open(map, marker);
  //   });
  //   });

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