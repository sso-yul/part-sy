<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>쪽지창</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="${path}/resources/js/mypage/messagewindow.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/mypage/messagewindow.css" >
    
  </head>

<body>
  <div class="wrap">
  	<form action="" id="form" class="frm" method="post">
	    <div class="sec01">
	      <a href="#">
	        <div class="proimg"><img src="${path}/resources/images/img/profile.png"></div>
	      </a>
	      <div class="nickname">${messageDTO.user_nicknm }</div>
	    </div>
	
	    <div class="sec02">
	      <div class="write">
	        <textarea placeholder="내용을 입력하세요."></textarea>      
	      	<div class="count"><span>0</span>/1000</div>
	      </div>
	    </div>
	
	    <div class="sec03">
	        <button type="button" id="writeBtn" class="btn btn-write">보내기</button>
	    </div>
	</form>
  </div>
    
</body>
</html>