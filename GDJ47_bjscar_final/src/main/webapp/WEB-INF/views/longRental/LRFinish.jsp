<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<c:set var="path" value="${pageContext.request.contextPath}" />

	
	

	  

   <a href="${path }/longRental/LRCarSelect.do" class="nav-link px-2 link-dark"> 계속 장기렌트카 보기</a>
	<a href="${path }/mypage/rentaldata.do" class="nav-link px-2 link-dark"> 마이페이지</a>

     



<jsp:include page="/WEB-INF/views/common/footer.jsp" />