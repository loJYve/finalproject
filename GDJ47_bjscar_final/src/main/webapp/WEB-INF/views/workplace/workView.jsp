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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<section id="rentalshop-container" class="container">
	<table id="tbl_rentalshop" class="table table-striped table-hover">
	<h2>개인 사업장관리</h2>	
		<tr>
			<th>대여소 일련번호</th>
			<th>대여소이름</th>
			<th>대여소 주소</th>
			<th>위도</th>
			<th>경도</th>
			
			<th>사업장 이미지</th>
		</tr>
		<c:if test="${not empty rentalshop }">
			
				<tr>
					<td><input type="text" value="${rentalshop.rentalshopId }" readonly/></td>
					<td><input type="text" value="${rentalshop.rentalshopName }" readonly/></td>
					<td><input type="text" value="${rentalshop.rentalshopAddr }" readonly/></td>
					<td><input type="text" value="${rentalshop.latitude }" readonly/></td>
					<td><input type="text" value="${rentalshop.longitude }" readonly/></td>
					
					<td><input type="file"/></td>
				</tr>
			
		</c:if>
		<c:if test="${empty rentalshop }">
			<tr>
				<td colspan="6">조회결과없음</td>
			</tr>
		</c:if>
	</table>
	</section>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />