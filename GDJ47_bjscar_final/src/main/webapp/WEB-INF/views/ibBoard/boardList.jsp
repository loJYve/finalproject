<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<section id="board-container" class="container">
        <p>총 ${totalContents }건의 게시물이 있습니다.</p>
        <button onclick="location.assign('${path}/boardWrite.do')">글쓰기</button>
        <table id="tbl-board" class="table table-striped table-hover">
            <tr>
                <th>제목</th>
                <th>번호</th>
                <th>작성자</th>
                <th>카테고리</th>
                <th>내용</th>
                <th>작성일</th>
            </tr>
            <c:if test="${not empty boards }">
            	<c:forEach var="b" items="${boards }">
            		<tr>
            			<td>
            				<a href="${path}/boardView.do?no=${b.ibPostId }">
            					<c:out value="${b.ibPostTitle }"/> 
            				</a>
            			</td>          		
            			<td><c:out value="${b.ibPostId }"/></td>
            			<td><c:out value="${b.ibPostWriter }"/></td>
            			<td><c:out value="${b.ibPostCategory }"/></td>
            			<td><c:out value="${b.ibPostContent }"/></td>
            			<td><c:out value="${b.ibPostDate }"/></td>
            		</tr>
            	</c:forEach>
            </c:if>
            <c:if test="${empty boards }">
            	<tr>
            		<td colspan="6">조회결과없음</td>
            	</tr>
            </c:if>
        </table> 
        <div id="pageBar">
        	${pageBar }
        </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>