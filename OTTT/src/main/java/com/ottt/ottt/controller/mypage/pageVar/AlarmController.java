package com.ottt.ottt.controller.mypage.pageVar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dto.NotificationDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.mypage.NotificationService;

@Controller
@RequestMapping("/mypage")
public class AlarmController {

	@Autowired
	NotificationService notificationService;
	@Autowired
	LoginUserDao loginUserDao;

	@GetMapping(value = "/alarm")
	public String alarm(Model m, HttpServletRequest request, HttpSession session) {
		String userId = (String) session.getAttribute("id");
		UserDTO userDTO = loginUserDao.select(userId);
		m.addAttribute("userDTO", userDTO);

		int noti_no = 0; // 기본값 설정
		String notiNoParam = request.getParameter("noti_no");
		if (notiNoParam != null && !notiNoParam.isEmpty()) {
			try {
				noti_no = Integer.parseInt(notiNoParam);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		m.addAttribute("noti_no", noti_no);

		try {
			List<NotificationDTO> list = notificationService.getNotiList(userDTO.getUser_no());

			m.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/mypage/myprofile/message_alarm";
	}
	
	@DeleteMapping(value = "/alarm/{noti_no}")
	public ResponseEntity<String> remove(@PathVariable Integer noti_no, Integer target_user_no, HttpSession session) {
		
		String targetUser = (String)session.getAttribute("id");
		
		try {
			int noti = notificationService.removeNoti(noti_no, target_user_no);
			if(noti != 1) {
				throw new Exception("Delete Failed");
			}
			return new ResponseEntity<>("DELETE_OK", HttpStatus.);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}