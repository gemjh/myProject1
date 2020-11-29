package kr.spring.admin.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {
	@RequestMapping("/admin/adminMain.do")
	public String make(HttpServletResponse response) {
		
		
		return "adminMain";
		}
}