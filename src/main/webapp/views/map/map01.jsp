<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #map {
    width:400px;
    height:400px;
    border: 2px solid red;
  }
</style>

<script>
  let map01 = {
    map:null,
    init:function(){
      let mapContainer = document.querySelector('#map');
      let mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
      };
    //지도생성
    map = new kakao.maps.Map(mapContainer, mapOption);
    //우측상단 옵션 추가
    var mapTypeControl = new kakao.maps.MapTypeControl();
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    //마커 생성
    var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);
    var marker = new kakao.maps.Marker({
      position: markerPosition
      });
    marker.setMap(map);
    //마커에 온포커스 윈도우이벤트 생성
      var iwContent = '<img src="/img/a.jpg" style="width:80px;"/><div style="padding:5px;">Here!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
      var infowindow = new kakao.maps.InfoWindow({
        content : iwContent
      });
      kakao.maps.event.addListener(marker, 'mouseover', function() {
        infowindow.open(map, marker);
      });
      kakao.maps.event.addListener(marker, 'mouseout', function() {
        infowindow.close();
      });
      kakao.maps.event.addListener(marker, 'clic', function() {
        location.href='http://www.nate.com';
      });
      marker.setMap(map);
    }
  };
  $(function() {
    map01.init();
  })
</script>

<div class="col-sm-8 text-left">
  <div id="map01">
    <h3>MAP01</h3><br/>
    <div id="map">

    </div>
  </div>

</div>