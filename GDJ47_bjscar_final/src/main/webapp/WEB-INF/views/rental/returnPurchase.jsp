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
		  <h4 class="mb-3">결제하기</h4>
		</div>
		
		<div class="card-body">
      <form name="purchaseFrm" action="${path }/rental/returnPurchaseEnd.do" method="post">
      
      	<%-- <input type="hidden" id="rentalHistory" name="rentalHistory" value="${rentalHistory }" required/> --%>
      	<input type="hidden" id="returnCompletionDate" name="returnCompletionDate" value="${returnh.returnCompletionDate }" required/>
      	<input type="hidden" id="overdueTime" name="overdueTime" value="${oh.overdueTime }" required/>
      	<input type="hidden" id="overdueFee" name="overdueFee" value="${oh.overdueFee }" required/>
      	<input type="hidden" id="vehicleId" name="vehicleId" value="${rh.vehicleId }" required/>
      	<input type="hidden" id="memberId" name="memberId" value="${m.memberId }" required/>
      	<input type="hidden" id="rentalId" name="rentalId" value="${rh.rentalId }" required readonly/>
		
		<p class="text">마일리지 (* 천원 단위로 사용가능)</p>
		<div id="totalMileageStr" class="form-control">
			내 마일리지 : <fmt:formatNumber value="${m.totalMileage }"/>원 
			<!-- &nbsp;&nbsp;&nbsp;<button id="btn_mileage">전액 사용</button> -->
			&nbsp;&nbsp;&nbsp;<input type="button" id="btn_mileage" name="btn_mileage" value="전액사용">
			<input type="hidden" id="totalMileage" name="totalMileage" value="${m.totalMileage }" required/>
		</div>
		<br><br>
		<div class="form-control">
		사용할 마일리지 : 
		<input type="text" id="useMileage" name="useMileage" value="0" required autocomplete='off'/>
		원
		</div>
		<br><br>
		
		<p class="text">결제방법</p>
        <select id="purchaseMethod" name="purchaseMethod" class="form-control"required>
			<option value="">결제방법 선택</option>
			<option value="신용카드">신용카드</option>
			<option value="실시간계좌이체">실시간계좌이체</option>
			<option value="가상계좌">가상계좌</option>
			<option value="휴대폰소액결제">휴대폰소액결제</option>
			<option value="카카오페이">카카오페이</option>
			<option value="페이코">페이코</option>
		</select>
		<br><br><br>
		
		<div id="beforeMileageStr" class="form-control">마일리지 사용 전 결제금액 : <fmt:formatNumber value="${ph.purchaseAmount }"/>원</div>
		<input type="hidden" id="beforeMileage" name="beforeMileage" value="${ph.purchaseAmount }" required/>
		<br><br>
		<div id="purchaseAmountStr" class="form-control">총 결제금액 : <fmt:formatNumber value="${ph.purchaseAmount }"/>원</div>
		<input type="hidden" id="purchaseAmount" name="purchaseAmount" value="${ph.purchaseAmount }" required/>
		
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
		
		function addComma(value){
	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        return value; 
	    }
		
		$("#useMileage").keyup(e=>{
			const val = e.target.value;
			/* console.log(val);
			console.log($("#beforeMileage").val()); */
			const purchaseAmount = $("#beforeMileage").val() - val;
			const purchaseAmountStr = addComma(String(purchaseAmount));
			$("#purchaseAmountStr").text("총 결제금액 : "+purchaseAmountStr+"원");
			$("#purchaseAmount").val(purchaseAmount);
			if(val==$("#beforeMileage").val()){
				$("#purchaseMethod option").attr("disabled","disabled");
				$("#purchaseMethod").append($("<option>").attr("value","마일리지").text("마일리지"));
				$("#purchaseMethod option[value='마일리지']").attr("selected","selected");
			}else{
				$("#purchaseMethod option").removeAttr("disabled");
				$("#purchaseMethod option[value='마일리지']").remove();
			}
		})
		
		$("#useMileage").blur(e=>{
			/* console.log(e.target.value); */
			const val = e.target.value;
			if(val%1000>0){
				alert("마일리지는 천원 단위로 사용이 가능합니다.");
				e.target.value=0;
				$("#purchaseAmountStr").text("총 결제금액 : "+addComma(String($("#beforeMileage").val()))+"원");
				$("#purchaseAmount").val($("#beforeMileage").val());
				$("#purchaseMethod option").removeAttr("disabled");
				$("#purchaseMethod option[value='마일리지']").remove();
				e.target.focus();
			}else if(Number(val)>Number($("#totalMileage").val())){
				alert("보유한 마일리지 이상의 마일리지는 사용할 수 없습니다.");
				e.target.value=0;
				$("#purchaseAmountStr").text("총 결제금액 : "+addComma(String($("#beforeMileage").val()))+"원");
				$("#purchaseAmount").val($("#beforeMileage").val());
				e.target.focus();
			}else if(val==''){
				e.target.value=0;
			}
		})
		
		$("#btn_mileage").click(e=>{
			const val = $("#totalMileage").val();
			/* console.log(val); */
			/* Math.floor(121.123) / 10) * 10; */
			if(Number(val)<Number($("#beforeMileage").val())){
				/* console.log($("#beforeMileage").val());
				console.log(val);
				console.log(Math.floor(val));
				console.log((Math.floor(val)/1000)*1000); */
				$("#useMileage").val(Math.floor(val/1000)*1000);
				const purchaseAmount = $("#beforeMileage").val() - (Math.floor(val/1000)*1000);
				const purchaseAmountStr = addComma(String(purchaseAmount));
				$("#purchaseAmountStr").text("총 결제금액 : "+purchaseAmountStr+"원");
				$("#purchaseAmount").val(purchaseAmount);
			}else{
				if(Number($("#beforeMileage").val())%1000==0){
					/* console.log($("#beforeMileage").val()); */
					$("#useMileage").val($("#beforeMileage").val());
					$("#purchaseAmountStr").text("총 결제금액 : "+0+"원");
					$("#purchaseAmount").val(0);
					$("#purchaseMethod option").attr("disabled","disabled");
					$("#purchaseMethod").append($("<option>").attr("value","마일리지").text("마일리지"));
					$("#purchaseMethod option[value='마일리지']").attr("selected","selected");
				}else if(Number($("#beforeMileage").val())%1000!=0){
					/* console.log(val);
					console.log((Math.floor(val)/1000)*1000); */
					$("#useMileage").val(Math.floor($("#beforeMileage").val()/1000)*1000);
					const purchaseAmount = $("#beforeMileage").val() - (Math.floor($("#beforeMileage").val()/1000)*1000);
					const purchaseAmountStr = addComma(String(purchaseAmount));
					$("#purchaseAmountStr").text("총 결제금액 : "+purchaseAmountStr+"원");
					$("#purchaseAmount").val(purchaseAmount);
				}
			}
		})
		
	});
	</script>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>