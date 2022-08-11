<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업장 관리페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

</head>
<body>



	<div>
		<section id="rentalshop-container" class="container">
			<p>총 ${totalContents }곳의 사업장이 있습니다.</p>
			<h2>개인 사업장관리</h2>	
			<table id="tbl_rentalshop" class="table table-striped table-hover">
				<tr>
					<th>대여소 일련번호</th>
					<th>대여소이름</th>
					<th>대여소 주소</th>
					<th>사업자아이디</th>
				</tr>
				<c:if test="${not empty rentalshops }">
					<c:forEach var="r" items="${rentalshops }">
						<tr>
							<td><c:out value="${r.rentalshopId }" /></td>
							<td><a href="${path}/work/workplaceView.do?no=${r.rentalshopId}"><c:out value="${r.rentalshopName }" /></a></td>										
							<td><c:out value="${r.rentalshopAddr }" /></td>
							<td><c:out value="${r.bmMember }" /></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty rentalshops }">
					<tr>
						<td colspan="4">조회결과없음</td>
					</tr>
				</c:if>
			</table>
			
			<div id="pageBar">${pageBar }</div>
			
		</section>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	