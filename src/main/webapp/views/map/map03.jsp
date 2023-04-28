<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #map {
    width:600px;
    height:400px;
    border: 2px solid red;
  }
</style>
<script>
  let map03 = {
    map: null,
    init: function () {
      this.display();
      $('#s_btn').click(function(){
        map03.go(37.572209, 126.976814, 's');
      });
      $('#b_btn').click(function(){
        map03.go(35.157439, 129.059139, 'b');
      });
      $('#j_btn').click(function(){
        map03.go(33.361666, 126.529166, 'j');
      });
    },
    display: function() {
      let mapContainer = document.querySelector('#map03 > #map');
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
    go: function(lat, lng, loc) {
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
      map03.markers(loc);
    },
    markers: function(loc){
      $.ajax({
        url:'/markers',
        data:{'loc':loc},
        success:function(data){
          map03.displaymarkers(data);
        }
      });
    },
    displaymarkers: function(positions) {

      var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
      for (var i = 0; i < positions.length; i ++) {
        var imageSize = new kakao.maps.Size(20, 30);
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
        var markerPosition = new kakao.maps.LatLng(positions[i].lat, positions[i].lng);

        var marker = new kakao.maps.Marker({
          map: map,
          position: markerPosition,
          title : positions[i].title,
          image : markerImage
        });
        // infoWindow
        var iwContent = '<h2>'+positions[i].title+'</h2>';
        iwContent += '<img src="/img/'+positions[i].img+'" style="width:50px">';

        var infowindow = new kakao.maps.InfoWindow({
          position : markerPosition,
          content : iwContent
        });

        kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
        kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].target));


        function mouseoverListener(marker, infowindow) {
          return function(){
            infowindow.open(map, marker);
          };
        }
        function mouseoutListener(marker, infowindow) {
          return function(){
            infowindow.close();
          };
        }
        function mouseclickListener(target) {
          return function(){
            location.href = target;
          };
        }

      } // end for
    }
  };

  $(function() {
    map03.init();
  })
</script>

<div class="col-sm-8 text-left">
  <div id="map03">
    <h3>MAP03</h3><br/>
    <button type="button" class="btn btn-primary" id="s_btn">Seoul</button>
    <button type="button" class="btn btn-primary" id="b_btn">Busan</button>
    <button type="button" class="btn btn-primary" id="j_btn">Jeju</button>
    <div id="map">

    </div>
  </div>
</div>