<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/login/loginform.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>로그인</title>
    
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
 
.modi-del{
	display: flex;
    justify-content: flex-end;
}


.qa-main p{
    display: flex;
    justify-content: flex-end;
    font-weight: bold;
}

.btn{
	width: 70px;
    color: #fff;
    background-color: transparent;
    border-style: none;
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
</style>
</head>
<body style="background-color: #202020;">
	<div class="wrap">
		<%@ include file="../fix/header.jsp" %>
			
		<form action="<c:url value='/login' />" method="post" onsubmit="return frmCheck(this)">
			<div class = "Login">
				<img src = "${path}/resources/images/logo/OTTT.png" width="420" height="120">
			
				<div id="msg">
					<c:if test= "${not empty param.msg}" >
					<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
					</c:if>
				</div>
				
				<input type="text" name="user_id" placeholder="ID를 입력해주세요" value="${cookie.id.value}" autofocus="autofocus" style="border:0 solid black" />
				<input type="password" name="user_pwd" style="border:0 solid black" placeholder="비밀번호를 입력해주세요" />
				<input type="hidden" name="toURL" value= "${param.toURL }" class="toURL" />
				
				<button>로그인</button>
				         
				<div>
					<label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "" : "checked"} />아이디 기억</label>
				</div>
				<a>
					<input type="button" value="회원가입" onClick="location.href='<c:url value="/signin/register" />'" class="join" >
					<input type="button" value="아이디 찾기" onClick="location.href='<c:url value="/login/findID" />'" class="join">
					<input type="button" value="비밀번호 찾기" onClick="location.href='<c:url value="/login/findPwd" />'" class="join">
				</a>
				<a href="<c:url value='/naver/login' />">
					<img src="https://myottt.s3.ap-northeast-2.amazonaws.com/img/%EB%84%A4%EC%9D%B4%EB%B2%84.png" width="290" height="40" class="naver">
				</a>
				<a href="javascript:loginWithKakao();" >
					<img src = "https://myottt.s3.ap-northeast-2.amazonaws.com/img/%EC%B9%B4%ED%86%A1.png" width="290" height="40" class="kakao">
				</a>
				<%-- <a href= "#">
					<img src = "https://myottt.s3.ap-northeast-2.amazonaws.com/img/%EA%B5%AC%EA%B8%80%EB%A1%9C%EA%B7%B8%EC%9D%B8.png" width="290" height="40" class="google">
            	</a> --%>
            	
           	</div>
		</form>
	</div>
	
	<!-- 카카오 로그인 -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
	<!-- 네이버 로그인 -->
	<!-- Naver implicit script코드로 해당 script를 등록해야 Naver객체를 생성 할 수 있음 -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

	<script type="text/javascript">
	$(document).ready(function() {

		let pwdMsg = "<%= request.getParameter("pwdMsg") %>";
        
		if (pwdMsg == "MOD_PWD") {
            $(".body").html("비밀번호가 변경되었습니다.<br>다시 로그인해주세요.");
            $('#Modal').modal('show');
        }
		
        if (pwdMsg == "ERR_PWD") {
            $(".body").html("비밀번호 변경에 실패했습니다.<br>다시 시도해주세요.");
            $('#Modal').modal('show');
        }
        
        kakaoInit();

	});
	
	// 1.
	//카카오 로그인연동 자바스크립트 초기화
	function kakaoInit(){
        console.log("카카오 연동 초기화");
    	Kakao.init('9b07668ed6aed0016537d9c1ca21435f');	//본인의 JavaScript 키 입력
        Kakao.isInitialized();
	}

	// 2.
	//카카오 로그인화면 요청
    function loginWithKakao() {
    	Kakao.Auth.authorize({ 
        	redirectUri: 'http://ottt.ap-northeast-2.elasticbeanstalk.com/kakao_callback' // 등록한 리다이렉트uri 입력
        	, prompts : 'login'	//기존 로그인 여부와 상관없이 로그인하기
        });
    }
	
/* 	
 	// 네이버 연동 자바스크립트 초기화
	const naverLogin = new naver.LoginWithNaverId(
	 {
		clientId: "CKTTRjv5JVTHXf5p5zy9",
		callbackUrl: "http://localhost:8080/ottt/auth/naver/callback"
	 }
	);
	
	// 네이버 연동 정보제공 미동의 시 가입 안되게
	naverLogin.init();
	naverLogin.getLoginStatus(function(status){
		if(status){
			const naverId = naverLogin.user.getId();
			const email = naverLogin.user.getEmail();
			const nickName = naverLogin.user.getNickName();
			
			if(naverId==null || email == null || nickName==null){
				alert("회원가입 시 필요한 정보입니다. 정보 제공에 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		}
	
	})
	 */
	

	function frmCheck(frm) {
	
		let msg = ''
			
		if (frm.user_id.value.length == 0){
			setMessage("id를 입력해주세요", frm.id)
			return false;
		}
			
		if (frm.user_pwd.value.length == 0){
			setMessage("비밀번호를 입력해주세요", frm.pwd)
			return false;
		}
			
		return true;
			
	}
			
	function setMessage(msg, element) {
		document.getElementById("msg").innerHTML
				= `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`
		if(element) {
			element.select()	//값이 잘못 입력되었을 때 다시 입력 
		}
	}

		
	</script>
	
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
