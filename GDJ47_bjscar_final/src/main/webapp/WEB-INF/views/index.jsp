<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main</h1>

	
	<button onclick="location.assign('${path}/work/workplace.do')">사업장관리</button>
	

	  <button onclick="location.assign('${path}/member/memberLogin.do')">로그인</button>
	  <button onclick="location.assign('${path}/member/memberEnroll.do')">회원가입</button>

</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>