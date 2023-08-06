<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginout" value="${sessionScope.id == null ? 'logout' : 'login'}" />
<c:set var="loginoutlink" value="${sessionScope.id==null ? '/login' : '/mypage'}" />
<c:set var="user_img" value="${sessionScope.user_img}" />



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/fix/header.css" >
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <title>Document</title>
</head>
<body>
	<script type="text/javascript">
		let path = window.location.href;
	
		function goLogin() {
			let toURL = '';
			
		    if ('${sessionScope.id}' === '') {
		        toURL = encodeURIComponent(path);
		        location.href = "/mypage?toURL=" + toURL;
		    } else {
		        console.log(toURL);
		        location.href = "/mypage?user=" + '${sessionScope.user_nicknm}';
		    }
		}
			
	</script>
   <header>
      <div class="logo">
         <a href="<c:url value="/" />">
            <img src="${path}/resources/images/logo/OTTT.png" alt="로고">
         </a>
      </div>
      <nav class="gnb">
         <ul>
         	<li>
				<a class="movie" href="<c:url value="/genre/content?category=movie" />">영화</a>
             </li>
             <li>
                 <a class="drama" href="<c:url value="/genre/content?category=drama" />">드라마</a>
             </li>
             <li>
                 <a class="interest" href="<c:url value="/genre/content?category=interest" />">예능</a>
             </li>
             <li>
                 <a class="animation" href="<c:url value="/genre/content?category=animation" />">애니</a>
             </li>
             <li>
                 <a class="community" href="<c:url value="/community/freecommunity" />">게시판</a>
             </li>
          </ul>
		</nav>
           <div class="h-icon">
              <ul>
                 <li>
                    <a href="<c:url value='/search' />" class="searchnav"></a>
                  </li>                  
               <li>
                  <a href="javascript:goLogin()" class="${loginout}" >
                     <c:if test="${sessionScope.id != null}">
                        <img src="${user_img }" id="profile" class="${loginout}">
                     </c:if>
                  </a>
               </li>
            </ul>
         </div>
        <div id="socketAlert" style="border: 3px solid red; padding: 5px 5px; display: none;"></div>
      </header>
      
      <script type="text/javascript">
      	var socket = null;

		function connectWS() {
			var ws = new WebSocket("ws://localhost:/replyEcho");	//포트 번호 확인
			socket = ws;
			
			ws.onopen = function () {
				console.log('Info: connection opened.');
			};
			
			ws.onmessage = function (event) {
				console.log("받은 메시지: " + event.data + '\n');
				let $socketAlert = $('div#socketAlert');
				$socketAlert.html(event.data);
				$socketAlert.css('display', 'block');
				
				setTimeout(function() {
					$socketAlert.css('diaplay', 'none');
				}, 5000);
			};
	
			ws.onclose = function (event) {
				console.log('Info: connection closed.');
				//setTimeout( function(){ connect(); }, 1000); // retry connection!!
			};
			
			ws.onerror = function (err) { console.log('Info: connection error.', err); };		
		}
		
		
		
		$(document).ready(function() {
			connectWS();
			//쪽지 전송
			$("#writeBtn").on("click", function(evt) {
				//url에서 send_user_no 추출
		        let url = new URL(window.location.href)
		        let searchParams = new URLSearchParams(url.search)
		        let sendUserNo = searchParams.get("send_user_no")
		        let userNo = searchParams.get("user_no")
		        
		        let recvUserNo = $(this).data('receive-user-no')

		        var content = $("#messageContent").val()
		        
		        //쪽지 내용이 비어있는지 아닌지 체크
				if(formCheck()) {
					$.ajax({
						type: "POST",
						url: (sendUserNo != null) ? "/messagewindow/send" : "/messagewindow/send2",
						data: (sendUserNo != null) ? {sendUserNo: sendUserNo, recvUserNo: recvUserNo, content: content }: {userNo: userNo, recvUserNo: recvUserNo, content: content },
						success: function(response) {
							$(".modal-body.body").html("쪽지가 전송되었습니다.");
							$('#Modal').modal('show');
					        $("#checkBtn").on("click", function() {
					            window.close();
					        });
					        
					        //소켓 연결
			                if (socket) {
			                    let socketMsg = "sendmsg," + sendUserNo + "," + recvUserNo;
			                    socket.send(socketMsg);
			                    console.log("====================sendUserNo: " + sendUserNo + " recvUserNo: " + recvUserNo);
			                }
						},
						error: function() {
							$(".modal-body.body").html("쪽지 전송에 실패했습니다. 다시 시도해주세요.");
					        $('#Modal').modal('show');
						}
					})
					
				} else {
					$(".modal-body.body").html("내용을 입력하세요.");
				    $('#Modal').modal('show');
				}
			})
		})
	</script>
      
</body>
</html>