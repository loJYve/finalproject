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
</head>
<body>
	<table id="tbl_rentalshop" class="table table-striped table-hover">
		<tr>
			<th>대여소 일련번호</th>
			<th>대여소이름</th>
			<th>대여소 주소</th>
			<th>위도</th>
			<th>경도</th>
			<th>사업자아이디</th>
		</tr>
		<c:if test="${not empty rentalshops }">
			<c:forEach var="r" items="${rentalshops }">
				<tr>
					<td><c:out value="${r.rentalshopId }" /></td>
					<td><c:out value="${r.rentalshopName }" /></td>
					<td><c:out value="${r.rentalshopAddr }" /></td>
					<td><c:out value="${r.bmMember }" /></td>
					<td><c:out value="${r.latitude }" /></td>
					<td><c:out value="${r.longtitude }" /></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty rentalshops }">
			<tr>
				<td colspan="4">조회결과없음</td>
			</tr>
		</c:if>
	</table>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />