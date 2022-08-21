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
<body style="text-align: center;">
	<form action="${path }/insertworkplaceCarEnd.do" method="post"
		enctype="multipart/form-data">
		<table class="tg"
			style="margin-left: auto; margin-right: auto; background-color: #ffffc7;">
			<h2>사업장 자동차등록</h2>

			<tr>
				<td class="tg-0lax" colspan="5" rowspan="10"><img id="preview"
					alt="이미지미리보기" /></td>
				
			</tr>

			<tr>
				<td class="tg-n9g5" colspan="10">사업장 일련번호 : <input type="text"
					name="rentalshopId" style="background-color: #ffffc7;" /></td>

			</tr>


			<tr>

			</tr>
			<td class="tg-af47" colspan="10">차종 :<input type="text"
				name="model" style="background-color: #ffffc7;" /></td>
			<tr>
				<td class="tg-n9g5" colspan="10">번호판 : <input type="text"
					name="numberPlate" style="background-color: #ffffc7;" /></td>
			</tr>
			<tr>
				<td class="tg-n9g5" colspan="10">연식 : <input type="text"
					name="productYear" style="background-color: #ffffc7;" /></td>
			</tr>
			<tr>
				<td class="tg-n9g5" colspan="10">사고상태 : <input type="text"
					name="accidentStatus" style="background-color: #ffffc7;" /></td>
			</tr>
			<tr>
				<td class="tg-n9g5" colspan="10">대여상태 : <input type="text"
					name="rentalStatus" style="background-color: #ffffc7;" />
			</tr>
			<tr>
				<td class="tg-n9g5" colspan="10">가격 : <input type="text"
					name="price" style="background-color: #ffffc7;" /></td>
			</tr>
			<tr>
				<td class="tg-n9g5" colspan="10">연료 : <input type="text"
					name="fuel" style="background-color: #ffffc7;" /></td>
			</tr>
			<tr>
				<td class="tg-n9g5" colspan="10">탑승인원 : <input type="text"
					name="boardingPersonnel" style="background-color: #ffffc7;" /></td>
			</tr>
			<tr>
				<td class="tg-n9g5" colspan="10">차급 : <input type="text"
					name="vehicleGrade" style="background-color: #ffffc7;" /></td>
			</tr>
			<tr>
				<td class="tg-n9g5" colspan="5"><input type="file" id="upFile"
					name="upFile" onchange="readURL(this);"/></td>
				<c:if test="${loginMan != null }">
					<td class="tg-n9g5" colspan="5"><c:out
							value="${loginMan.bmId }" /> 님 환영합니다.</td>
				</c:if>
			</tr>


		</table>
		<input type="submit" class="btn btn-outline-success" value="저장" />
	</form>
</body>
<script>
    	$(()=>{
    		$("[name=upFile]").change(e=>{
    			const fileName=$(e.target).prop('files')[0].name;
    			$(e.target).next(".custom-file-label").html(fileName);
    		});
    	});
    	//이미지 썸네일
    	function readURL(input) {
    		if (input.files && input.files[0]) {
    			var reader = new FileReader();
    			reader.onload = function(e) {
    				document.getElementById('preview').src = e.target.result;
    			};
    			reader.readAsDataURL(input.files[0]);
    		} else {
    			document.getElementById('preview').src = "";
    		}
    	}
    </script>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />