<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div style="float:left;">	
		<table id="tbl_member" class="table table-striped table-hover">	
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>마일리지</th>
				<th>가입일</th>
				<th>탈퇴여부</th>
			</tr>
			<c:if test="${not empty members }">
            	<c:forEach var="m" items="${members }">
            		<tr>           			
            			<td><c:out value="${m.memberId }"/></td>
            			<td><c:out value="${m.memberName }"/></td> 
            			<td><c:out value="${m.birthday }"/></td> 
            			<td><c:out value="${m.email }"/></td> 
            			<td><c:out value="${m.phone }"/></td> 
            			<td><c:out value="${m.address }"/></td> 
            			<td><c:out value="${m.totalMileage }"/></td> 
            			<td><c:out value="${m.enrollDate }"/></td>            			
            			<td><c:out value="${m.secessionReason }"/></td>            			
            		</tr>
            	</c:forEach>
            </c:if>
			<c:if test="${empty members }">
            	<tr>
            		<td colspan="6">조회결과없음</td>
            	</tr>
            </c:if>
        </table> 
        <div id="pageBar">
        	${pageBar }
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
			/* $('#tbl_member > tbody').empty();
			$('#pageBar').empty(); */
			$('#tbl_memberDiv').empty();
			if(result.length>=1){
				/* result.forEach(function(item){
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
					*/
					$('#tbl_memberDiv').append(result);
        		/* $('#pageBar').append("${result.pageBar2}"); */
			}
		}
	})
}
</script>