<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main>
	<jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>
		<h2>대여 차량 정보</h2>
		<c:if test="${not empty rentalStatus }">
			
			<div style="display: flex;">
				<c:if test="${not empty carImage}"> 
					<div class="ratio ratio-1x1 ms-5" style="width: 40%">
						<img alt="" src="${carImage.originalFilename }">
					</div>
 				</c:if> 
				<c:if test="${empty carImage}">
					<div class="ratio ratio-1x1 ms-5" style="width: 35%">
						<img alt="" src="https://cdn.pixabay.com/photo/2016/12/19/15/50/car-1918554_960_720.png">
					</div>
 				</c:if>
				<div class="mt-5 ms-5" style="width: 40%">
					<h4>${carData.model }</h4>
					<h4>대여 시간 : ${rentalStatus.rentalDate }</h4>
					<h4>출발 대여소 : ${rentalshopData.rentalshopName }</h4>
					<h4>반납 예정 시간 : ${rentalStatus.returnDate }</h4>
					<div class="d-grid gap-2 col-6 mx-auto">
  						<button class="btn btn-secondary" type="button">반납 가능 대여소 조회하기!!</button>
  						<button class="btn btn-secondary" type="button">반납하기!!</button>
					</div>					
				</div>
			</div>
		</c:if> 
		
		 <c:if test="${empty rentalStatus }">
			<h3 class="text-center mt-5 mb-5">대여한 차량이 없습니다</h3>
			<div class="d-grid gap-2 col-6 mx-auto">
	  			<button class="btn btn-secondary" type="button">대여하러 가기!!</button>
			</div>	
		</c:if>
	</div>
</main>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>