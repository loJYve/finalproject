<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
  <head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
  
     <!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

  
     <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>회원가입 폼</title>
    <style>
    	div#userId-container{position:relative;padding:0px;text-align:center;}
		div#userId-container span.guide{display : none;font-size:12px;}
		div#userId-container span.ok{color:blue;}
		div#userId-container span.error{color:red;}
	 body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
      
    }
	
    #btn-Yes,#btn_login{
        border: none;
        width: 25rem;
        margin: auto;
        
    }
	
	.form-control {
  		display: inline;
  		height: 40px;
  		width: 400px;
  		padding: 5px;
  		font-size: 16px;
        margin-left: 100px;
       
	}

    #member_id {
  		padding: 10px;
  		font-size: 16px;
  		width: 250px;
        margin-left: 100px;
	}
	#email{
		padding: 10px;
  		font-size: 16px;
  		width: 300px;
        margin-left: 100px;
	}
    .check{
    	font-size: 12px;
    	text-align:center;
    }
    .card-title{
       
        text-align: center;
    }

    .text{
       margin-left: 100px;
    }

    </style>
  </head>
  <body>

	<!-- <div class="card" style="width:40rem;"> -->
	<div class="input-form-backgroud row">
	<div class="input-form col-md-12 mx-auto">
		<div class="card-title" style="margin-top:30px;">
		  <h4 class="mb-3">회원가입</h4>
		<!-- 	<h2 class="card-title" style="color:#e4932b;"><h2>회원가입</h2></h2> -->
		</div>
		<div class="card-body">
      <form name="memberEnrollFrm" action="${pageContext.request.contextPath }/member/enrollMemberEnd.do" 
		method="post">
        <p class="text">아이디</p>
        <input type="text" name="memberId" id="memberId"  class="form-control" placeholder="ID"
        style="padding: 10px;
  		font-size: 16px;
  		width: 250px;
        margin-left: 100px;" required>

        &nbsp; &nbsp;
        <input type="button"  id="memberCheck" onclick="idCheck();"  class="btn btn-primary"  value="중복 체크"/><br/>
        	<p id="idch" class="check"> </p><br/>
       <div id="userId-container">
      <span class="guide ok">이 아이디는 사용 가능 합니다.</span>
	  <span class="guide error">이 아이디는 사용 불가능 합니다.</span>
      </div>
        <p class="text">비밀번호</p>
        <input type="password" name="password" id="password" class="form-control" placeholder="Password" required><br>
        	<p id="pw2ch" class="check"> </p><br/>
        <p class="text">비밀번호 확인</p>
        <input type="password"  id="password2" class="form-control" placeholder="Confirm Password" required><br>
        	<p id="pwch" class="check"> </p><br/>
        <p class="text">이름</p>
        <input type="text" name="memberName" id="memberName" class="form-control" placeholder="Name" required><br>
        	<p id="namech" class="check"> </p><br/>
        <p class="text">생년월일</p>
        <input type="text" name="birthday" id="birthday" class="form-control" placeholder="ex) 20000101" required><br>
            <p id="birthch" class="check"> </p><br/>
        <!--  <p class="text">이메일</p>
         <input type="text"  name="email" id="email" class="form-control" placeholder="Email" required> -->
       <!--   &nbsp; &nbsp;
        <input type="button" id="emailCheck" onclick="emailCheck();"  class="btn btn-primary"  value="인증하기"/><br/> -->
        <br/> 
        <p class="text">주소</p>
            <input type="text" class="text" name="addr1" id="addr1" placeholder="우편번호"readonly="readonly">
            <input type="button" onclick="execPostCode()"   class="btn btn-primary"  value="우편번호 찾기"><br>
            <input type="text" class="form-control" name="addr2" id="addr2"  placeholder="도로명주소"readonly="readonly">
            <input type="text" name="address" id="addr3" class="form-control" placeholder="상세주소" required><br>
            <span id="guide" style="color:#999;display:none"></span>
            <br/>
            <br/>
       <div id="contents"> 
		 <p class="text">이메일</p> 
		 <input type="text" id="email" name="email" class="form-control" placeholder="Email" required/>  
		 &nbsp; 
		<button type="button" id="emailChk" class="btn btn-primary">인증</button><br> 
		<p id="emch" class="check"> </p><br/>
		 <p class="text">인증번호</p>  
		 <input type="text" id="email2" name="email2" class="form-control" placeholder="인증번호" required>
		 &nbsp;   
		<button type="button" id="enterBtn2" class="btn btn-primary">확인</button> 	
        </div>
        <p id="emch2" class="check"> </p>	 
        <br/>
        
        <div id="contents"> 
		 <p class="text">휴대폰번호</p> 
		 <input type="text" id="to" name="phone" class="form-control" placeholder="Phone" required/>  
		 &nbsp; 
		<button type="button" id="send" class="btn btn-primary">인증</button><br> 
		<p id="phonech" class="check"> </p><br/>
		 <p class="text">인증번호</p>  
		 <input type="text" id="userNum" class="form-control" placeholder="인증번호" required>
		 &nbsp;   
		<button type="button" id="enterBtn" class="btn btn-primary">확인</button> 	
        </div>	 
        <p id="phonech2" class="check"> </p><br/>
        <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
        <br/>
          <button type="submit" id="btn-Yes" class="btn btn-lg btn-primary btn-block">회원가입</button>
        <br>
        <br>
    </form>
 
        
		<!-- </div> -->
       </div>
       </div>
	</div>
   
  </body>

  <script>
//모든 공백 체크 정규식
	   
  
  const empJ = /\s/g;
  //아이디 정규식
  const idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
  // 비밀번호 정규식
  const pwJ = /^[A-Za-z0-9]{6,20}$/;
  // 이름 정규식
  const nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
  // 이메일 검사 정규식
  const mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  // 휴대폰 번호 정규식
  const phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

  /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
 
  
  //아이디 중복확인
 
  const idCheck=()=>{
	  $.get("${path}/member/idCheck.do?memberId="+$("#memberId").val(),
			 data=>{console.log(data);
			 if(data == ''){
				$("#userId-container span.ok").show();
				$("#userId-container span.error").hide();
				
			 }else{
				 $("#userId-container span.ok").hide();
				 $("#userId-container span.error").show(); 
			 }
			 });
  }
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
  //비밀번호 체크1
    $("#password").focusout((e)=>{
    	if($('#password').val()==""){
    	   $('#pw2ch').text('*필수 정보입니다.');
	   	   $('#pw2ch').css('color', 'red');
	   	   return false;
      }else if(!pwJ.test($("#password").val())){
    	   $('#pw2ch').text('6~20자의 영문 소문자, 숫자만 사용가능합니다')
		   $('#pw2ch').css('color', 'red') 
			return false;
      }else{
    	 
    	   $("#pw2ch").hide();
    	   return true;
      }
    });
  //비밀번호 체크2
    $("#password2").focusout((e)=>{
    	if($('#password2').val()==""){
    	   $('#pwch').text('*필수 정보입니다.');
 	   	   $('#pwch').css('color', 'red');
 	   	    return false;
       }else if(!pwJ.test($("#password").val())){
    	   $('#pwch').text('6~20자의 영문 소문자, 숫자만 사용가능합니다')
		   $('#pwch').css('color', 'red') 
			return false;
       }else{
    	  
    	   $("#pwch").hide();
    	   return true;
       }
    });
  //비밀번호 중복확인
     $("#password2").keyup((e)=>{
    	 if($("#password2").val()!=$("#password").val()){
    		 $("#pwch").html("비밀번호가 다릅니다");
		     $("#pwch").css("color",'red');
		    
    	 }else{
    		 $("#pwch").html("비밀번호가 일치합니다");
		     $("#pwch").css("color",'blue');
		 
    	 }
     });
     $("#password").keyup((e)=>{
    	 if($("#password").val()!=$("#password2").val()){
    		 $("#pwch").html("비밀번호가 다릅니다");
		     $("#pwch").css("color",'red');
		  
		     
    	 }else{
    		 $("#pwch").html("비밀번호가 일치합니다");
		     $("#pwch").css("color",'blue');
		    
		     
    	 }
     });     
   //이름 체크
   $("#memberName").focusout((e)=>{
	  if($('#memberName').val()==""){
		  $('#namech').text('*필수 정보입니다.');
		  $('#namech').css('color', 'red');
		  return false;
	  }else if(!nameJ.test($("#memberName").val())){
		  $('#namech').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
	      $('#namech').css('color', 'red');
	      return false;
	  }else{
		 
		  $('#namech').hide();
		  return true;
	  }
	  
   });
   //생년월일
  
   $("#birthday").blur((e)=>{
	   const dateStr= $("#birthday").val();
	   const year = Number(dateStr.substr(0,4));
	   const month = Number(dateStr.substr(4,2));
	   const day = Number(dateStr.substr(6,2));
	   const today = new Date();
	   const yearNow = today.getFullYear();
	  if(dateStr.length <=8){
		  //년도가 1900보다 작거나 년도가 2022년도을 넘으면 false
		  if(year < 1900 || year > yearNow){
			  $('#birthch').text('생년월일을 확인해주세요(생년월일)');
			  $('#birthch').css('color', 'red');
		  }else if(month<1 || month>12){
			  $('#birthch').text('생년월일을 확인해주세요(월)');
			  $('#birthch').css('color', 'red');
		  }else if(day<1 || day>31){
			  $('#birthch').text('생년월일을 확인해주세요(일)');
			  $('#birthch').css('color', 'red');
		  }else if((month==4 || month==6 || month==9 || month==11) && day==31){
	          $('#birthch').text('생년월일을 확인해주세요');
		      $('#birthch').css('color', 'red');
          }else if (month == 2) {
              const isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
              
              if (day>29 || (day==29 && !isleap)) {
               $('#birthch').text('생년월일을 확인해주세요 ');
               $('#birthch').css('color', 'red'); 
 
              }else{
               $('#birthch').text('');
             
              }
              }else{
               $('#birthch').text('');
                 
              }
   
	          }else{
	           $('#birthch').text('생년월일을 확인해주세요(8자 초과)');
			   $('#birthch').css('color', 'red');   
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
   //이메일 인증
   $("#emailChk").click((e)=>{
	  const email = $('#email').val();
	  $.ajax({
		  url:'${path}/member/checkMail.do',
		  type: 'POST',
		  data: {
			  "email" : email
		  },
		  success: function(data){
			  const checkNum = data;
			  alert('인증번호가 발송 되었습니다.');
			  
			  $('#enterBtn2').click((e)=>{
				  const userNum = $('#email2').val();
				  
				  if(checkNum == userNum){
					  alert('인증 성공하였습니다.');
				  }else{
					  alert('인증 실패하였습니다. 다시 입력해주세요.');
				  }
			  });
		  }
	  });
	   
   });
   //휴대폰 인증 
          $('#send').click((e)=>{
		/*  $('#send').click(function() { */
				
				const to = $('#to').val();
				
				$.ajax ({
				     url:'${path}/member/checkPhone.do',
					type: 'GET',
					data: {
						"to" : to
					},
					success: function(data) {
						const checkNum = data;
						alert('인증번호가 발송 되었습니다.');
						
						 $('#enterBtn').click((e)=>{
						/* $('#enterBtn').click(function() {	 */
							const userNum = $('#userNum').val();
							
							if(checkNum === userNum) {
								alert('인증 성공하였습니다.');
							}
							else {
								alert('인증 실패하였습니다. 다시 입력해주세요.');
							}
						});
						
					}
				});
				
			});
   //휴대폰 체크
   $("#to").focusout((e)=>{
	 if($("#to").val()==""){
		   $('#phonech').text('*필수 정보입니다.');
		   $('#phonech').css('color','red'); 
		   return false;
	   }else if(!phoneJ.test($("#to").val())){
		   $('#phonech').text('휴대폰번호를 확인해주세요 ');
           $('#phonech').css('color', 'red');
			return false;
	   }else{
		  
		   $('#phonech').hide();
			return true;
	   }
	  
	 
	});
   //인증번호 체크2 
   $("#userNum").focusout((e)=>{
	 if($("#userNum").val()==""){
		 $('#phonech2').text('*필수 정보입니다.');
		 $('#phonech2').css('color','red'); 
		 return false;
	 }else{
		   $('#phonech2').hide();
			return true;
	 }
	 
     });
   
	</script>
	<script>
    //주소
    function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                let extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=addr1]").val(data.zonecode);
                $("[name=addr2]").val(fullRoadAddr);
                
                document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr2').value = fullRoadAddr;
          
            }
         }).open();
     };
     
  </script>
</html>