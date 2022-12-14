<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="<%=request.getContextPath()%>/" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item"><a href="<%=request.getContextPath()%>/boardList.do" class="nav-link px-2 text-muted">문의 사항</a></li>
      <li class="nav-item"><a href="${path }/suggest.do" class="nav-link px-2 text-muted">계획하기</a></li>
      <li class="nav-item"><a href="${path }/mypage/faq.do" class="nav-link px-2 text-muted">FAQs</a></li>
    </ul>
    <p class="text-center text-muted">© 2022 Company, Inc</p>
  </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<style>
	html {

    position: relative;

    min-height: 100%;

    margin: 0;


}

body {

    min-height: 100%;

}

footer {

    

	
    left: 0;

    bottom: 0;

    width: 100%;

	padding: 15px 0;

	text-align: center;

	color: white;


}
</style>
</html>
