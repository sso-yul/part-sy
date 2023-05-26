package com.ottt.ottt.controller.mypage.pageVar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.domain.MessagePageResolver;
import com.ottt.ottt.domain.MessageSearchItem;
import com.ottt.ottt.dto.MessageDTO;
import com.ottt.ottt.service.message.MessageService;
import com.ottt.ottt.service.message.MessageServiceImpl;

@Controller
@RequestMapping("/mypage")
public class MessageController {
	
	
	
	@Autowired
	MessageService messageService;
	@Autowired
	LoginUserDao loginUserDao;
	
	//쪽지함 메인(동시에 받은 쪽지목록)
	@GetMapping(value = "/message")
	public String message() {
		//이곳으로 진입하면 이미 js 덕에 recv-btn이 눌린 상태이니 다른 거 할 필요 없?을듯?
		return "/mypage/myprofile/message";
	}
	
//	//받은 쪽지 목록 불러오기
//    @GetMapping("/message/recv")
//    @ResponseBody
//    public ResponseEntity<List<MessageDTO>> getRecvMsg(Integer receive_user_no) {
//        try {
//            List<MessageDTO> list = messageService.loadRecvList(receive_user_no);
//            return new ResponseEntity<List<MessageDTO>>(list, HttpStatus.OK);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<List<MessageDTO>>(HttpStatus.BAD_REQUEST);
//        }
//    }
	
	
	public String list(MessageSearchItem msc, Model m, HttpServletRequest request) {
		int totalCnt = 2;
		return "totalCnt";
	}
	
	
//	//보낸 쪽지 목록 불러오기
//	@GetMapping("/message/send")
//	@ResponseBody
//	public ResponseEntity<List<MessageDTO>> getSendMsg(Integer sendUserNo) {
//		try {
//			List<MessageDTO> list = messageService.loadSendList(sendUserNo);
//			return new ResponseEntity<List<MessageDTO>>(list, HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return new ResponseEntity<List<MessageDTO>>(HttpStatus.BAD_REQUEST);
//		}
//	}
	
	
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
