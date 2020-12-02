package kr.spring.musinfo.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.spring.musinfo.service.InfoPageService;
import kr.spring.musinfo.vo.InfoPageVO;

@Controller
public class InfoPageController {

	@Resource
	InfoPageService infoPageService;
	private Logger log = Logger.getLogger(this.getClass());
	//자바빈 초기화
		@ModelAttribute
		public InfoPageVO initCommand() {
			return new InfoPageVO();
		}
	//정보 가져오기
		
}
