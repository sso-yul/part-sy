package com.ottt.ottt.controller.mypage.pageVar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dto.MessageDTO;
import com.ottt.ottt.dto.UserDTO;

@Controller
@RequestMapping("/messagewindow")
public class MessageWindowController {
	
	@Autowired
	LoginUserDao loginUserDao;
	
	
	@GetMapping(value = "/open")
	public String open() {
		return "/mypage/myprofile/messagewindow";
	}
	
	@PostMapping(value = "/open")
	public String writeMsg(MessageDTO messageDTO, RedirectAttributes rattr, Model m, HttpSession session) {
		String writer = (String)session.getAttribute("id");
		UserDTO userDTO = loginUserDao.select(writer);
		
		
		return "/mypage/myprofile/messagewindow";
	}
}
