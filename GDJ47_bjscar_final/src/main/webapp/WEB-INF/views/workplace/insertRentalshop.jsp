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

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}
</style>
</head>
<body style="text-align:center;">
<main>
<jsp:include page="/WEB-INF/views/workplace/mypageSidebar.jsp" />
<h2>사업장등록</h2>
<form action="${path }/insertworkplaceEnd.do" method="post" enctype="multipart/form-data">
			<div style="display: flex; text-align: center;">
				<table class="tg" style="width: 1000px">
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
					<tr>
						<td class="tg-0lax" colspan="5" rowspan="10"><img id="preview"
							alt="이미지미리보기" /></td>
						<td class="tg-0lax" colspan="5" rowspan="2">아이디입력 :<input
							type="text" name="bmMember" style="background-color: #ffffc7;"></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td class="tg-0lax" colspan="5" rowspan="2">사업장이름 :<input
							type="text" name="rentalshopName"
							style="background-color: #ffffc7;" /></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td class="tg-0lax" colspan="5" rowspan="2">대여소 주소: <input
							type="text" name="rentalshopAddr"
							style="background-color: #ffffc7;" /></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td class="tg-0lax" colspan="5" rowspan="2">위도 : <input
							type="text" name="latitude" style="background-color: #ffffc7;" /></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td class="tg-0lax" colspan="5" rowspan="2">경도 : <input
							type="text" name="longitude"
							style="background-color: #ffffc7;" /></td>
					</tr>
					<tr>
					</tr>
					<tr>
					<td class="tg-n9g5" colspan="5"><input type="file" id="upFile" name="upFile" onchange="readURL(this);"/></td>
					<c:if test="${loginMan != null }">
					<td class="tg-n9g5" colspan="5" ><c:out value="${loginMan.bmId }" /> 님 환영합니다.</td>
					</c:if>
				</tr>
				</table>
</div>
				<!-- <tbody>
				
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
					<td class="tg-n9g5" colspan="10">아이디입력 :<input type="text" name="bmMember" style="background-color: #ffffc7;"></td>
				</tr>
				<tr>
					
				</tr>
				<tr>
				
				</tr>
				<tr>
					<td class="tg-n9g5" colspan="5"><input type="file" id="upFile" name="upFile"/></td>
					<c:if test="${loginMan != null }">
					<td class="tg-n9g5" colspan="5" ><c:out value="${loginMan.bmId }" /> 님 환영합니다.</td>
					</c:if>
				</tr>
				
			</tbody> -->

				<input type="submit" class="btn btn-outline-success" value="저장" />
		</form>
	
	</main>
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