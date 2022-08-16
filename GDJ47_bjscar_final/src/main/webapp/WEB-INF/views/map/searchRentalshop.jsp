<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bjscar.rentalshop.model.vo.Rentalshop" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<%@ page import="com.bjscar.vehicle.model.vo.Vehicle" %>	


<style type="text/css">
	section#memberList-container table#tbl-member {height: 50%; width:90%; border:1px solid gray; border-collapse:collapse; margin: auto;}
	section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:5px; font-size:13px; }
	section#memberList-container table#tbl-member th{font-size:15px;}
 	div#search-container {margin:0 0 10px 0; padding:3px;margin: auto;}
    div#search-userId{display:inline-block;}
    div#search-userName{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;} 
    div.center{align-items: center;}
    div#search-container{justify-content: center; margin: 20px}
    div#whole-container{margin-top: 150px; text-align: center;}
	table#tbl-member{justify-content: center;}
	section#memberlist-container{margin-left: 150px; align-content: center;}
	select#searchType{height:30px;}
	div#pageBar{margin: 20px;}
    
</style>

	<div id="whole-container">
	<div id="sub-container">
	    <section id="memberList-container">
	        <h2>대여소검색</h2> 
	        <table id="tbl-member">
           <thead>
               <tr>
                <th>대여소이름</th>
			    <th>대여소 주소</th>
			    <th>대여가능 차량 대수</th>
			    <th></th>
			    
               </tr>
           </thead>
           <tbody>
      		
      		<c:forEach var="r" items="${rl }">
					<tr>
						<td><c:out value="${r.rentalshopName }"/></td>
						<td><c:out value="${r.rentalshopAddr }"/></td>	
						<%-- <td><c:out value="${r.}"/></td> --%>
						<!-- 여기서 대여가능 차량대수는 rentalshop이 
			    아닌 vehicle 테이블에서 count로 받아와야 하는데 c:forEach로 어떻게 할 수 있음?? -->
						<td><button type="button" onclick="location.assign('/map/showRentalshop.do?no=${r.rentalshopId}');">대여소 확인하기</button></td>	
					<%-- window.open('/map/showRentalshop.do?no=${v.rentalshopId}
no로 rentalshopId를 넘기는데 오류가 남 - null이 들어갈수있어서 그렇다는데 어떻게 처리?
= map 에서 클릭해서 넘어가는것에서도 똑같이. 누르고 말풍선을 눌러서 넘어가는 방식
 (a href)사용하는 방법 --%>
					</tr>
				</c:forEach>
        </tbody>
	    </table>
		
			
		</section>
		</div>
		
		<div id="search-container">
	        	검색타입 : 
	        <select id="searchType">
	        	<option value="rentalshopName"  ${searchType!=null&&searchType.equals("rentalshopName")?"checked":""} >대여소이름</option>
	        	<option value="rentalshopAddr" ${searchType!=null&&searchType.equals("rentalshopAddr")?"checked":""} >대여소 주소</option>
	        	<option value="bmMember" ${searchType!=null&&searchType.equals("bmMember")?"checked":""} >사업자이름</option>
	        </select>

	        <div id="search-rentalshopName">
	        	<form action="${path }/map/bikesearch.do">
	        		<input type="hidden" name="searchType" value="rentalshopName">
	        		<input type="text" name="searchKeyword" size="25" 
	        		placeholder="검색할 대여소 명을 입력하세요" >
	        		<button type="submit">검색</button>
	        	</form>
	        </div>
	        <div id="search-rentalshopAddr">
	        	<form action="${path }/map/bikesearch.do">
	        		<input type="hidden" name="searchType" value="rentalshopAddr">
	        		<input type="text" name="searchKeyword" size="25" 
	        		placeholder="검색할 대여소의 주소를 입력하세요" >
	        		<button type="submit">검색</button>
	        	</form>
	        </div>
	        <div id="search-bmMember">
	        	<form action="${path }/map/bikesearch.do">
	        		<input type="hidden" name="searchType" value="bmMember">
	        		<input type="text" name="searchKeyword" size="25" 
	        		placeholder="검색할 사업자명을 입력하세요" >
	        		<button type="submit">검색</button>
	        	</form>
	        </div>
	      </div>
	    </div>		
	 
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
		
		
	</script>
        	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>