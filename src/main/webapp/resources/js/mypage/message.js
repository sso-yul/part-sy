$(document).ready(function() {



//버튼 색, 기본 버튼 받은 쪽지함 설정
  let currentButton = null; // 선택한 버튼을 저장하는 변수
  const recvButton = document.getElementById("btn-recv") // 받은 쪽지 버튼 요소
  const sendButton = document.getElementById("btn-send") // 보낸 쪽지 버튼 요소

  // recvButton을 초기 선택 상태로 설정
  recvButton.style.backgroundColor = '#33FF33'
  recvButton.style.color = 'black'
  recvButton.style.fontWeight = '600'
  currentButton = recvButton

  recvButton.addEventListener("click", () => {
    if (currentButton !== recvButton) { // 이전에 선택한 버튼이 받은 쪽지 버튼이 아닐 경우
      if (currentButton) { // 이전에 선택한 버튼이 존재
        currentButton.style.backgroundColor = '' // 이전에 선택한 버튼의 색상 원래대로
        currentButton.style.color = ''
        currentButton.style.fontWeight = ''
      }
      recvButton.style.backgroundColor = '#33FF33' // 현재 선택한 버튼의 색상을 변경
      recvButton.style.color = 'black';
      recvButton.style.fontWeight = '600'
      currentButton = recvButton; // 현재 선택한 버튼 저장
    }
  })

  sendButton.addEventListener("click", () => {
    if (currentButton !== sendButton) { // 이전에 선택한 버튼이 보낸 쪽지 버튼이 아닐 경우
      if (currentButton) { // 이전에 선택한 버튼이 존재
        currentButton.style.backgroundColor = ''// 이전에 선택한 버튼의 색상 원래대로
        currentButton.style.color = ''
        currentButton.style.fontWeight = ''
      }
      sendButton.style.backgroundColor = '#33FF33' // 현재 선택한 버튼의 색상을 변경.
      sendButton.style.color = 'black'
      sendButton.style.fontWeight = '600'
      currentButton = sendButton; // 현재 선택한 버튼 저장
    }
  })
  
	//쪽지 리스트 불러오기(받은 / 보낸)
	$(document).ready(function() {
	  $("#btn-recv").click(function() {
	    $.ajax({
	      url: '/ottt/mypage/message/recv', // 받은 쪽지 목록을 가져오는 API 경로
	      type: 'GET',
	      success: function(data) {
	        // 받은 쪽지 목록을 테이블에 추가하는 로직 작성
	      },
	      error: function() {
	        console.log('Error: Failed to retrieve received messages')
	      }
	    })
	  })
	
	$("#btn-send").click(function() {
		$.ajax({
			url: '/ottt/mypage/message/send', // 보낸 쪽지 목록을 가져오는 API 경로
			type: 'GET',
			success: function(data) {
				// 보낸 쪽지 목록을 테이블에 추가하는 로직 작성.
			},
			error: function() {
				console.log('Error: Failed to retrieve sent messages')
				}
			})
		})
	})


	//현재 머물러 있는 페이지 숫자
	  const pageElements = $(".page")
	
	  pageElements.on("click", function() {
	    $(".page.active").removeClass("active")
	
	    $(this).addClass("active")
	  })



	//
	$("#msg-write").hide();
	
	//쪽지 내용, 상대 닉네임 불러오기, 내용 있을 시 답장 버튼 불러옴
	$(".msg-content").click(function() {
		var content = $(this).text()
		$(".msg-view-content").text(content)

		if (content !== "") {
		  $(".msg-write-btn").show();
		} else {
		  $(".msg-write-btn").hide();
		}

	    var sendUserNo = $(this).siblings(".msg-name").text()
	    $("#msgNick").text(sendUserNo)
	    
	})
	
	
	  
	//답장 새창
	$("#msg-write").click(function() {
		var sendUserNo = $(this).siblings(".msg-nick").text()
		var url = "../messagewindow/open?send_user_no=" + encodeURIComponent(sendUserNo)
		window.open(url, 'SEND-MSG', 'width=520, height=750, scrollbars=no')
	})
  
  
  
  
  


})
