<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bjscar.rentalshop.model.vo.Rentalshop" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>

/* 
 * Always set the map height explicitly to define the size of the div element
 * that contains the map. 
 */
#map {
  height: 100%;
}

/* 
 * Optional: Makes the sample page fill the window. 
 */
html,
body {
  height: 100%;
  margin: 0;
  padding: 0;
}

#description {
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
}

#infowindow-content .title {
  font-weight: bold;
}

#infowindow-content {
  display: none;
}

#map #infowindow-content {
  display: inline;
}

.pac-card {
  background-color: #fff;
  border: 0;
  border-radius: 2px;
  box-shadow: 0 1px 4px -1px rgba(0, 0, 0, 0.3);
  margin: 10px;
  padding: 0 0.5em;
  font: 400 18px Roboto, Arial, sans-serif;
  overflow: hidden;
  font-family: Roboto;
  padding: 0;
}

#pac-container {
  padding-bottom: 12px;
  margin-right: 12px;
}

.pac-controls {
  display: inline-block;
  padding: 5px 11px;
}

.pac-controls label {
  font-family: Roboto;
  font-size: 13px;
  font-weight: 300;
}

#pac-input {
  background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 400px;
}

#pac-input:focus {
  border-color: #4d90fe;
}

#title {
  color: #fff;
  background-color: #4d90fe;
  font-size: 25px;
  font-weight: 500;
  padding: 6px 12px;
}

#target {
  width: 345px;
}

</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script type="module" src="./index.js"></script>
  <div style="height: 100vh">
  		<div id="map" style="width:100%; height: 100vh; margin-top : 5%"></div>
  </div>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHvjSqcmNdLlLaP9dPJilDm_XgPSnoAk8&callback=initMap&region=kr"></script> 
<input type="hidden" id="rs0">
     
     
<script>

	
 function initMap() {
	
	 //검색기능, 링크로 페이지 이동 추가
	 //https://apis.map.kakao.com/web/sample/markerWithInfoWindow  참고
	 
	 const infoWindow=new google.maps.InfoWindow();
	 
	 const map=new google.maps.Map(document.getElementById("map"), {
         zoom: 12,
         center: { lat: 37.486440824 ,lng: 126.92809428	 }
     });
	 
	 
	$.get("${pageContext.request.contextPath}/map/mapRentalshop.do",
			data=>{
				console.log(data);
		data.filter(v=>{
			const marker=new google.maps.Marker({
				position:new google.maps.LatLng(v.latitude,v.longitude),
				map:map,
				animation: google.maps.Animation.DROP,
				label:v.rentalshopName,
				//content:v.rentalshopId,
				optimized: false,
			});
			
			
			 const iwContent = '<div style="padding:5px;"> 대여소명 : '+v.rentalshopName+'<br><a>주소 :' +v.rentalshopAddr+' </a><br><a href="/map/showRentalshop.do?no='+v.rentalshopId+'" style="color:blue" target="_blank">대여소 확인하기</a>'
			  marker.addListener("click",(e)=>{
				infoWindow.close();
				infoWindow.setContent(iwContent);
				infoWindow.open(marker.getMap(), marker);
			}); 
			 marker.addListener("click", () => {
				    map.setZoom(12);
				    map.setCenter(marker.getPosition());
				  });
			
		});//filter닫음

	});	//ajax닫음
	//new MarkerClusterer({ marker, map });
	
}
	/* 
 map.addListener("center_changed", () => {
	    // 3 seconds after the center of the map has changed, pan back to the
	    // marker.
	    window.setTimeout(() => {
	      map.panTo(marker.getPosition());
	    }, 3000);
	  }); 
	//합쳐진 점 숫자로 보기

const markers = locations.map((position, j) => {
	    //const label =  labels[j % labels.length];
	    const marker = new google.maps.Marker({
	      position,
	      label:v.rentalshopName,
	    });
  new MarkerClusterer({ markers, map });
  */
     
   </script>
     
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>