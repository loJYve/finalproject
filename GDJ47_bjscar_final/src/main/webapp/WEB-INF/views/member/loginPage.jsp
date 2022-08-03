<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
     <!-- Bootstrap CSS -->
 	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>로그인 폼</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}

     #btn-Yes{
        border: none;
        width: 20rem;
        margin: auto;
        
    }
	
	.login .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
    .checkbox{
        margin-right: 20px;
        text-align: right;
    }
    .card-title{
        margin-left: 30px;
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    a{ 
    	color: black; text-decoration: none; 
    }
    .check{
    	color : red;
    }
	 
    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">   
			<div class="twelve" style="text-align: center">
             <h1>BJSCAR</h1>
            </div>
		</div>
      <form action="${path }/member/login.do" class="login" method="post">
        <!-- <div class="checkbox">
            <label>
            <input type="radio" name="mode" value="admin"> 사업자
			&nbsp;&nbsp;
			<input type="radio" name="mode" value="member" checked> 회원
            </label>
          </div> -->
		<!-- <div class="card-body"> -->
        <input type="text" name="memberId" id="memberId" class="form-control" placeholder="아이디" autofocus required><BR>
        <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호"  required><br>
         <p id="check" class="check"></p><br/>
        <input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="로그인">
      </form>
    
		<!-- </div> -->
         <div class="links"> 
            <a href="memberId" class="text-primary">아이디 찾기</a> | <a href="memberPw" class="text-primary">비밀번호 찾기</a> | <a href="/member/memberEnroll.do" class="text-primary">회원가입</a>

        </div>
	</div>
   
  </body>

</html>