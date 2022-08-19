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
<body style="text-align:center;">
<form action="${path }/insertworkplaceEnd.do" method="post" enctype="multipart/form-data">
		<table class="tg" style="margin-left: auto; margin-right: auto; background-color: #ffffc7;">
			<h2>개인 사업장만들기</h2>
			<thead>
				
					<tr>
						<th class="tg-af47" colspan="10">사업장이름 :<input type="text"
							 name="rentalshopName" style="background-color: #ffffc7;"/></th>
					</tr>
			</thead>
			<tbody>
				
				<tr>
					<td class="tg-n9g5" colspan="10">대여소주소 : <input type="text"
						name="rentalshopAddr" style="background-color: #ffffc7;"/></td>
				</tr>
				<tr>
					<td class="tg-n9g5" colspan="10">위도 : <input type="text"
						name="latitude" style="background-color: #ffffc7;"/></td>
				</tr>
				<tr>
					<td class="tg-n9g5" colspan="10">경도 : <input type="text"
					name="longitude"	style="background-color: #ffffc7;"/></td>
				</tr>
				<tr>
					<td class="tg-n9g5" colspan="10">사업장 이미지</td>
				</tr>
				<tr>
				
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="tg-n9g5" colspan="5"><input type="file" id="upFile" name="upFile"/></td>
					<c:if test="${loginMan != null }">
					<td class="tg-n9g5" colspan="5"><c:out value="${loginMan.bmId }"/> 님 환영합니다.</td>
					</c:if>
				</tr>
				
			</tbody>
		</table>
		<input type="submit" class="btn btn-outline-success" value="저장"/>
	</form>
</body>
 <script>
    	$(()=>{
    		$("[name=upFile]").change(e=>{
    			const fileName=$(e.target).prop('files')[0].name;
    			$(e.target).next(".custom-file-label").html(fileName);
    		});
    	});
    </script>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />