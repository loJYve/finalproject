<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<body>
	<div>
		<section id="member-container" class="container">
			<p style="text-align:end;">총 ${totalContents }명의 회원이 있습니다.</p>
			<h2 style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;탈퇴한 회원관리</h2>
		</section>
	</div>
<div>
	<main>
	<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
		<a href="<%=request.getContextPath()%>/admin.do" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
  			<span class="fs-5 fw-semibold">관리자페이지</span>
  		</a>		
		<ul class="list-unstyled ps-0">
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded " data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
					회원 조회
				</button>
				<div class="collapse show" id="home-collapse" style="">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="<%=request.getContextPath()%>/admin.do" class="link-dark rounded">일반회원 조회</a></li>
						<li><a href="<%=request.getContextPath()%>/business.do" class="link-dark rounded">사업자회원 조회</a></li>
						<li><a href="<%=request.getContextPath()%>/secession.do" class="link-dark rounded">탈퇴회원 조회</a></li>
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
						<li><a href="/mypage/" class="link-dark rounded">결제 내역</a></li>
						<li><a href="/mypage/" class="link-dark rounded">운전면허 등록</a></li>
						<li><a href="/mypage/" class="link-dark rounded">즐겨찾는 지역</a></li>
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
					<li><a href="/mypage/" class="link-dark rounded">자주 묻는 질문</a></li>
				</ul>
			 </div>
			</li>
			<li class="border-top my-3"></li>
		</ul>
	</div>
</main>	
	<div style="float:left;">	
		<table id="tbl_member" class="table table-striped table-hover">	
			<tr>
				<th>탈퇴사유</th>
				<th>탈퇴한날짜</th>
				<th>회원아이디</th>
			</tr>
			<c:if test="${not empty secessionmembers }">
            	<c:forEach var="s" items="${secessionmembers }">
            		<tr>           			
            			<td><c:out value="${s.secessionReason }"/></td>
            			<td><c:out value="${s.secessionDate }"/></td> 
            			<td><c:out value="${s.memberId }"/></td>          			
            		</tr>
            	</c:forEach>
            </c:if>
			<c:if test="${empty secessionmembers }">
            	<tr>
            		<td colspan="6">조회결과없음</td>
            	</tr>
            </c:if>
        </table> 
        <div id="pageBar">
        	${pageBar }
        </div>
	</div>
</div>        
<div id="search">
	<div>
		<form name="search-form" autocomplete="off" style="margin-left:800px;margin-top:380px;position: relative;">
			<select name="type" id="type_">
				<option selected value="">검색 내용 선택</option>
				<option value="member_id">아이디</option>
				<option value="member_name">이름</option>
			</select>
			<input type="text" name="keyword" id="keyword_" value=""></input>
			<input type="button" onclick="getSearchList()" class="btn btn-outline-primary mr-2" value="검색"></input>
		</form>
</div>
	</div>
</div>        

<script>
function getSearchList(){
	$.ajax({
		type: 'GET',
		url : "/getSearchList",
		data : $("form[name=search-form]").serialize(),
		success : function(result){
			console.log(result);
			//테이블 초기화
			$('#tbl_member > tbody').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str='<tr>'
					str += "<td>"+item.memberId+"</td>";
					str+="<td>"+item.memberName+"</td>";
					str+="<td>"+item.birthday+"</td>"
					str+="<td>"+item.email+"</td>"
					str+="<td>"+item.phone+"</td>"
					str+="<td>"+item.address+"</td>"
					str+="<td>"+item.totalMileage+"</td>"
					//str+="<td><a href = '/admin/memberList?memberId=" + item.memberId + "'>" + item.memberName + "</a></td>";
					str+="<td>"+item.enrollDate+"</td>";
					str+="<td>"+item.secessionReason+"</td>";
					str+="</tr>"
					$('#tbl_member').append(str);   
        		})				 
			}
		}
	})
}

/* const getSearchList=()=>{
	$.ajax({
		url:"${path}/getSearchList",
		data:{type:$("#type_").val(), keyword:$("#keyword_").val()},
		success: result=>{
			console.log(JSON.parse(result));
			//테이블 초기화
			$('#tbl_member > tbody').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str='<tr>'
					str += "<td>"+item.memberId+"</td>";
					str+="<td>"+item.memberName+"</td>";
					str+="<td><a href = '/admin/memberList?memberId=" + item.memberId + "'>" + item.memberName + "</a></td>";
					str+="<td>"+item.enrollDate+"</td>";
					str+="</tr>"
					$('#tbl_member').append(str);
        		})				 
			}
		}
	});
}*/
</script>	

</body>
<style>
	  	body {
		  min-height: 100vh;
		  min-height: -webkit-fill-available;
		}
		
		html {
		  height: -webkit-fill-available;
		}
		
		main {
		float:left;
		margin-left:50px;
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
</html>