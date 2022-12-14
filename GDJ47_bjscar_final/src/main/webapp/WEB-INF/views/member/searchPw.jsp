<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!DOCTYPE html>
<html lang="en">
   <head>
        <title>비밀번호찾기 폼</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
/*  {
margin: 0px;
padding: 0px;
} */
.login {
/* background: linear-gradient(to bottom, #0099ff 0%, #fff 100%); */
/*  background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); */
/* height: 100vh;
width: 100%; */
justify-content: center;
align-items: center;
display: flex;
}
   body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }
.account-login {
width: 500px;
}
.form-control:focus {
box-shadow: none;
}
p a {
padding-left: 2px;
}
.account-login h1 {
font-size: 25px;
text-align: left;
color: #fff;
text-transform: uppercase;
font-weight: bold;
border-radius: 5px;
}
.login-form input {
width: 100%;
position: relative;
border-bottom: 1px solid #a39e9e;
padding: 0;
border-top: 0px;
border-left: 0px;
border-right: 0px;
box-shadow: none;
height: 63px;
border-radius: 0px;
}
.login-form {
background: #fff;
float: left;
width: 100%;
padding: 40px;
border-radius: 5px;
}
#btn-Yes,#btn_login{
        border: none;
        width: 25rem;
        margin: auto;
        
    }
#btn-Yes:hover{
    color: #fff;
    opacity: 0.8;
}
p {
float: left;
width: 100%;
text-align: center;
font-size: 14px;
}
.remember {
float: left;
width: 100%;
margin: 80px 0 0;
}
/* Customize the label (the container) */
.custom-checkbox {
display: block;
position: relative;
padding-left: 27px;
margin-bottom: 12px;
cursor: pointer;
font-size: 13px;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none;
font-weight: normal;
padding-top: 2px;
float: left;
}
/* Hide the browser's default checkbox */
.custom-checkbox input {
position: absolute;
opacity: 0;
cursor: pointer;
height: 0;
width: 0;
}
/* Create a custom checkbox */
.custom-checkbox .checkmark {
position: absolute;
top: 0;
left: 0;
height: 20px;
width: 20px;
background-color: #bfbcbc;
}
/* On mouse-over, add a grey background color */
.custom-checkbox:hover input ~ .checkmark {
background-color: #747474;
}
/* When the checkbox is checked, add a blue background */
.custom-checkbox input:checked ~ .checkmark {
background-color: #2196F3;
}
/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
content: "";
position: absolute;
display: none;
}
/* Show the checkmark when checked */
.custom-checkbox input:checked ~ .checkmark:after {
display: block;
}
/* Style the checkmark/indicator */
.custom-checkbox .checkmark:after {
left: 9px;
top: 5px;
width: 5px;
height: 10px;
border: solid white;
border-width: 0 3px 3px 0;
-webkit-transform: rotate(45deg);
-ms-transform: rotate(45deg);
transform: rotate(45deg);
}
@media (max-width: 767px){
.account-login {
    width: 90%;
  }
}
 .links{
        text-align: center;
        margin-bottom: 10px;
        
    }
   
</style>
<body>
    <div class="login">
            <div class="account-login">
               <h1>BJSCAR</h1>
               <form action="${path }/member/searchPwEnd.do" class="login-form" method="post">
                  <div class="form-group">
                      <input type="text" name="memberId" id="memberId" class="form-control" placeholder="ID" autofocus required>
                  </div>
                  <p id="idch" class="check"> </p><br/>
                  <div class="form-group">
                     <input type="text" name="email" id="email" class="form-control" placeholder="Email"  required>
                  </div>
                  <p id="emch" class="check"> </p><br/>
                  <div class="remember">
                     <button id="btn-Yes"  type="submit" class="btn btn-lg btn-primary btn-block">비밀번호찾기</button>
                     <br/>
                     </form>
                   <div class="links"> 
            <a href="${path }/member/memberPage.do" class="text-primary">로그인</a> | <a href="${path }/member/searchId.do" class="text-primary">아이디 찾기</a> | <a href="/member/memberEnroll.do" class="text-primary">회원가입</a>
                   </div>
                  </div>   
            </div>
     
   </body>
<script>
//아이디 정규식
const idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
// 이메일 검사 정규식
const mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//아이디 체크
$("#memberId").focusout((e)=>{
     if($('#memberId').val() == ""){
   		$('#idch').text('*필수 정보입니다.');
   	  	$('#idch').css('color', 'red');
   		return false;
	  }else if(!idJ.test($('#memberId').val())){
  		$('#idch').text('4~19자의 영문 소문자, 숫자만 사용가능합니다')
		$('#idch').css('color', 'red')
		   return false;
	  }else{ 
		  
       $("#idch").hide();
       return true;
     }
});
//이메일
$("#email").focusout((e)=>{
	  if($("#email").val()==""){
		  $('#emch').text('*필수 정보입니다.');
		  $('#emch').css('color','red');
		  return false;
	  }else{
		 
		  $('#emch').hide();
			return true;
	  } 
});
</script>
</html>