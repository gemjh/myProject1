package kr.spring.musinfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MusinfoMainController {
	@RequestMapping("/musinfo/musinfoMain.do")
	public String getMusinfoMain() {
		return "/musinfo/musinfoMain";
	}
	@RequestMapping("/musinfo/more.do")
	public String getMoreMusinfo() {
		return "/musinfo/moreMusinfo";
	};
}
