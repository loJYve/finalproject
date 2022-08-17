<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main>
	<jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>
		<h2>결제 내역</h2>
		<c:if test="${not empty purchaseHistory }">
			<table class="table">
		  		<thead>
		    		<tr>
						<th scope="col">No.</th>
						<th scope="col">예약 날짜</th>
						<th scope="col">모델</th>
						<th scope="col">상태</th>
						<th scope="col">금액</th>
		    		</tr>
		  		</thead>
		  		
		  		<tbody>
		  			<c:forEach var="ph" items="${purchaseHistory }">
			    		<tr>
							<th scope="row">${ph.purchaseId }</th>
							<td>${ph.bookingDate }</td>
							<td>${ph.model }</td>
							<td>${ph.status }</td>
							<td>${ph.purchaseAmount }</td>
			    		</tr>
		    		</c:forEach>
		  		</tbody>
			</table>
		</c:if>
		<c:if test="${empty purchaseHistory }">
			<h3 class="text-center mt-5 mb-5">결제 기록이 없습니다.</h3>
		</c:if>
		
		<div id="pageBar">${pageBar }</div>	
		
	</div>
</main>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>