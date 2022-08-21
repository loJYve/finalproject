<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@
taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BJSCAR</title>
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

<!-- <body>
	<main>
		<jsp:include page="/WEB-INF/views/workplace/mypageSidebar.jsp" />
		<div style="display: flex; text-align: center;"> -->
			<!-- style="text-align: center" -->
			<!-- <div>

				<table class="tg"
					style="margin-left: auto; margin-right: auto; background-color: #ffffc7;">
					<h2>개인 사업장관리</h2>
					<thead>

						<tr>
							<th class="tg-af47" colspan="10">사업장이름 :<input type="text"
								value="${rentalshop.rentalshopName }" readonly
								style="background-color: #ffffc7;" /></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="tg-af47" colspan="5">대여소일련번호</td>
							<td class="tg-n9g5" colspan="5"><input type="text"
								value="${rentalshop.rentalshopId }" readonly
								style="background-color: #ffffc7;" /></td>
						</tr>
						<tr>
							<td class="tg-n9g5" colspan="10">대여소주소 : <input type="text"
								value="${rentalshop.rentalshopAddr }" readonly
								style="background-color: #ffffc7;" /></td>
						</tr>
						<tr>
							<td class="tg-n9g5" colspan="10">위도 : <input type="text"
								value="${rentalshop.latitude }" readonly
								style="background-color: #ffffc7;" /></td>
						</tr>
						<tr>
							<td class="tg-n9g5" colspan="10">경도 : <input type="text"
								value="${rentalshop.longitude }" readonly
								style="background-color: #ffffc7;" /></td>
						</tr>



						<c:if test="${not empty rentalshop.files }">
							<c:forEach items="${ rentalshop.files}" var="a">
								<tr>
									<td class="tg-n9g5" colspan="10" rowspan="3"><c:out
											value="${a.originalFilename }" /></td>


								</tr>
								<tr>
									<td class="tg-n9g5" colspan="10"><p>
											<img
												src="/resources/upload/rentalshopImg/${a.renamedFilename }"
												alt="이미지" />
										<p></td>
								</tr>


							</c:forEach>

						</c:if>
					</tbody>

				</table> -->

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

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}
</style>
<body>
	<main>
		<jsp:include page="/WEB-INF/views/workplace/mypageSidebar.jsp" />
		<h2>개인 사업장관리</h2>
		<div style="display: flex; text-align: center;">
		
				<table class="tg" style=" width: 1100px">
					<colgroup>
						<col style="width: 51px">
						<col style="width: 51px">
						<col style="width: 51px">
						<col style="width: 51px">
						<col style="width: 51px">
						<col style="width: 51px">
						<col style="width: 51px">
						<col style="width: 51px">
						<col style="width: 51px">
						<col style="width: 51px">
					</colgroup>
					

						<c:if test="${not empty rentalshop.files }">
							<c:forEach items="${ rentalshop.files}" var="a">
						<tr>
							<td class="tg-0lax" colspan="5" rowspan="10" ><img
												src="/resources/upload/rentalshopImg/${a.renamedFilename }"
												alt="이미지" /></td>
							<td class="tg-0lax" colspan="5" rowspan="2">사진이름:<c:out
											value="${a.originalFilename }" /></td>
						</tr>
						</c:forEach>
						</c:if>
						<tr>
						</tr>
						<tr>
							<td class="tg-0lax" colspan="5" rowspan="2">사업장이름 :<input type="text"
								value="${rentalshop.rentalshopName }" readonly
								style="background-color: #ffffc7;" /></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td class="tg-0lax" colspan="5" rowspan="2">대여소일련번호:
							<input type="text"
								value="${rentalshop.rentalshopId }" readonly
								style="background-color: #ffffc7;" /></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td class="tg-0lax" colspan="5" rowspan="2">위도 : <input type="text"
								value="${rentalshop.latitude }" readonly
								style="background-color: #ffffc7;" /></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td class="tg-0lax" colspan="5" rowspan="2">경도 : <input type="text"
								value="${rentalshop.longitude }" readonly
								style="background-color: #ffffc7;" /></td>
						</tr>
						<tr>
						</tr>
					
				</table>



				<%--
				</form>
				<form
					action="/work/updateRentalshop.do?no=${rentalshop.rentalshopId }">
					--%> <%--
					<li><a
						href="/work/updateRentalshop.do?no=${rentalshop.rentalshopId }"
						class="link-dark rounded">사업장 내용수정</a></li> --%>
			</div>
			
				<button class="btn btn-success" style="float: right;"
					onclick=" location.assign('${path}/work/updateRentalshop.do?no=${rentalshop.rentalshopId }')">수정</button>
				<button class="btn btn-success" style="float: right;"
					onclick=" location.assign('${path}/car/carview.do?rentalshopId=${rentalshop.rentalshopId }')">자동차관리</button>
		</div>
	</main>
<script>

</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />