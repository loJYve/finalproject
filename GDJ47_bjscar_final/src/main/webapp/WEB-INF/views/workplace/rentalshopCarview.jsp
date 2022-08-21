<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

 <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"> 

<body>
<main>
<jsp:include page="/WEB-INF/views/workplace/mypageSidebar.jsp"/>
	<div style="display: flex;">
		<section id="rentalshop-container" class="container">
			<p>총 ${totalContents }대의 자동차가 등록되어 있습니다.</p>
		
			<h2>사업장 자동차관리</h2>
			<button	class="btn btn-success" style="float: right;" onclick=" location.assign('${path}/car/insertRentalshopCar.do')">자동차등록</button>
			<table id="tbl_rentalshop" class="table table-striped table-hover">
				<tr>
					<th>차일련번호</th>
					<th>차이름</th>
					<th>대여 상태</th>
					<th>연식</th>
					<!-- <th>사업자아이디</th> -->
				</tr>
				
				<c:if test="${not empty vehicles }">
				
					<c:forEach var="v" items="${vehicles }">
						<tr>
						<td><c:out value="${v.vehicleId }" /></td>
							<td><a href="${path}/car/workplaceCarView.do?no=${v.vehicleId}"><c:out value="${v.model }"/></a></td>							
							<!-- <a href="${path}/car/workplaceCarView.do?no=${v.vehicleId}" > -->
							<td><c:out value="${v.rentalStatus }" /></td>
							<td><c:out value="${v.productYear }" /></td>
							
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty vehicles }">
					<tr>
						<td colspan="4">조회결과없음</td>
					</tr>
				</c:if>
			</table>

			<div id="pageBar">${pageBar }</div>			
		</section>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />