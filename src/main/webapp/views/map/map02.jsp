<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #map02 > #map {
    width:400px;
    height:400px;
    border: 2px solid red;
  }
</style>
<script>
  let map02 = {
    map: null,
    init: function () {
      this.display();
      $('#s_btn').click(function(){
        map02.go(37.572209, 126.976814);
      });
      $('#b_btn').click(function(){
        map02.go(35.157439, 129.059139);
      });
      $('#j_btn').click(function(){
        map02.go(33.361666, 126.529166);
      });
    },
    display: function() {
      let mapContainer = document.querySelector('#map02 > #map');
      let mapOption = {
        center: new kakao.maps.LatLng(37.544969, 127.056497), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
      };
      //지도생성
      map = new kakao.maps.Map(mapContainer, mapOption);
      //우측상단 옵션 추가
      var mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
      // 마커생성
      var markerPosition  = new kakao.maps.LatLng(37.544969, 127.056497);
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(map);
    },
    go: function(lat, lng) {
        // 이동할 위도 경도 위치를 생성합니다
        var moveLatLon = new kakao.maps.LatLng(lat, lng);

        // 지도 중심을 부드럽게 이동시킵니다
        // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
        map.panTo(moveLatLon);

        var markerPosition  = new kakao.maps.LatLng(lat, lng);
        var marker = new kakao.maps.Marker({
          position: markerPosition
        });
        marker.setMap(map);
    }
  }

  $(function() {
    map02.init();
  })
</script>

<div class="col-sm-8 text-left">
  <div id="map02">
    <h3>MAP02</h3><br/>
    <button type="button" class="btn btn-primary" id="s_btn">Seoul</button>
    <button type="button" class="btn btn-primary" id="b_btn">Busan</button>
    <button type="button" class="btn btn-primary" id="j_btn">Jeju</button>
    <div id="map">

    </div>
  </div>
</div>