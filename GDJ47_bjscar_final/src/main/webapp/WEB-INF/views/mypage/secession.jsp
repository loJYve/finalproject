<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main>
	<jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>
	
	<h3 class="text-center mt-5 mb-5">회원 탈퇴</h3>
		<form action="/mypage/secessionEnd.do">
			<div class="form-check d-flex justify-content-center">
			<label id="secessionCheckLabel">
				  <input class="form-check-input" type="checkbox" value="" id="secessionCheck">
				    회원탈퇴하기
				  </label>
			</div>
			<div id="secessionReasonDiv" class="visually-hidden">
				<div class="mb-3 row">
					<input type="text" value="${loginMember.memberId}" name="memberId" hidden>
				    <label for="inputPassword" class="col-sm-2 col-form-label">탈퇴 사유</label>
				    <div class="col-sm-10">
				     	<input type="text" class="form-control" name="secessionReason" id="secessionReason" maxlength="30">
				    </div>
  				</div>
				<div class="d-grid gap-2 col-6 mx-auto">
		  			<button class="btn btn-secondary" type="submit">탈퇴하기...</button>
				</div>
			</div>
		</form>
			
	
	</div>
</main>

<script>
	$("#secessionCheckLabel").click(e=>{
    	if($("#secessionCheck").is(":checked")){
    		$("#secessionReasonDiv").removeClass("visually-hidden");
    	}else{
    		$("#secessionReasonDiv").addClass("visually-hidden");
    	}
    })	
   
</script>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>