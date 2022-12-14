<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    #btn_mileage{
    	border: none;
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
		  <h4 class="mb-3">반납하기</h4>
		</div>
		
		<div class="card-body">
      <form name="purchaseFrm" action="${path }/rental/returnVehicleEnd.do" method="post">
		<%-- $("#purchaseAmount").val>0?action="${path }/rental/returnPurchaseVehicle.do":action="${path }/rental/returnVehicleEnd.do" --%>
		
		<input type="hidden" id="vehicleId" name="vehicleId" value="${v.vehicleId }"required readonly/>
		<input type="hidden" id="memberId" name="memberId" value="${loginMember.memberId }" required readonly/>
		<input type="hidden" id="totalMileage" name="totalMileage" value="${loginMember.totalMileage }" required readonly/>
		<input type="hidden" id="rentalId" name="rentalId" value="${rh.rentalId }" required readonly/>
		
		<p class="text">예정 반납일</p>
		<fmt:formatDate var="returnDate" value="${rh.returnDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
		<input type="text" id="returnDate" name="returnDate" class="form-control" value="${returnDate }" required readonly/>
		<br><br>
		<p class="text">실제 반납일</p>
		<input type="text" id="returnCompletionDate" name="returnCompletionDate" class="form-control" required readonly/>
		<br><br>
		<p class="text">연체 시간</p>
		<div id="totalOverdueTime" class="form-control">총 연체시간 : 0일 0시간 0분</div>
		<input type="hidden" id="overdueTime" name="overdueTime" value="0" required readonly/>
		<br><br><br>
		<input type="hidden" id="overdueFee" name="overdueFee" value="${v.price }" required/>
		<div id="purchaseAmountStr" class="form-control">연체 금액 : 0원</div>
		<input type="hidden" id="purchaseAmount" name="purchaseAmount" value="0" required/>
		
        <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
        <br/>
          <button type="submit" id="btn-Yes" class="btn btn-lg btn-primary btn-block">반납하기</button>
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
			
			function addComma(value){
    	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	        return value; 
    	    }
			
			const today = new Date();
			const year = today.getFullYear();
			const month = ('0' + (today.getMonth() + 1)).slice(-2);
			const day = ('0' + today.getDate()).slice(-2);
			const dateString = year + '-' + month  + '-' + day;
			const hours = ('0' + today.getHours()).slice(-2); 
			const minutes = ('0' + today.getMinutes()).slice(-2);
			const seconds = ('0' + today.getSeconds()).slice(-2); 
			const timeString = hours + ':' + minutes  + ':' + "00";
			
			$("#returnCompletionDate").val(dateString+" "+timeString);
			
			const endDate = new Date($("#returnCompletionDate").val());
            const startDate = new Date($("#returnDate").val());
            if((endDate.getTime()-startDate.getTime()) >0){
            	const totalTime = (endDate.getTime()-startDate.getTime()) / (1000*60*60);
                const totalDay = Math.trunc(totalTime / 24);
                const totalHour = Math.trunc(totalTime % 24);
                /* const totalMinute = (totalTime % 24)%1==0.5?"30분":"0분"; */
                const totalMinute = (endDate.getTime()-startDate.getTime()) / (1000*60) % 60;
                /* const totalMinute = totalTime; */
                $("#totalOverdueTime").text("총 연체시간 : "+ totalDay + "일 " + totalHour + "시간 " + totalMinute + "분");
                /* console.log(totalTime%1); */
                /* console.log(Math.floor(totalTime)); */
                if((totalTime%1)>=0.5){
                	$("#overdueTime").val(totalTime);
        			$("#purchaseAmount").val((Math.floor(totalTime)+0.5)*($("#overdueFee").val()));
        			$("#purchaseAmountStr").text("연체 금액 : "+addComma(String((Math.floor(totalTime)+0.5)*($("#overdueFee").val())))+"원");
                }else{
                	$("#overdueTime").val(totalTime);
        			$("#purchaseAmount").val(Math.floor(totalTime)*($("#overdueFee").val()));
        			$("#purchaseAmountStr").text("연체 금액 : "+addComma(String(Math.floor(totalTime)*($("#overdueFee").val())))+"원");
                }
            }
            
            
            
		})
	</script>
   
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>