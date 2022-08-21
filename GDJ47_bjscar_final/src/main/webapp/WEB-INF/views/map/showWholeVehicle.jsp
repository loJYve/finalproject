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
    div#whole-container{margin-top: 50px; text-align: center;}
	table#tbl-member{justify-content: center;}
	section#memberlist-container{margin-left: 150px; align-content: center;}
	select#searchType{height:30px;}
	div#pageBar{margin: 20px;}
    
</style>

	<div id="whole-container">
	<div id="sub-container">
		<p>총 ${totalData } 대의 차량이 있습니다.</p>
		
	    <section id="memberList-container">
	        <h2><c:out value="${vl[0].rentalShop.rentalshopName }"/>    차량 보기</h2> 
	        <c:if test="${empty vl }">
		        <div>
		        	<h3>검색결과가 없습니다.</h3>
	        	</div>
	        </c:if>
	        <c:if test="${not empty vl }">
	        <table id="tbl-member" class="table table-striped table-hover">
           <thead>
               <tr>
                <th>대여소이름</th>
			    <th>모델명</th>
			    <th>가격</th>
			    <th>차급</th>
			    <th>연료</th>
			    <th>탑승인원</th>
			     <th>연식</th>
			    <th>등록번호</th>
			    <th>대여상태</th>
			    <!-- 여기서 대여가능 차량대수는 rentalshop이 
			    아닌 vehicle 테이블에서 count로 받아와야 하는데 c:forEach로 어떻게 할 수 있음?? -->
               </tr>
           </thead>
           <tbody>
      		
      		<c:forEach var="v" items="${vl }">
					<tr>
						<td><c:out value="${v.rentalShop.rentalshopName }"/></td>
						<td><c:out value="${v.model }"/></td>	
						<td><c:out value="${v.price }"/></td>	
						<td><c:out value="${v.vehicleGrade }"/></td>
						<td><c:out value="${v.fuel }"/></td>	
						<td><c:out value="${v.boardingPersonnel }"/></td>	
						<td><c:out value="${v.productYear }"/></td>	
						<td><c:out value="${v.numberPlate }"/></td>	
						<td><c:out value="${v.rentalStatus }"/></td>
						
								<%-- <td><a href="${path }/board/boardView.do?no=${v.rentalshopId}">대여하기</a></td> --%>
								
						<!-- <button type="button" onclick="rental();">대여하기</button>	 -->
						
					</tr>
				</c:forEach>
        </tbody>
	    </table>
	    <button type="button" onclick="window.open('/map/showRentalshop.do?no=${v.rentalshopId}');" style="float: right; margin: 10px; margin-right: 5%;">대여하러가기</button>
	    </c:if>
		<div id="pageBar" style="margin-left:10%;">
        	${pageBar }
        	
        </div >
        
	        <div id="search-container">
	        	검색타입 : 
		        <select id="searchType">
		        	<option value="rentalshopName" ${searchType!=null&&searchType.equals("rentalshopName")?"checked":""} >대여소명</option>
		        	<option value="rentalshopAddr" ${searchType!=null&&searchType.equals("rentalshopAddr")?"checked":""} >지역</option>
		        </select>
	
				<div id="search-rentalshopName">
		        	<form action="${path }/map/searchSearchRentalShop.do">
		        		<input type="hidden" name="searchType" value="RENTALSHOP_NAME">
		        		<input type="text" name="searchKeyword" size="25" 
		        		placeholder="검색할 대여소명을 입력하세요" >
		        		<button type="submit" id="submit">검색</button>
		        	</form>
		        </div>
		        
		        <div id="search-rentalshopAddr">
		        	<form action="${path }/map/searchSearchRentalShop.do">
		        		<input type="hidden" name="searchType" value="RENTALSHOP_ADDR">
		        		<input type="text" name="searchKeyword" size="25" 
		        		placeholder="지역을 입력하세요" >
		        		<button type="submit" id="submit">검색</button>
		        	</form>
		        </div>
	        
	      </div>
	        
			
		</section>
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