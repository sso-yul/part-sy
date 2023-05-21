package com.ottt.ottt.controller.mypage.pageVar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ottt.ottt.dao.user.UserDao;
import com.ottt.ottt.dto.MessageDTO;
import com.ottt.ottt.service.message.MessageService;

@Controller
@RequestMapping("/mypage")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	UserDao userDao;
	
	//쪽지함 메인(동시에 받은 쪽지목록)
	@GetMapping(value = "/message")
	public String message() {
		try {
			List<MessageDTO> list = messageService.loadRecvList(null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mypage/myprofile/message";
	}
	
	//받은 쪽지 목록 불러오기
	@GetMapping("/message/recv")
	public ResponseEntity<List<MessageDTO>> getRecvMsg(){
		
		return null ;
	}
	//보낸 쪽지 목록 불러오기
	@GetMapping("/message/send")
	public ResponseEntity<List<MessageDTO>> getSendMsg() {
		
		return null;
	}
	
	
	//쪽지 삭제(해당 쪽지)
	@PostMapping("/message/remove")
	public String removeMsg() {
		
		return null;
	}
	
	//쪽지 전체 삭제
	@PostMapping("/message/removeall")
	public String removeMsgAll() {
		
		return null;
	}
	
	//유저 프로필 선택 시 그 사람 마이페이지로 넘어가게 하는 ?? 기능??

	//쪽지함 셋팅
	@GetMapping(value = "/messagesetting")
	public String messagesetting() {
		return "/mypage/myprofile/message_set";
	}
	
}
