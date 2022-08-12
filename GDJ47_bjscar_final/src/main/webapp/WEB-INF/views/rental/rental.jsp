<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
	<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
	<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>


<!--한국어  달력 쓰려면 추가 로드-->
<!-- <script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script> --> 

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
        <!-- <input type="date" name="rental_date" id="rental_date"  class="form-control" data-placeholder="대여일 선택" aria-required="true" required>
        <input type="date" name="return_date" id="return_date"  class="form-control" data-placeholder="반납일 선택" aria-required="true" required>
        &nbsp; &nbsp;
        <input type="button"  id="memberCheck" onclick="idCheck();"  class="btn btn-primary"  value="중복 체크"/><br/> -->
        <input type="text" id="datePicker" class="form-control" value="대여일 선택">

       
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
   

	<script>
	$(function() {
		
		$('#datePicker').datepicker({
			format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    title: "테스트",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		});
		
	});
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>