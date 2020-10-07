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

window.addEventListener('DOMContentLoaded', function getMap () {
  var postMap = (function() {
    function codeAddress(address) {
    // google.maps.Geocoder()コンストラクタのインスタンスを生成
    var geocoder = new google.maps.Geocoder();
    //マーカー変数用意
    var marker;
    // 地図表示に関するオプション
    var mapOptions = {
      zoom: 16
    };

    // 地図を表示させるインスタンスを生成
    var map = new google.maps.Map(document.getElementById("newpost"), mapOptions);
            // geocoder.geocode()メソッドを実行
            geocoder.geocode( { 'address': address}, function(results, status) {
              // ジオコーディングが成功した場合
              if (status == google.maps.GeocoderStatus.OK) {
                // 変換した緯度・経度情報を地図の中心に表示
                map.setCenter(results[0].geometry.location);
                //☆表示している地図上の緯度経度
                document.getElementById('lat').value=results[0].geometry.location.lat();
                document.getElementById('lng').value=results[0].geometry.location.lng();
                // マーカー設定
                marker = new google.maps.Marker({
                  map: map,
                  position: results[0].geometry.location
              });
            // ジオコーディングが成功しなかった場合
            } else {
              console.log('Geocode was not successful for the following reason: ' + status);
            }
    });

    // マップをクリックで位置変更
    map.addListener('click', function(e) {
            getClickLatLng(e.latLng, map);
    });
    function getClickLatLng(lat_lng, map) {
            //☆表示している地図上の緯度経度
            document.getElementById('lat').value=lat_lng.lat();
            document.getElementById('lng').value=lat_lng.lng();
            // マーカーを設置
            marker.setMap(null);
            marker = new google.maps.Marker({
              position: lat_lng,
              map: map,
              animation: google.maps.Animation.DROP
            });
            // 座標の中心をずらす
            map.panTo(lat_lng);
            }
    }

    //inputのvalueで検索して地図を表示
    return {
          getAddress: function() {
            // ボタンに指定したid要素を取得
            var button = document.getElementById("map_button");
            // ボタンが押された時の処理
            button.onclick = function() {
              // フォームに入力された住所情報を取得
              var address = document.getElementById("address").value;
              // 取得した住所を引数に指定してcodeAddress()関数を実行
              codeAddress(address);
            }
            //読み込まれたときに地図を表示
            window.onload = function(){
              // フォームに入力された住所情報を取得
              var address = document.getElementById("address").value;
              // 取得した住所を引数に指定してcodeAddress()関数を実行
              codeAddress(address);
              }
            }
          };
    })();
  postMap.getAddress();
  });