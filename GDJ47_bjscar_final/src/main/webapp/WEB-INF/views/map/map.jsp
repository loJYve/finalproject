<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bjscar.rentalshop.model.vo.Rentalshop" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
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