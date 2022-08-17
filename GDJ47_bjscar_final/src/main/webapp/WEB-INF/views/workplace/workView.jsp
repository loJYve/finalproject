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

<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-8tj9 {
	background-color: #ffffc7;
	border-color: inherit;
	color: #000000;
	text-align: center;
	vertical-align: top
}

.tg .tg-ksfr {
	background-color: #ffffc7;
	border-color: inherit;
	color: #000000;
	text-align: left;
	vertical-align: top
}
</style>
</head>
<body style="text-align:center">

	<form action="${path }/alterworplace.do" method="get">
		<table class="tg" style="margin-left: auto; margin-right: auto; background-color: #ffffc7;">
			<h2>개인 사업장관리</h2>
			<thead>
				
					<tr>
						<th class="tg-af47" colspan="10">사업장이름 :<input type="text"
							value="${rentalshops.rentalshopName }" readonly style="background-color: #ffffc7;"/></th>
					</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tg-af47" colspan="5">대여소일련번호</td>
					<td class="tg-n9g5" colspan="5"><input type="text"
						value="${rentalshops.rentalshopId }" readonly style="background-color: #ffffc7;"/></td>
				</tr>
				<tr>
					<td class="tg-n9g5" colspan="10">대여소주소 : <input type="text"
						value="${rentalshops.rentalshopAddr }" readonly style="background-color: #ffffc7;"/></td>
				</tr>
				<tr>
					<td class="tg-n9g5" colspan="10">위도 : <input type="text"
						value="${rentalshops.latitude }" readonly style="background-color: #ffffc7;"/></td>
				</tr>
				<tr>
					<td class="tg-n9g5" colspan="10">경도 : <input type="text"
						value="${rentalshops.longitude }" readonly style="background-color: #ffffc7;"/></td>
				</tr>
				
				<tr>
					<td class="tg-n9g5" colspan="10">사업장 이미지</td>
				</tr>
								
				<c:if test="${not empty rentalshops }">
				
				<tr>
					<td class="tg-n9g5" colspan="10" rowspan="3" ><c:out value="${rentalshops.originalFilename }"/></td>			
				</tr>
				
				</c:if>
				
			</tbody>
		</table>
	</form>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />