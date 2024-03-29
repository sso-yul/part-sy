<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<c:set var="loginout" value="${sessionScope.id == null ? 'logout' : 'login'}" />
<c:set var="loginoutlink" value="${sessionScope.id==null ? '/login' : '/mypage'}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>QnA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/community/QnA/QnA.css" >
    <script type="text/javascript" src="${path}/resources/js/community/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
<style type="text/css">
/* 모달 */
.modal-content{
    background-color: #202020;
}

.modal-body{
    font-size: 26px;
    text-align: center;
    border: 1px solid #fff;
}

.modal-header{
    border: 1px solid #fff;
}

.modal-footer{
    border: 1px solid #fff;
    display: flex;
    justify-content: flex-end;
}
 
.btn{
    color: #fff;
    background-color: transparent;
    border-color: #fff; 
    font-size: 23px; 
    text-decoration: none;
}


.btn:hover{
    border-color: #33FF33;
    background-color: transparent;
    border-style: solid;
    color: #33FF33; 
}

  .page-item.active .page-link {
	z-index: 1;
	color: #33ff33;
    background-color: #202020; 
    border-color: #33ff33;
}
</style>

  </head>
 
<!--  body  --------------------->
  <body style="background-color: #202020;">
     
    <div class="wrap">
    	<%@ include file="../../fix/header.jsp" %>

        <div id="line-1" >
          <%@ include file="../../fix/nav.jsp" %>
        </div>

	<script type="text/javascript">
	   	$(document).ready(function() {
	   	    let msg = "${msg}";
	   	    if(msg == 'DEL_OK') {
	   	        $(".body").html("삭제가 완료되었습니다.");
	   	    	$('#Modal').modal('show');
	   	    } 
	   	    if(msg == 'DEL_ERR') {
	   	        $(".body").html("삭제 실패했습니다. 다시 시도해주세요.");
	   	     	$('#Modal').modal('show');
	   	    }
	   	if(msg == 'WRT_OK') {
   	        $(".body").html("글이 등록되었습니다.");
   	     	$('#Modal').modal('show');
   	    }
	   	});
   	</script>
   	
   	<script type="text/javascript">
   		$(document).ready(function() {
			$("#writeBtn").on("click", function() {
				location.href="<c:url value='/community/QnA/write' />"
			})
		})
   	</script>





 <!--글작성 관련 시작-->
      <div class="qa-main">
        <c:if test="${sessionScope.id != null }">
	        <div style="justify-content: flex-end; display: flex;">
	          <button type="button" id="writeBtn" class="btn btn-outline-success" style="position: relative; left: -100px;">글작성</button> 
	        </div>
        </c:if>
        
    
        <!-- 글목록 배너-->
        <div class="title-region">
          	<div class="title-mainline" style="display: flex; font-size: 20px;">
            	<div style="position: absolute; left: 150px;">제목</div>
        	    <div style="position: absolute; left: 900px;">날짜</div>
    	     </div>		
    	     <c:forEach var="articleDTO" items="${list}">
				<div class="title-line" style="display: flex; font-size: 20px;">
			        <div style="position: absolute; left: 100px;"><a href="<c:url value="/community/QnA/read${pr.sc.queryString}&article_no=${articleDTO.article_no}" />">${articleDTO.article_title}</a></div>
		           	<div style="position: absolute; left: 850px;"><fmt:formatDate value="${articleDTO.article_create_dt}" pattern="yyyy-MM-dd" type="date"/></div>
		       	</div>					
			</c:forEach>
	         <c:if test="${sessionScope.id == null}">
				<div class="title-line" style="text-align: center;">
	  	         	로그인이 필요합니다.
	    	   	</div>
			</c:if>
		     <c:if test="${sessionScope.id != null && (totalCnt == null || totalCnt == 0)}">
				<div class="title-line" style="text-align: center;">
	  	         	작성된 QnA가 없습니다.
	    	   	</div>
			</c:if>    
			<c:if test="${sessionScope.id != null && (totalCnt != null || totalCnt != 0)}">
				<!-- 페이지 번호 배너-->
		        <div class="page-num" style="margin-top: 20px;">
		          <nav aria-label="Page navigation example" class="d-flex flex-row justify-content-center">
		            <ul class="pagination">
		            <c:if test="${pr.showPrev}">
			            <li class="page-item">
			                <a class="page-link" href='<c:url value="/community/QnA${pr.sc.getQueryString(pr.beginPage-1)}" />' aria-label="Previous">
			                  <span aria-hidden="true">&laquo;</span>
			                </a>
			              </li>
		            </c:if>
		            <c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
		            	<li class="page-item ${i == pr.sc.page ? 'active' : ''}">
		            		<a class="page-link" href='<c:url value="/community/QnA${pr.sc.getQueryString(i)}" />'>${i}</a>
		            	</li>
		            </c:forEach>
		              <c:if test="${pr.showNext}">
			              <li class="page-item">
			                <a class="page-link" href='<c:url value="/community/QnA${pr.sc.getQueryString(pr.endPage+1)}" />' aria-label="Next">
			                  <span aria-hidden="true">&raquo;</span>
			                </a>
			              </li>
		              </c:if>
		              
		            </ul>
		          </nav>
		        </div>
			</c:if>
		</div>  
      </div>
      
      
      		<!-- Modal -->
	        <div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	          <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	              <div class="modal-header">
	                <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	              </div>
	              <div class="modal-body body">
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	              </div>
	            </div>
	          </div>
	        </div>

  </body>
</html>