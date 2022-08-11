<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bjscar.rentalshop.model.vo.Rentalshop" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
     <head>
     	<script type="module" src="./index.js"></script>
     	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
     </head>
     
    <input
      id="pac-input"
      class="controls"
      type="text"
      placeholder="Search Box"
    />
     
  <div id="map" style="width:100%; height: 100vh; margin-top : 5%"></div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHvjSqcmNdLlLaP9dPJilDm_XgPSnoAk8&callback=initMap&region=kr"></script> 
<input type="hidden" id="rs0">
     
     
<script>
 function initMap() {
	 const infoWindow=new google.maps.InfoWindow();
	 
	 const map=new google.maps.Map(document.getElementById("map"), {
         zoom: 13,
         center: { lat: 37.486440824 ,lng: 126.92809428	 }
     });
	 
	 const input = document.getElementById("pac-input");
	 
	  //여기서 문제 시작
 	  const searchBox = new google.maps.places.SearchBox(input);
	  
	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	  // Bias the SearchBox results towards current map's viewport.
	  map.addListener("bounds_changed", () => {
	    searchBox.setBounds(map.getBounds());
	  }); 
	  //
	
	$.get("${pageContext.request.contextPath}/map/searchRentalshop",
			data=>{
				console.log(data);
		data.filter(v=>{
			const marker=new google.maps.Marker({
				position:new google.maps.LatLng(v.latitude,v.longitude),
				map:map,
				animation: google.maps.Animation.DROP,
				label:v.rentalshopName,
				optimized: false,
			});
			
			
		
			marker.addListener("click",(e)=>{
				infoWindow.close();
				infoWindow.setContent(marker.getLabel()+v.rentalshopAddr+v.bmMember);
				infoWindow.open(marker.getMap(), marker);
			})
			
			
		});//filter닫음
		
	});	//ajax닫음
	
}
     
   </script>
     
     
     
     

	  
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>