package com.ottt.ottt.controller.mypage.pageVar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottt.ottt.dao.user.UserDao;
import com.ottt.ottt.dto.MessageDTO;
import com.ottt.ottt.service.message.MessageServiceImpl;

@Controller
@RequestMapping("/mypage")
public class MessageController {
	
	@Autowired
	MessageServiceImpl messageServiceImpl;
	
	UserDao userDao;
	
	//쪽지함 메인(동시에 받은 쪽지목록)
	@GetMapping(value = "/message")
	public String message() {
		return "/mypage/myprofile/message";
	}
	
	//받은 쪽지 목록 불러오기
    @GetMapping("/message/recv")
    @ResponseBody
    public ResponseEntity<List<MessageDTO>> getRecvMsg(@RequestParam("receive_user_no") Integer recvUserNo) {
        try {
            List<MessageDTO> list = messageServiceImpl.loadRecvList(recvUserNo);
            return new ResponseEntity<List<MessageDTO>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<MessageDTO>>(HttpStatus.BAD_REQUEST);
        }
    }
	
	
	//보낸 쪽지 목록 불러오기
	@GetMapping("/message/send")
	@ResponseBody
	public ResponseEntity<List<MessageDTO>> getSendMsg(@RequestParam("send_user_no") Integer sendUserNo) {
		try {
			List<MessageDTO> list = messageServiceImpl.loadSendList(sendUserNo);
			return new ResponseEntity<List<MessageDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<MessageDTO>>(HttpStatus.BAD_REQUEST);
		}
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

	//쪽지함 환경설정
	@GetMapping(value = "/messagesetting")
	public String messagesetting() {
		return "/mypage/myprofile/message_set";
	}
	
}
