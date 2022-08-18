<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main>
	<jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>
		<h2>이전 예약 조회</h2>
		<c:if test="${not empty rentalHistory }">
			<table class="table">
		  		<thead>
		    		<tr>
						<th scope="col">No.</th>
						<th scope="col">예약 날짜</th>
						<th scope="col">차종</th>
						<th scope="col">상태</th>
		    		</tr>
		  		</thead>
		  		
		  		<tbody>
		  			<c:forEach var="rh" items="${rentalHistory }">
			    		<tr>
							<th scope="row"><a href="/mypage/rhdetail.do?rhId=${rh.rentalId }">${rh.rentalId }</a></th>
							<td>${rh.bookingDate }</td>
							<td>${rh.vehicleId }</td>
							<td>${rh.status }</td>
			    		</tr>
		    		</c:forEach>
		  		</tbody>
			</table>
		</c:if>
		<c:if test="${empty rentalHistory }">
			<h3 class="text-center mt-5 mb-5">예약 기록이 없습니다.</h3>
		</c:if>
		
		<div id="pageBar">${pageBar }</div>	
		
		
	</div>
</main>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>