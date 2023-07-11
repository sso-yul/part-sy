<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> 댓글 외 알림</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="${path}/resources/css/mypage/message_alarm.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
  </head>

	<body style="background-color: #202020;">
     
	<div class="wrap">
	
		<%@ include file="../../fix/header.jsp" %>
	
		<%@ include file="../../fix/mnb.jsp" %>
		
		<c:forEach var="notificationDTO" items="${list}">
			<div class="noti-box">
				<section class="sec01">
					<img class="profile" src="${notificationDTO.image }" alt="profile" />
					<a href="#">
						<div class="noti">${notificationDTO.user_nicknm } ${notificationDTO.noti_message }</div>
					</a>
					<button class="delBtn" name="deleteBtn" id="del" alt="delete"><i class="fas fa-times"></i></button>
				</section>
			</div>
		</c:forEach>

	</div>
  </body>
</html>