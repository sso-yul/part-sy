$(document).ready(function() {

	//버튼 색, 기본 버튼 받은 쪽지함 설정 - 보낸 쪽지 색상 설정 안 먹음 에라이
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
	    sendButton.style.backgroundColor = '#33FF33' // 현재 선택한 버튼의 색상을 변경
	    sendButton.style.color = 'black'
	    sendButton.style.fontWeight = '600'
	    currentButton = sendButton; // 현재 선택한 버튼 저장
	  }
	})
  
	//쪽지 리스트 불러오기(받은 / 보낸)
	  $("#btn-recv").click(function() {
	    $.ajax({
	      url: '/ottt/mypage/message/recv',
	      type: 'GET',
	      success: function(data) {
	        console.log("받은 쪽지 목록을 가져옴")
	        
	        $(".left-bottom table").empty()
	        
	        if(!Array.isArray(data) || data.length === 0) {
	        	$(".left-bottom table").append('<div style="display: flex; margin-top: 20px; justify-content: center; color: #8f8f8f;">보관된 쪽지가 없습니다.</div>')
	        } else {
	        	let rows = ''
	        	
	        	$.each(data, function(index, message) {
	        		rows += '<tr class="title-line" style="font-weight: 200">'
	        		rows += '<td class="msg-img">픞</td>'
	        		rows += '<td class="msg-nicknm">'	+ message.user_nicknm	+ '</td>'
	        		rows += '<td class="msg-name">'		+ message.send_user_no	+ '</td>'
	        		rows += '<td class="msg-content">'	+ message.content		+ '</td>'
	        		rows += '<td class="msg-time">'		+ message.send_date		+ '</td>'
	        		rows += '<td class="msg-del"><button class="delBtn" style="border: none; color: red;"><i class="fas fa-times"></i></button></td>'
	        		rows += '</tr>'
	        	})
	        	$(".left-bottom table").append(rows)
	        }
	        location.href="/ottt/mypage/message/recv"
	      },
	      error: function() {
	        alert("error")
	      }
	    })
	  })
	  
    $("#btn-send").click(function() {
        $.ajax({
          url: '/ottt/mypage/message/send',
          type: 'GET',
          success: function(data) {
            console.log("보낸 쪽지 목록을 가져옴")
            
            $(".left-bottom table").empty()

            if(!Array.isArray(data) || data.length === 0) {
	        	$(".left-bottom table").append('<div style="display: flex; margin-top: 20px; justify-content: center; color: #8f8f8f;">보관된 쪽지가 없습니다.</div>')
	        } else {
                let rows = ''
                
                $.each(data, function(index, message) {
                    rows += '<tr class="title-line" style="font-weight: 200">'
                    rows += '<td class="msg-img">픞</td>'
                    rows += '<td class="msg-nicknm">'	+ message.user_nicknm	+ '</td>'
                    rows += '<td class="msg-name">'		+ message.receive_user_no	+ '</td>'
                    rows += '<td class="msg-content">'	+ message.content		+ '</td>'
                    rows += '<td class="msg-time">'		+ message.send_date		+ '</td>'
                    rows += '<td class="msg-del"><button class="delBtn" style="border: none; color: red;"><i class="fas fa-times"></i></button></td>'
                    rows += '</tr>'
                })
                $(".left-bottom table").append(rows)
            }
            location.href="/ottt/mypage/message/send"
          },
          error: function() {
            alert("error")
          }
        })
      })
      
      



	//현재 머물러 있는 페이지 숫자-수정해야함
	  const pageElements = $(".page")
	
	  pageElements.on("click", function() {
	    $(".page.active").removeClass("active")
	
	    $(this).addClass("active")
	  })



	//기본: 답장 버튼 숨기기
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
	
	
	  
	//답장 새창 안 됨 또 아오
	$("#msg-write").click(function() {
		var sendUserNo = $(this).siblings(".msg-nick").text()
		var url = "../messagewindow/open?send_user_no=" + encodeURIComponent(sendUserNo)
		window.open(url, 'SEND-MSG', 'width=520, height=750, scrollbars=no')
	})
  
  
  
  
  


})
