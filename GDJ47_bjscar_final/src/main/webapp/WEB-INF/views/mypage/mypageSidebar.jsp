<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">

		<a href="/mypage/rentaldata.do" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
  			<span class="fs-5 fw-semibold">마이페이지</span>
  		</a>
		<div class="rounded bg-secondary bg-opacity-50 d-grid gap-2" style="padding: 10%">
			<h3 class="text-center"><c:out value="${loginMember.memberName }"/></h2>
			<h4 class="text-center"><c:out value="${loginMember.memberId }"/></h3>
			<hr>
			<div class="text-center">마일리지<br><c:out value="${loginMember.totalMileage }"/></div>
			<button type="button" class="btn btn-secondary" onclick="location.href='${path }/mypage/memberdata.do?memberId=${loginMember.memberId}'">정보 수정</button>
		</div>
		<hr>
		<ul class="list-unstyled ps-0">
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
					랜트 내역
				</button>
				<div class="collapse " id="home-collapse" style="">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="${path }/mypage/rentaldata.do?memberId=${loginMember.memberId}" class="link-dark rounded">랜트중인 차량</a></li>
						<li><a href="${path }/mypage/rentalhistory.do?memberId=${loginMember.memberId}" class="link-dark rounded">이전 예약 조회</a></li>
					</ul>
				</div>
			</li>
			<li class="border-top my-3"></li>
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
				  메뉴
				</button>
				<div class="collapse" id="dashboard-collapse" style="">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="${path }/mypage/purchasehistory.do?memberId=${loginMember.memberId}" class="link-dark rounded">결제 내역</a></li>
						<li><a href="${path }/mypage/enrolllisence.do?memberId=${loginMember.memberId}" class="link-dark rounded">운전면허 등록</a></li>
						<li><a href="${path }/mypage/secession.do?memberId=${loginMember.memberId}" class="link-dark rounded">회원 탈퇴</a></li>
					</ul>
				</div>
			</li>
			<li class="border-top my-3"></li>
			<li class="mb-1">
			<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
			  고객 센터
			</button>
			<div class="collapse" id="orders-collapse" style="">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a href="" class="link-dark rounded">문의게시판</a></li>
					<li><a href="" class="link-dark rounded">1대1 문의</a></li>
					<li><a href="${path }/mypage/faq.do" class="link-dark rounded">자주 묻는 질문</a></li>
				</ul>
			 </div>
			</li>
			<li class="border-top my-3"></li>
		</ul>
	</div>
	<div class="ms-5 " style="width: 65%;">
	
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
		  min-height: 70vh;
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