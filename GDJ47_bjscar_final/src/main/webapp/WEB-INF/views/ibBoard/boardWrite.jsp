<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<section id="content">
	<div id="board-container">
        <form name="boardFrm" action="${path }/boardWriteEnd.do" method="post" enctype="multipart/form-data">
            <input type="text" class="form-control" placeholder="제목" name="ibPostTitle" id="ibPostTitle" required>
            <input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="ibPostWriter" value="${loginMember.memberId}" readonly required>
            <select id="ibPostCategory" name="ibPostCategory" required>
            	<option value="">카테고리</option>
            	<option value="사이트 문의">사이트 문의</option>
            	<option value="대여소">대여소</option>
            	<option value="차량">차량</option>
            </select>
            <div class="input-group mb-3" style="padding:0px;">
                <div class="input-group-prepend" style="padding:0px;">
                    <span class="input-group-text">첨부파일1</span>
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="upFile" id="upFile">
                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
                </div>
            </div>
            <textarea class="form-control" name="ibPostContent" placeholder="내용" required></textarea>
            <br />
            <input type="submit" class="btn btn-outline-success" value="저장" >
        </form>
    </div>

    <style>
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input{margin-bottom:15px;}
    </style>
</section>
<script>
	$(()=>{
		$("[name=upFile]").change(e=>{
			const fileName=$(e.target).prop('files')[0].name;
			$(e.target).next(".custom-file-label").html(fileName);
		});
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>