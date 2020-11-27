package kr.spring.musinfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MusinfoMainController {
	//@RequestMapping("/musinfo/musinfoMain.do")
	public String getMusinfoMain() {
		return "/musinfo/musinfoMain";
	}
	//평점 구하기
}
