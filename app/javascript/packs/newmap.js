function newMap() {
  'use strict';

  const target =document.getElementById('newTarget');
  const tokyo = {lat: 35.681167,lng: 139.767052};
  const geocoder = new google.maps.Geocoder();
  const placeAddress = document.getElementById('place_address');
  // id=targetにGoogleマップ作成し東京を描画する
  const map = new google.maps.Map(target, {
    center: tokyo,
    zoom: 12
  });

  // クリック位置にマーカー表示させ、マーカーをクリックするとウィンドウに緯度経度を表示
  map.addListener('click', function(e) {
    geocoder.geocode({location: e.latLng}, function(results, status){
      if(status === 'OK' && results[0]) {
        map.panTo(results[0].geometry.location);
        const marker = new google.maps.Marker({
          position: results[0].geometry.location,
          map: map,
          animation: google.maps.Animation.DROP,
        });
        // placeAddress.innerHTML = results[0].geometry.location;
        placeAddress.innerHTML = results[0].formatted_address;
        document.getElementById('lat').value=results[0].geometry.location.lat();
        document.getElementById('lng').value=results[0].geometry.location.lng();
        placeAddress.innerHTML = results[0].formatted_address;
      }else if(status === 'ZERO_RESULTS') {
        alert('不明なアドレスです： ' + status);
        return;
      }else{
        alert('失敗しました： ' + status);
        return;
      }
    });
  });

  // 検索するとそこの住所の地図が描画される
  document.getElementById('search').addEventListener('click', function() {
    geocoder.geocode({
      address: document.getElementById('address').value
      }, function(results, status) {
      if (status !== 'OK') {
        alert('Failed: ' + status);
        return;
      }
      if (results[0]) {
        map.panTo(results[0].geometry.location);
        map.setZoom(14);
      } else {
        alert('No results found');
        return;
      }
    });
  });

}

window.addEventListener("load", newMap);