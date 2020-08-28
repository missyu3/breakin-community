function initMap() {
  'use strict';

  const target =document.getElementById('target');
  const tokyo = {lat: 35.681167,lng: 139.767052};
  const geocoder = new google.maps.Geocoder();

  // id=targetにGoogleマップ作成し東京を描画する
  const map = new google.maps.Map(target, {
    center: tokyo,
    zoom: 8,
    clickableIcons: false
  });
  // 東京にマーカーを立てる
  // const markerA = new google.maps.Marker({
  //   position: tokyo,
  //   map: map,
  //   title: 'tokyo'
  // })
  // hiddennクラスで隠してあるlink_toを取得→たくさんのクラスの情報を取得して配列にしてそれぞれにマーカーを立てさせる
  // const about = document.getElementById("about") 
  // const saitama = {lat: 35.831167,lng: 139.667052};
  // 埼玉にマーカーを立てる
  // const markerB = new google.maps.Marker({
  //   position: saitama,
  //   map: map,
  //   title: about.innerHTML
  // })
  // 埼玉のマーカーをクリックするとウィンドウが表示され、link_toの中身を表示する
  // markerB.addListener('click', function() {
  //   const infoWindow = new google.maps.InfoWindow({
  //     // content: e.latLng.toString()
  //     content: about.innerHTML
  //   });
  //     infoWindow.open(map, markerB);
  // })

  // クリック位置にマーカー表示させ、マーカーをクリックするとウィンドウに緯度経度を表示
  // map.addListener('click', function(e) {
  //   var marker = new google.maps.Marker({
  //     position: e.latLng,
  //     map: this,
  //     animation: google.maps.Animation.DROP
  //   });
  //   var infoWindow = new google.maps.InfoWindow({
  //     // content: e.latLng.toString()
  //     content: `詳細ページはこちら${about.innerHTML}`
  //   });
  //   marker.addListener('click', function() {
  //     infoWindow.open(map, marker);
  //   });
  //   });

  // // たくさんのクラスの情報を取得して配列にしてそこの地図を描画させる
  const samples = document.getElementsByClassName("sample");
  const sampleA = Array.from(samples);
  sampleA.forEach(function (sample) {
    sample.addEventListener("click", (e) => { 
      // console.log(sample.innerHTML)
      // console.log(gon.places_address)
      geocoder.geocode({
          address: sample.innerHTML
        }, function(results, status) {
          if (status !== 'OK') {
            alert('Failed: ' + status);
            return;
          }
          if (results[0]) {
            new google.maps.Map(target, {
              center: results[0].geometry.location,
              zoom: 7
            })
          } else {
            alert('No results found');
            return;
          }
      });
    });
  });
  // たくさんのクラスの情報を取得して配列にしてそこにマーカーを立て、クリックするとウィンドウが出る
  const places = document.getElementsByClassName("practicePlace");
  const names = document.getElementsByClassName("practiceName");
  const chats = document.getElementsByClassName("practiceChat");
  const placeA = Array.from(places);
  // placeA.forEach(function (place) {
  // });
  for(let i = 0; i < placeA.length; i++){
    geocoder.geocode({
        address: placeA[i].innerHTML 
      }, function(results, status) {
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
          content: `${names[i].innerHTML} ${chats[i].innerHTML}`
          });
          marker.addListener('click', function() {
          infoWindow.open(map, marker);
          });
        } else {
          alert('No results found');
          return;
        }
    });
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
        new google.maps.Map(target, {
          center: results[0].geometry.location,
          zoom: 9
        })
      } else {
        alert('No results found');
        return;
      }
    });
  });
}

window.addEventListener("load", initMap);