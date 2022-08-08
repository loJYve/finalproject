<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

     <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>대여하기</title>
    <style>
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

    #rental_date {
  		padding: 10px;
  		font-size: 16px;
  		width: 250px;
        margin-left: 100px;
	}
    #return_date {
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
    
    input[type='date']::before {
	  content: attr(data-placeholder);
	  width: 100%;
	}
	
	input[type='date']:focus::before,
	input[type='date']:valid::before {
	  display: none;
	}

    </style>

	<div class="input-form-backgroud row">
	<div class="input-form col-md-12 mx-auto">
		<div class="card-title" style="margin-top:30px;">
		  <h4 class="mb-3">대여하기</h4>
		</div>
		<div class="card-body">
      <form name="rental" action="${path }/rentalEnd.do" method="post">
        <p class="text">대여기간 선택</p>
        <input type="date" name="rental_date" id="rental_date"  class="form-control" data-placeholder="대여일 선택" aria-required="true"
        style="padding: 10px; font-size: 16px; width: 250px; margin-left: 100px;" required>
        <input type="date" name="return_date" id="return_date"  class="form-control" data-placeholder="반납일 선택" aria-required="true"
        style="padding: 10px; font-size: 16px; width: 250px; margin-left: 100px;" required>

       
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
   

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>