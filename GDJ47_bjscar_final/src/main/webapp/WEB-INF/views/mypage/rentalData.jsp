<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main>
	<jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>
		<h2>대여 차량 정보</h2>
		<c:if test="${not empty rentalDataList }">
			<c:forEach var="rd" items="${rentalDataList }">
				<div style="display: flex;">
					<c:if test="${not empty rd.carImage}"> 
						<div class="ratio ratio-1x1 ms-5" style="width: 40%">
							<img alt="" src="${rd.carImage }">
						</div>
	 				</c:if> 
					<c:if test="${empty rd.carImage}">
						<div class="ratio ratio-1x1 ms-5" style="width: 35%">
							<img alt="" src="https://cdn.pixabay.com/photo/2016/12/19/15/50/car-1918554_960_720.png">
						</div>
	 				</c:if>
					<div class="mt-5 ms-5" style="width: 40%">
						<h4>${rd.model }</h4>
						<%-- <h5>대여 시간 : ${rd.rentalDate }</h5> --%>
						<h5>대여 시간 : <fmt:formatDate value="${rd.rentalDate }" pattern="yyyy-MM-dd HH:mm:ss"/></h5>
						<h5>출발 대여소 : ${rd.rentalshopName }</h5>
						<%-- <h5>반납 시간 : ${rd.returnDate }</h5> --%>
						<fmt:formatDate var="returnDate" value="${rd.returnDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<h5>반납 시간 : ${returnDate }</h5>
						<div class="d-grid gap-2 col-6 mx-auto">
	  						<c:if test="${rd.status eq '예약완료'}">
	  							<button class="btn btn-secondary" type="button" onclick="location.assign('${path }/mypage/rental.do?rentalId=${rd.rentalId }&memberId=${loginMember.memberId }');">대여하기</button>
	  						</c:if>
	  						<c:if test="${rd.status eq '대여중'}">
	  							<button class="btn btn-secondary" type="button" onclick="location.assign('${path }/rental/returnVehicle.do?rentalId=${rd.rentalId }&returnDate=${returnDate }&memberId=${loginMember.memberId }&totalMileage=${loginMember.totalMileage }');">반납하기</button>
	  						</c:if>

						</div>					
					</div>
				</div>
			</c:forEach>
		</c:if> 
		
		 <c:if test="${empty rentalDataList }">
			<h3 class="text-center mt-5 mb-5">대여한 차량이 없습니다</h3>
			<div class="d-grid gap-2 col-6 mx-auto">
	  			<button class="btn btn-secondary" type="button">대여하러 가기!!</button>
			</div>	
		</c:if>
	</div>
</main>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>