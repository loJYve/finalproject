<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bjscar.rentalshop.model.vo.Rentalshop" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	
<%-- 	<c:forEach items="${rl }" var="b">
	   				<tr>
	   					<td>${ b.rentalshopId }</td>
	   					<td>${ b.rentalshopName }</td>
	   					<td> ${b.rentalshopAddr }<br></td>
	       				
	       			</tr>
     </c:forEach> --%>
  <div style="height: 130vh">
  		<div id="map" style="width:100%; height: 100vh; margin-top : 5%"></div>
  </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHvjSqcmNdLlLaP9dPJilDm_XgPSnoAk8&callback=initMap&region=kr"></script> 
<input type="hidden" id="rs0">
     
     
<script>

<%-- const rs = new Array(5);
	for (let i = 0; i < rs.length; i++) {
	      rs[i] = new Array(rs);
  	}
 
	$(()=>{
	  $.ajax({
				
		  	url:"<%=request.getContextPath()%>/map/searchRentalshop",
			success:data=>{
				console.log(data);
				console.log(data.length);
				//var station = new Array();
				console.log(1);
				let j = 0;
				data.forEach(v=>{
				let rentalShopId=v.${rentalshopId};
				let rentalShopName=v['rentalShopName'];
				let latitude=v['latitude'];
				let longitude=v['longitude'];
				let rentalShopAddress =v['rentalShopAddress'];
				//$("#crtfcNoCk").val(data);
				rs[j][0] = rentalShopId;
				rs[j][1] = rentalShopName;
				rs[j][2] = latitude;
				rs[j][3] = longitude;
				rs[j][4] = rentalShopAddress;
				j++;
				
			});
				  console.log(rs[1][1]);
				  initMap();
		}
				
	  })

  })  
  
 --%>
	
 function initMap() {
	
	 //검색기능, 링크로 페이지 이동 추가
	 
	 
	 const infoWindow=new google.maps.InfoWindow();
	 
	 const map=new google.maps.Map(document.getElementById("map"), {
         zoom: 13,
         center: { lat: 37.486440824 ,lng: 126.92809428	 }
     });
	 
	
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
			
			
			/* 
			const locations=[
				{lat: v.latitude, lng: v.longitude}
		];		
		 */
		
		//합쳐진 점 숫자로 보기

			/* 
		
		const markers = locations.map((position, j) => {
			    //const label =  labels[j % labels.length];
			    const marker = new google.maps.Marker({
			      position,
			      label:v.rentalshopName,
			    });
		  new MarkerClusterer({ markers, map });
		  */
		 
		marker.addListener("click",(e)=>{
			infoWindow.close();
			infoWindow.setContent(marker.getLabel()+v.rentalshopAddr+v.bmMember);
			infoWindow.open(marker.getMap(), marker);
			})
			
		/* 
		 map.addListener("center_changed", () => {
			    // 3 seconds after the center of the map has changed, pan back to the
			    // marker.
			    window.setTimeout(() => {
			      map.panTo(marker.getPosition());
			    }, 3000);
			  }); */
		
		
			
		});//filter닫음
		
	});	//ajax닫음
	//new MarkerClusterer({ marker, map });
}
 
	 /*  //console.log($("#rs0").val());
	  console.log(rs[0][1]);
     
	  const seoul = { lat: 37.5642135 ,lng: 127.0016985 };
      const station1 =new google.maps.LatLng(rs[0][2], rs[0][3]);
      const station2 = new google.maps.LatLng(rs[1][2], rs[1][3]);
      const station3 = new google.maps.LatLng(rs[2][2], rs[2][3]);
      const station4 = new google.maps.LatLng(rs[3][2], rs[3][3]);
      const station5 = new google.maps.LatLng(rs[4][2], rs[4][3]);
      
      const map = new google.maps.Map(
     	        document.getElementById('map'), {
    	        zoom: 15,
     	        center: station1
    	  });
        
      			     	        
        Marker1 = new google.maps.Marker({
      	    position: station1,
      	    map: map,
      	    title: rs[0][1]
      	  });*/
        
        /* Maker1.addEventListener("click",(e)=>{
      	  alert("이벤트");
        }); */
        /*
        Marker2 = new google.maps.Marker({
    	    position: station2,
    	    map: map,
    	    title: rs[1][1]
    	  });
        
        Marker3 =new google.maps.Marker({
    	    position: station3,
  	    map: map,
  	  	title: rs[2][1]
  	  });
    	  
        Marker4 =new google.maps.Marker({
    	    position: station4,
  	    map: map,
  	  	title: rs[3][1]
  	  });
  	  
        Marker5 = new google.maps.Marker({
    	    position: station5,
  	    map: map,
  	  	title: rs[4][1]
  	  });
     */
    //}
     
   </script>
     
     
     
     

	  
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>