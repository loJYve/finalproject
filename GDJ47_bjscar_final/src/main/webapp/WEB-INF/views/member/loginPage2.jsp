<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
   <head>
        <title>로그인 폼</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
* {
margin: 0px;
padding: 0px;
}
.login {
/* background: linear-gradient(to bottom, #0099ff 0%, #fff 100%); */
 background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
height: 100vh;
width: 100%;
justify-content: center;
align-items: center;
display: flex;
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
button.btn {
width: 100%;
background: #009cff;
font-size: 20px;
padding: 11px;
color: #fff;
border: 0px;
margin: 10px 0px 20px;
}
.btn:hover{
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
<!-- 쿠키값부르기 -->
	 
    <div class="login">
            <div class="account-login">
               <h1>BJSCAR</h1>
               <form action="${path }/member/login.do" class="login-form" method="post">
                  <div class="form-group">
                      <input type="text" name="memberId" id="memberId" class="form-control" placeholder="ID"  
                      value="${cookie.get("saveId")!=null?cookie.get('saveId').getValue():''}" autofocus required>
                  </div>
                  <p id="idch" class="check"> </p><br/>
                  <div class="form-group">
                     <input type="password" name="password" id="password" class="form-control" placeholder="Password"  required>
                  </div>
                  <p id="pwch" class="check"> </p><br/>
                  <div class="remember">
                     <label class="custom-checkbox">아이디 저장
                     <input type="checkbox" id="saveId" name="saveId" ${cookie.get("saveId")!=null?"checked":""}>
                     
                     <span class="checkmark"></span>
                     </label>
                     <button class="btn" type="submit" name="save" id="save">로그인</button>
                     </form>
                     
                    <!--  <button class="btn" type="submit" onclick="">kakao Login</button> -->
                     <a href="https://kauth.kakao.com/oauth/authorize?client_id=c092a856fb0ff2740a4131083dd48690&redirect_uri=http://localhost:9090/oauth2/code/kakao&response_type=code""><img src="/images/kakao2.png" style="width:100%"></a>
                   <div class="links"> 
                   <br/>
            <a href="${path }/member/searchId.do" class="text-primary">아이디 찾기</a> | <a href="${path }/member/searchpw.do" class="text-primary">비밀번호 찾기</a> | <a href="/member/memberEnroll.do" class="text-primary">회원가입</a> | <a href="${path }/businessman/login.do" class="text-primary">사업자 로그인</a>
                   </div>
                  </div>
                 
            </div>
        </div>
      
   </body>

 <script>

 //아이디 정규식
 const idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
 // 비밀번호 정규식
 const pwJ = /^[A-Za-z0-9]{6,20}$/;
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
 //비밀번호 체크2
 $("#password").focusout((e)=>{
 	if($('#password').val()==""){
 	   $('#pwch').text('*필수 정보입니다.');
	   	   $('#pwch').css('color', 'red');
	   	    return false;
    }else{
 	  
 	   $("#pwch").hide();
 	   return true;
    }
 });
 </script>
</html>