package kr.spring.musinfo.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.musinfo.service.CommentsService;
import kr.spring.musinfo.validator.CommentsValidator;
import kr.spring.musinfo.vo.CommentsVO;

@Controller
public class CommentsController {
	private CommentsService commentsService;
	private Logger log = Logger.getLogger(this.getClass());
	@ModelAttribute
	public CommentsVO initCommand() {
		return new CommentsVO();
	}
	//글쓰기 폼 호출
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String form() {
		return "write";
	}
	
	//글쓰기 전송된 데이터 처리
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String submit(CommentsVO review,
			BindingResult result) {
		
		//유효성 체크	
		new CommentsValidator().validate(review, result);
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		//글 등록
		commentsService.insertComments(review);

		return "redirect:/main.do";
	}
}
