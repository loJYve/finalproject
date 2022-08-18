<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

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
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

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
</head>
  <body>

	<div class="input-form-backgroud row">
	<div class="input-form col-md-12 mx-auto">
		<div class="card-title" style="margin-top:30px;">
		  <h4 class="mb-3">대여하기</h4>
		</div>
		<div class="card-body">
      <form name="rentalFrm" action="${path }/rentalEnd.do" method="post">
        <p class="text">대여기간 선택</p>
        <input type="text" id="rentalDate" name="rentalDate" class="form-control" placeholder="대여일 선택" required/>
        ~
        <input type="text" id="returnDate" name="returnDate" class="form-control" placeholder="반납일" required readonly/>
		<br><br>
		<div id="totalRentalPeriod" class="form-control">총 대여기간 : 0일 0시간 0분</div>
        <br><br>
        
        <p class="text">차량 선택</p>
        <select id="vehicleGrade" name="vehicleGrade" class="form-control" required disabled>
			<option value="">차종 선택</option>
			<option value="경차">경차</option>
			<option value="소형">소형</option>
			<option value="준중형">준중형</option>
			<option value="중형">중형</option>
			<option value="준대형">준대형</option>
			<option value="대형">대형</option>
			<option value="SUV">SUV</option>
			<option value="승합차">승합차</option>
			<option value="스포츠카">스포츠카</option>
		</select>
		<br><br>
		
		<p class="text">대여차량</p>
        <input type="hidden" id="vehicleId" name="vehicleId" required/>
        <input type="text" id="rentalVehicel" name="rentalVehicel" class="form-control" placeholder="대여차량" required readonly/>
        <br><br>
        
        <p class="text">대여지점</p>
        <input type="text" id="rentalPlace" name="rentalPlace" class="form-control" placeholder="반납일" required readonly/>
        <br><br>
        
        <p class="text">반납지점 선택</p>
        <select id="returnPlace" name="returnPlace" class="form-control" required disabled>
        	<option value="">반납 대여소 선택</option>
		</select>
		<br>
        
        <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
        <br/>
          <button type="submit" id="btn-Yes" class="btn btn-lg btn-primary btn-block">결제하기</button>
        <br>
        <br>
    </form>
 
        
		<!-- </div> -->
       </div>
       </div>
	</div>
   </body>

	<script>
	$(function() {
		
		$('#rentalDate').daterangepicker({
			"autoUpdateInput": false,
			"minDate": new Date(),
			"timePicker": true,
			"timePickerIncrement": 30,
			"timePicker24Hour": true,
            "locale": {
                "format": "YYYY-MM-DD hh:mm",
                "separator": " ~ ",
                "applyLabel": "선택",
                "cancelLabel": "취소",
                "fromLabel": "From",
                "toLabel": "To",
                "customRangeLabel": "Custom",
                "weekLabel": "W",
                "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                "firstDay": 1
            },
            "maxSpan": {
            	"days": 29
            },
            "drops": "down"
        }, function (start, end, label) {
            $("#returnDate").attr("value",end.format('YYYY-MM-DD HH:mm'));
            $("#rentalDate").attr("value",start.format('YYYY-MM-DD HH:mm'));
            const endDate = new Date(end.format('YYYY-MM-DD HH:mm'));
            const startDate = new Date(start.format('YYYY-MM-DD HH:mm'));
            const totalTime = (endDate.getTime()-startDate.getTime()) / (1000*60*60);
            const totalDay = Math.trunc(totalTime / 24);
            const totalHour = Math.trunc(totalTime % 24);
            const totalMinute = (totalTime % 24)%1==0.5?"30분":"0분";
            $("#totalRentalPeriod").text("총 대여기간 : "+ totalDay + "일 " + totalHour + "시간 " + totalMinute);
            $("#vehicleGrade").removeAttr("disabled");
        });
		
		$("#vehicleGrade").change(e=>{
			open("${path}/rental/searchVehicleByGrade.do?vehicleGrade="+$("#vehicleGrade").val()+"&numPerpage=10","차량선택","width=800,height=500,left=400,top=200,status=no,toolbar=no,scrollbars=no,titlebar=no,menubar=no,location=no");
			
		})
		
	});
	</script>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>