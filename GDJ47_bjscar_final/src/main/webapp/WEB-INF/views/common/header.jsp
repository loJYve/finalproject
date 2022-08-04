<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<header>
	<nav>
			<ul class="clearfix">
				<li class="main"><a class="btn btn-primary" href="<%=request.getContextPath()%>/main.do">bjscar</a></li>
				<li class="menu">1st menu
						<ul>
							<li>2nd menu</li>
							<li>2nd menu</li>
						</ul>
				</li>
				<li class="menu">1st menu
						<ul>
							<li>2nd menu</li>
							<li>2nd menu</li>
							<li>2nd menu</li>
							<li>2nd menu</li>
						</ul>
				</li>
				<li class="menu">1st menu
						<ul>
							<li>2nd menu</li>
							<li>2nd menu</li>
						</ul>
				</li>
				<li class="menu">1st menu
						<ul>
							<li>2nd menu</li>
							<li>2nd menu</li>
							<li>2nd menu</li>
						</ul>
				</li>
				<c:if test="${loginMember == null }">
				<ul class="login">
				<button onclick="location.assign('${path}/member/memberPage.do')">로그인</button>
				<button onclick="location.assign('${path}/member/memberEnroll.do')">회원가입</button>
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
				<button onclick="location.assign('${path}/member/logout.do')">로그아웃</button>
				<!-- <button class="login">로그인</button> -->
				</ul>
				</c:if>
			</ul>
	</nav>
</header>
<style>
a{
	text-decoration: none;
	color:black;
}
html,body{
  height:100%;
}
body{
  text-align:center;
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
button{
  margin-top:10px;
  background:cornflowerblue;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
​
​
.menu{
	text-align:center;
}
.main{
	font-weight:bolder;
	font-size:larger;
	margin-right:200px;
}
* {margin:0; padding:0;}
ul li {list-style:none;}
.clearfix:after{content:'';display:block; clear:both;}

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
      </a> branch 'main' of https://github.com/loJYve/finalproject.git

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
        <li><a href="<%=request.getContextPath()%>/admin.do" class="nav-link px-2 link-dark">관리자 페이지</a></li>
      </ul>

      <div class="col-md-3 text-end">
        <button type="button" class="btn btn-outline-primary me-2">Login</button>
        <button type="button" class="btn btn-primary">Sign-up</button>
      </div>
    </header>
  </div>