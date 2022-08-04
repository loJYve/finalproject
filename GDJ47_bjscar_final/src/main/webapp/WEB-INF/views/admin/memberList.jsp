<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<section id="member-container" class="container">
			<p>총 ${totalContents }건의 게시물이 있습니다.</p>
			<h2>일반 회원관리</h2>
			<table id="tbl_member" class="table table-striped table-hover">
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
            			<td><c:out value="${m.memberName }"/></td> 
            			<td><c:out value="${m.birthday }"/></td> 
            			<td><c:out value="${m.email }"/></td> 
            			<td><c:out value="${m.phone }"/></td> 
            			<td><c:out value="${m.address }"/></td> 
            			<td><c:out value="${m.totalMileage }"/></td> 
            			<td><c:out value="${m.enrollDate }"/></td>            			
            			<td><c:out value="${m.secessionReason }"/></td>            			
            		</tr>
            	</c:forEach>
            </c:if>
			<c:if test="${empty members }">
            	<tr>
            		<td colspan="6">조회결과없음</td>
            	</tr>
            </c:if>
        </table> 
        <div id="pageBar">
        	${pageBar }
        </div>
			</table>
		</section>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>