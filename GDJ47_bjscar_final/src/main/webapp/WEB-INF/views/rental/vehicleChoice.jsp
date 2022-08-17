<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<section id="member-container" class="container">
			<p style="text-align:end;">총 ${totalContents }개의 차량이 있습니다.</p>
			<h2 style="text-align: center;">&nbsp;&nbsp;&nbsp;차량 선택</h2>
		</section>
	</div>
<div>
	<div id="tbl_memberDiv">	
		<table id="tbl_vehicle" class="table table-striped table-hover">	
			<c:if test="${not empty vehicles }">
			<tr>
				<th>선택</th>
				<th>대여여부</th>
				<th>모델</th>
				<th>대여소</th>
				<th>연료</th>
				<th>탑승인원</th>
				<th>가격(시간당)</th>
			</tr>
            	<c:forEach var="v" items="${vehicles }">
            		<tr class="choVehicleTr">
            			<td><input type="radio" id="${v.vehicleId }" name="choVehicle" value="${v.vehicleId }" style="cursor:pointer"></td>
            			<td><label for="${v.vehicleId }"><c:out value="${v.rentalStatus }"/></label></td>
            			<td><label for="${v.vehicleId }"><c:out value="${v.model }"/></label></td> 
            			<td><label for="${v.vehicleId }"><c:out value="${v.rentalshopId }"/></label></td> 
            			<td><label for="${v.vehicleId }"><c:out value="${v.fuel }"/></label></td> 
            			<td><label for="${v.vehicleId }"><c:out value="${v.boardingPersonnel }"/></label></td> 
            			<td><label for="${v.vehicleId }"><c:out value="${v.price }"/></label></td>
            		</tr>
            		<%-- <tr class="choVehicleTr">
            			<td><c:out value="${v.rentalStatus }"/></td>
            			<td><c:out value="${v.model }"/></td> 
            			<td><c:out value="${v.rentalShop.rentalshopAddr }"/></td>
            			<td><c:out value="${v.fuel }"/></td> 
            			<td><c:out value="${v.boardingPersonnel }"/></td> 
            			<td><c:out value="${v.price }"/></td>
            		</tr> --%>
            	</c:forEach>
            </c:if>
			<c:if test="${empty vehicles }">
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

<script>
	$(function(){
		
		
		
	})
</script>

</body>
<style>

		.choVehicleTr label{
			cursor:pointer
		}
		
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

</html>