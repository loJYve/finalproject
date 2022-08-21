<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main>
	<%-- <jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/> --%>
		
		<div class="accordion mt-5" id="accordionExample" style="width: 60%; margin-left: 20%";margin-right: 20%">
		<h2>자주 묻는 질문</h2>
  			<div class="accordion-item mt-5">
    			<h2 class="accordion-header" id="headingOne">
      				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        				<strong>Q1. 예약하려면 회원가입이 필요한가요?</strong>
      				</button>
    			</h2>
	    		<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				네, 사이트의 모든 기능은 회원가입 후 이용할 수 있습니다.
	     			</div>
	    		</div>
  			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
        				<strong>Q2. 예약 시 보험료도 함께 결제가 되나요?</strong>
      				</button>
    			</h2>
	    		<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				네, 예약 시 차량대여료와 보험료를 한번에 결제합니다.
	     			</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading3">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="true" aria-controls="collapse3">
        				<strong>Q3. 한 아이디로 여러 대를 예약할 수 있나요?</strong>
      				</button>
    			</h2>
	    		<div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				네, 여러 대 예약 가능합니다.
	     			</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading4">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="true" aria-controls="collapse4">
        				<strong>Q4. 타지역 반납은 가능한가요?</strong>
      				</button>
    			</h2>
	    		<div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				아니요, 대여한 대여소로 다시 반납해야 합니다.
	     			</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading5">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="true" aria-controls="collapse5">
        				<strong>Q5. 예약연장이 가능한가요?</strong>
      				</button>
    			</h2>
	    		<div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				아니요, 대신 추가 사용시간 만큼 반납시에 결제해주시면 됩니다. 추가비용은 렌트비용과 동일합니다.
	       				반납이 늦어질 경우, 엽체가 임의로 차량을 회수할 수 있습니다.
	     			</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading6">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse6" aria-expanded="true" aria-controls="collapse6">
        				<strong>Q6. 예약변경은 가능한지 궁금합니다.</strong>
      				</button>
    			</h2>
	    		<div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				예약 시간 변경 등을 희망하실 경우, 예약을 취소하신 후 다시 예약해주셔야 합니다.
	     			</div>
				</div>
			</div>
			
		</div>
		
	<!-- </div> -->
</main>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>