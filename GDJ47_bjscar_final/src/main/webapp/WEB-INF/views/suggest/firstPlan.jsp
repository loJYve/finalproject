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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>plan 폼</title>
  </head>
<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 80px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		background:linear-gradient(to bottom right, #0098FF, #6BA8D1);
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
</style>
  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">plan</h2>
		</div>
		<div class="card-body">
      <form action="${path }/suggestEnd.do" class="form-signin" method="post" >
        <h5 class="form-signin-heading" style="text-align: center">경로 입력</h5>
        <br>
        <!-- <label for="inputEmail" class="sr-only">Your ID</label> -->
        <p>제목</p><input type="text" id="planTitle" name="planTitle" class="form-control" placeholder="Title" required autofocus><br>
        <!-- <input type="text" id="planTheme" name="planTheme" class="form-control" placeholder="Theme" required><br> -->
        <p>테마</p><select class="form-control" id="planTheme" name="planTheme" style="width:250px;height:50px;">
        <option  value="여행">여행</option>
         <option value="휴가">휴가</option>
         <option value="패키지">패키지</option>
        </select>
        <br/>
        <p>출발</p><input type="date" id="planDate" name="planDate" class="form-control" placeholder="출발" required><br>
        <p>도착</p><input type="date" id="planDate2" name="planDate2" class="form-control" placeholder="도착" required><br>
        <div class="checkbox">
        <p>지역</p><select class="form-control" id="planArea" name="planArea" style="width:250px;height:50px;">
         <option value="서울">서울</option>
         <option value="경기도">경기도</option>
         <option value="인천">인천</option>
         <option value="강원도">강원도</option>
         <option value="충청북도">충청북도</option>
         <option value="충청남도">충청남도</option>
         <option value="경상북도">경상북도</option>
         <option value="경상남도">경상남도</option>
         <option value="전라북도">전라북도</option>
         <option value="전라남도">전라남도</option>
         <option value="제주도">제주도</option>
        </select>
         <!--  <label>
            <input type="checkbox" value="remember-me"> 기억하기
          </label> -->
        </div>
        <br/>
        <br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">click</button>
      </form>
      
		</div>
	</div>

	<div class="modal">
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
  </body>
</html>