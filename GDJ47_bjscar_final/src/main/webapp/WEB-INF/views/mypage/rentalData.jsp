<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main>
	<jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>
	<div class="ms-5 " style="width: 100%;">
		<c:if test="${not empty rentalStatus }">
			<h2>대여 차량 정보</h2>
			<div style="display: flex;">
				<c:if test="${not empty carImage}"> 
					<div class="ratio ratio-1x1 ms-5" style="width: 40%">
						<img alt="" src="${carImage.attechment_id }">
					</div>
 				</c:if> 
				<c:if test="${empty carImage}">
					<div class="ratio ratio-1x1 ms-5" style="width: 35%">
						<img alt="" src="https://cdn.pixabay.com/photo/2016/12/19/15/50/car-1918554_960_720.png">
					</div>
 				</c:if>
				<div class="mt-5 ms-5" style="width: 40%">
					<h4>${carData.model }</h4>
					<h4>대여 시간 : ${rentalStatus.rental_date }</h4>
					<h4>출발 대여소 : ${rentalshopData.rentalshop_name }</h4>
					<h4>반납 예정 시간 : ${rentalStatus.return_date }</h4>
					<div class="d-grid gap-2 col-6 mx-auto">
  						<button class="btn btn-secondary" type="button">반납 가능 대여소 조회하기!!</button>
  						<button class="btn btn-secondary" type="button">반납하기!!</button>
					</div>					
				</div>
			</div>
		</c:if> 
		
		 <c:if test="${empty rentalStatus }">
			<h2>대여 차량 정보</h2>
			<h3 class="text-center mt-5 mb-5">대여한 차량이 없습니다</h3>
			<div class="d-grid gap-2 col-6 mx-auto">
	  			<button class="btn btn-secondary" type="button">대여하러 가기!!</button>
			</div>	
		</c:if>
	</div>
</main>
	 
  <style>
  
  		
	  	body {
		  min-height: 100vh;
		  min-height: -webkit-fill-available;
		}
		
		html {
		  height: -webkit-fill-available;
		}
		
		main {
			margin-left:10%;
			margin-right:10%;
		  display: flex;
		  flex-wrap: nowrap;
		  height: 100vh;
		  height: -webkit-fill-available;
		  max-height: 100vh;
		  overflow-x: auto;
		  overflow-y: hidden;
		}
		
		.b-example-divider {
		  flex-shrink: 0;
		  width: 1.5rem;
		  height: 100vh;
		  background-color: rgba(0, 0, 0, .1);
		  border: solid rgba(0, 0, 0, .15);
		  border-width: 1px 0;
		  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
		}
		
		.bi {
		  vertical-align: -.125em;
		  pointer-events: none;
		  fill: currentColor;
		}
		
		.dropdown-toggle { outline: 0; }
		
		.nav-flush .nav-link {
		  border-radius: 0;
		}
		
		.btn-toggle {
		  display: inline-flex;
		  align-items: center;
		  padding: .25rem .5rem;
		  font-weight: 600;
		  color: rgba(0, 0, 0, .65);
		  background-color: transparent;
		  border: 0;
		}
		.btn-toggle:hover,
		.btn-toggle:focus {
		  color: rgba(0, 0, 0, .85);
		  background-color: #d2f4ea;
		}
		
		.btn-toggle::before {
		  width: 1.25em;
		  line-height: 0;
		  content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
		  transition: transform .35s ease;
		  transform-origin: .5em 50%;
		}
		
		.btn-toggle[aria-expanded="true"] {
		  color: rgba(0, 0, 0, .85);
		}
		.btn-toggle[aria-expanded="true"]::before {
		  transform: rotate(90deg);
		}
		
		.btn-toggle-nav a {
		  display: inline-flex;
		  padding: .1875rem .5rem;
		  margin-top: .125rem;
		  margin-left: 1.25rem;
		  text-decoration: none;
		}
		.btn-toggle-nav a:hover,
		.btn-toggle-nav a:focus {
		  background-color: #d2f4ea;
		}
		
		.scrollarea {
		  overflow-y: auto;
		}
		
		.fw-semibold { font-weight: 600; }
		.lh-tight { line-height: 1.25; }
  
  </style>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>