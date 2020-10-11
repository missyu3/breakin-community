function initMap() {
  'use strict';

  const target =document.getElementById('target');
  const tokyo = {lat: 35.681167,lng: 139.767052};
  const geocoder = new google.maps.Geocoder();

  // id=targetにGoogleマップ作成し東京を描画する
  const map = new google.maps.Map(target, {
    center: tokyo,
    zoom: 9,
    clickableIcons: false
  });

  // クリック位置にマーカー表示させ、マーカーをクリックするとウィンドウに緯度経度を表示
  // map.addListener('click', function(e) {
  //   var marker = new google.maps.Marker({
  //     position: e.latLng,
  //     map: this,
  //     animation: google.maps.Animation.DROP
  //   });
  //   var infoWindow = new google.maps.InfoWindow({
  //     // content: e.latLng.toString()
  //     content: `詳細ページはこちら`
  //   });
  //   marker.addListener('click', function() {
  //     infoWindow.open(map, marker);
  //   });
  //   });

  // 大阪・北海道などの代表的な場所の地図を表示させる
  const samples = document.getElementsByClassName("sample");
  const sampleA = Array.from(samples);
  sampleA.forEach(function (sample) {
    sample.addEventListener("click", (e) => { 
      geocoder.geocode({
          address: sample.innerHTML
        }, function(results, status) {
          if (status !== 'OK') {
            alert('Failed: ' + status);
            return;
          }
          if (results[0]) {
              map.panTo(results[0].geometry.location);
              map.setZoom(7);
          } else {
            alert('No results found');
            return;
          }
      });
    });
  });

  // データベースに登録されている練習場所全てにマーカーを立て、クリックするとウィンドウが出る
  const places = document.getElementsByClassName("practicePlace");
  const chats = document.getElementsByClassName("practiceChat");
  const lats = document.getElementsByClassName("practiceLat");
  const lngs = document.getElementsByClassName("practiceLng");
  const placesArray = Array.from(places);
  const latArray = Array.from(lats);
  const lngArray = Array.from(lngs);
  const placeShows =document.getElementsByClassName("place-show");
  const placeShowsArray = Array.from(placeShows);
  // 登録された練習場所の数だけ行う
  for(let i = 0; i < placesArray.length; i++){
    const latLng = {
          lat: parseFloat(latArray[i].innerHTML),//緯度
          lng: parseFloat(lngArray[i].innerHTML),//経度
        };
    // その地点の緯度経度をもとに住所を表示する
    setTimeout(function () {
    geocoder.geocode({
      address: placesArray[i].innerHTML,
      // location: latLng
    }, function (results, status) {
      if (status !== 'OK') {
        alert('Failed: ' + status);
        return;
      }
          if (results[0]) {
            const marker = new google.maps.Marker({
              position: results[0].geometry.location,
              map: map,
              animation: google.maps.Animation.DROP
            });
            const infoWindow = new google.maps.InfoWindow({
              content: `${chats[i].innerHTML}`
            });
            marker.addListener('click', function() {
              infoWindow.open(map, marker);
              for(let i = 0; i < placesArray.length; i++){
                if (placeShowsArray[i].getAttribute("style") == "display:flex;") {
                  placeShowsArray[i].setAttribute("style", "display:none;");
                }
              }
              placeShowsArray[i].setAttribute("style", "display:flex;");
            });
          }
        })
      }, 200 * i);
  }

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
        map.setZoom(10);
      } else {
        alert('No results found');
        return;
      }
    });
  });
}

window.addEventListener("load", initMap);