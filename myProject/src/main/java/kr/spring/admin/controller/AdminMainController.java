package kr.spring.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.musinfo.service.CommentsService;
import kr.spring.musinfo.vo.CommentsVO;

@Controller
public class AdminMainController {
	@RequestMapping("/admin/adminMain.do")
	public String make(HttpServletResponse response) {
		
	
		return "admin";
		}
}