
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
      </a> 
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="<%=request.getContextPath()%>/" class="nav-link px-2 link-secondary">Home</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
        <li><a href="<%=request.getContextPath()%>/admin.do" class="nav-link px-2 link-dark">관리자 페이지</a></li>
        <li><a href="<%=request.getContextPath()%>/work/workplace.do" class="nav-link px-2 link-dark">사업장관리</a></li>
      </ul>
      <div class="col-md-3 text-end">
      <c:if test="${loginMember == null }">
				<ul class="login">
		<button type="button" class="btn btn-outline-primary me-2" onclick="location.assign('${path}/member/memberPage.do')">Login</button>
        <button type="button" class="btn btn-primary" onclick="location.assign('${path}/member/memberEnroll.do')">Sign-up</button>
				<%-- <button onclick="location.assign('${path}/member/memberPage.do')">로그인</button>
				<button onclick="location.assign('${path}/member/memberEnroll.do')">회원가입</button> --%>
				<!-- <button class="login">로그인</button> -->
				</ul>
				</c:if> 
				<c:if test="${loginMember != null }">
				<ul class="login">
				<span>
                   <a href="${path }/member/memberView.do?userId=${loginMember.memberId}">
                     <c:out value="${loginMember.memberName }"/>
                   </a>님, 환영합니다.
                </span>
				<button  class="btn btn-outline-primary me-2"  onclick="location.assign('${path}/member/logout')">로그아웃</button>
				<!-- <button class="login">로그인</button> -->
				</ul>
				</c:if>
      </div>
    </header>
  </div>


