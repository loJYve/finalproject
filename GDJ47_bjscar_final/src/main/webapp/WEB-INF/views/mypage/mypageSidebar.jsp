<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">

		<a href="/mypage/rentaldata.do" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
  			<span class="fs-5 fw-semibold">마이페이지</span>
  		</a>
		<div class="rounded bg-secondary bg-opacity-50 d-grid gap-2" style="padding: 10%">
			<h3 class="text-center">회원이름</h2>
			<h4 class="text-center">회원 아이디</h3>
			<hr>
			<div class="text-center">마일리지<br>값asdasd</div>
			<button type="button" class="btn btn-secondary">정보 수정</button>
		</div>
		<hr>
		<ul class="list-unstyled ps-0">
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded " data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
					랜트 내역
				</button>
				<div class="collapse show" id="home-collapse" style="">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="/mypage/rentaldata.do" class="link-dark rounded">랜트중인 차량</a></li>
						<li><a href="/mypage/rentalhistory.do" class="link-dark rounded">이전 예약 조회</a></li>
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
						<li><a href="/mypage/purchasehistory.do" class="link-dark rounded">결제 내역</a></li>
						<li><a href="/mypage/enrolllisence.do" class="link-dark rounded">운전면허 등록</a></li>
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
					<li><a href="/mypage/" class="link-dark rounded">문의게시판</a></li>
					<li><a href="/mypage/" class="link-dark rounded">1대1 문의</a></li>
					<li><a href="/mypage/faq.do" class="link-dark rounded">자주 묻는 질문</a></li>
				</ul>
			 </div>
			</li>
			<li class="border-top my-3"></li>
		</ul>
	</div>