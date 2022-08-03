<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
   <title>알림메세지</title>
</head>
<body>
<script>
   alert("${msg}");
   location.replace("${path}${loc}");
</script>

</body>
</html>

