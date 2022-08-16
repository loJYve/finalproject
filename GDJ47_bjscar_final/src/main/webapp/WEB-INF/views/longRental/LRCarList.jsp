<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page import="java.util.List" %>
<%@ page import="com.bjscar.vehicle.model.vo.Vehicle" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
	

	  
	<!-- 차량사진 붙여서 값 받아서 보내고 차량정보 받아오기,  -->
   <a href="${path }/longRental/LRCarDetail.do" class="nav-link px-2 link-dark"> 1번 차량 선택</a>

<style type="text/css">
	section#memberList-container {text-align:center;}	
	section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;}
	section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }
 	div#search-container {margin:0 0 10px 0; padding:3px; 
    background-color: rgba(0, 188, 212, 0.3);}
    div#search-userId{display:inline-block;}
    div#search-userName{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;} 
</style>
    
    <section id="memberList-container">
        <h2>차량목록</h2>
         <div id="search-container">
        	상세검색 : 
        	<select id="searchType">
        	----모델명, 대여소명, 차급, 가격, 탑승인원으로 검색 
        	</select>	
        	<div id="search-userId">
        		<form action="<%=request.getContextPath()%>/admin/searchMember">
        			<input type="hidden" name="searchType" value="userId" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 아이디를 입력하세요" list="ids">
        			<datalist id="ids">
        			</datalist>
        			<button type="submit">검색</button>
        		</form>
        		<script>
        			$("input[placeholder*=아이디]").keyup(e=>{
        				$.ajax({
        					url:"<%=request.getContextPath()%>/autoComplete.do",
        					data:{"keyword":e.target.value},
        					success:data=>{
        						$("#ids").html("");
        						/* console.log(data); */
        						data.forEach(v=>{
        							const op=$("<option>").attr("value",v).text(v);
        							$("#ids").append(op);
        						});
        					}
        				});
        			});
        		</script>
        	</div>
        	<div id="search-userName">
        		<form action="<%=request.getContextPath()%>/admin/searchMember">
        			<input type="hidden" name="searchType" value="userName">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 이름을 입력하세요">
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	<div id="search-gender">
        		<form action="<%=request.getContextPath()%>/admin/searchMember">
        			<input type="hidden" name="searchType" value="gender">
        			<label><input type="radio" name="searchKeyword" value="M" >남</label>
        			<label><input type="radio" name="searchKeyword" value="F" >여</label>
        			<button type="submit">검색</button>
        		</form>
        	</div>
        </div>
        <div id="numPerpage-container">
        	페이지당 회원수 : 
        	<form id="numPerFrm" action="">
        		<select name="numPerpage" id="numPerpage">
        			<option value="10">10</option>
        			<option value="5" >5</option>
        			<option value="3" >3</option>
        		</select>
        	</form>
        </div>
        <table id="tbl-member">
            <thead>
                <tr>
                    <th>아이디</th>
				    <th>이름</th>
				    <th>성별</th>
				    <th>나이</th>
				    <th>이메일</th>
				    <th>전화번호</th>
				    <th>주소</th>
				    <th>취미</th>
				    <th>가입날짜</th>
                </tr>
            </thead>
            <tbody>
       	<%-- 	<%if(list.isEmpty()){ %>
       			<tr>
       				<td colspan="9"><h3>조회된결과가 없습니다!</h3></td>
       			</tr>
       		<%}else{
       			for(Member m : list){%>
       				<tr>
       					<td><%=m.getUserId() %></td>
       					<td><%=m.getUserName() %></td>
       					<td><%=m.getGender() %></td>
       					<td><%=m.getAge() %></td>
       					<td><%=m.getEmail() %></td>
       					<td><%=m.getPhone() %></td>
       					<td><%=m.getAddress() %></td>
       					<td><%=m.getHobby() %></td>
       					<td><%=m.getEnrollDate() %></td>       					
       				</tr> 
       		<%	} 
       		 }%>--%>
            </tbody>
        </table>
        <div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>
    </section>
	<script>
		$(()=>{
			$("#searchType").change(e=>{
				/* alert("type이 변경됨"); */
				const type=$(e.target).val();
				console.log(type);
				$("#search-container>div[id!=search-]").hide();
				$("#search-"+type).css("display","inline-block");
			});
			$("#searchType").change();
		})
		
		$.get("${pageContext.request.contextPath}/map/searchRentalshop",
			data=>{
				console.log(data);
		data.filter(v=>{
			const marker=new google.maps.Marker({
				position:new google.maps.LatLng(v.latitude,v.longitude),
				map:map,
				animation: google.maps.Animation.DROP,
				label:v.rentalshopName,
				optimized: false,
			});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

     



<jsp:include page="/WEB-INF/views/common/footer.jsp" />