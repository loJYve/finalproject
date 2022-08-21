<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
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

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}
</style>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>
		<jsp:include page="/WEB-INF/views/workplace/mypageSidebar.jsp" />
		<h2>개인 사업장관리</h2>
		<div style="display: flex; text-align: center;">

			<table class="tg" style="width: 1100px">
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


				<c:if test="${not empty vehicle.files }">
					<c:forEach items="${ vehicle.files}" var="a">
						<tr>
							<td class="tg-0lax" colspan="5" rowspan="10"><img
								src="/resources/upload/rentalshopCarImg/${a.renamedFilename }"
								alt="이미지" /></td>
							<td class="tg-0lax" colspan="5" rowspan="2">사진이름:<c:out
									value="${a.originalFilename }" /></td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="5" rowspan="2">차종 :<input
						type="text" value="${vehicle.model }" style="background-color: #ffffc7;" />
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="5" rowspan="2">번호판 : <input
						type="text" value="${vehicle.numberPlate }"  style="background-color: #ffffc7;" /></td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="5" rowspan="2">연식 : <input
						type="text" value="${vehicle.productYear }"  style="background-color: #ffffc7;" /></td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="5" rowspan="5">사고상태 : <input type="text"
						value="${vehicle.accidentStatus }" style="background-color: #ffffc7;" />
				</td></tr>
				<tr>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="5" rowspan="2">대여상태 : <input
						type="text" value="${vehicle.rentalStatus }"  style="background-color: #ffffc7;" />
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="10" rowspan="2">가격 : <input
						type="text" value="${vehicle.price }"  style="background-color: #ffffc7;" />
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="10" rowspan="2">연료 : <input
						type="text" value="${vehicle.fuel }"  style="background-color: #ffffc7;" />
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="10" rowspan="2">탑승인원 : <input type="text"
					 value="${vehicle.boardingPersonnel }"	style="background-color: #ffffc7;"/>
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="10" rowspan="2">차급 : <input type="text"
					 value="${vehicle.vehicleGrade }"	style="background-color: #ffffc7;"/>
					</td>
				</tr>
				<tr>
				</tr>
				
			</table>
		</div>
	</main>
</body>
</html>