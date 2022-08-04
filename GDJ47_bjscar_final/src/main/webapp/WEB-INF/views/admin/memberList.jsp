<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<section id="memberList">
			<h2>일반 회원관리</h2>
			<table id="tbl_member">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>마일리지</th>
				<th>가입일</th>
				<th>탈퇴여부</th>
			</tr>
			<c:if test="${not empty members }">
            	<c:forEach var="m" items="${members }">
            		<tr>           			
            			<td><c:out value="${m.memberId }"/></td>           			
            		</tr>
            	</c:forEach>
            </c:if>
			
			</table>
		</section>
	</div>
</body>
</html>