package kr.spring.musinfo.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.musinfo.service.ContentsService;
import kr.spring.musinfo.vo.ContentsVO;

@Controller
public class ContentsController {
	private Logger log=Logger.getLogger(this.getClass());
	@Resource
	ContentsService contentsService;
	
	//자바빈 초기화
	@ModelAttribute
	public ContentsVO initCommand() {
		return new ContentsVO();
	}
	//뮤지컬정보 업로드
	//업로드 폼 호출
		@RequestMapping(value="/musinfo/update.do",method=RequestMethod.GET)
		public String form() {
			return "updateMusinfo";
		}
	//데이터 처리
		@RequestMapping(value="/musinfo/update.do",method=RequestMethod.POST)
		public String submit(ContentsVO contentsVO, BindingResult result, HttpServletRequest request, HttpSession session, Model model) {
			if(log.isDebugEnabled()) {
				log.debug("<< 글 저장>>:"+contentsVO);
			}
			//유효성 체크 결과 오류가 있으면 폼 호출
			if(result.hasErrors()) {
				return "updateMusinfo";
			}
			contentsService.updateContents(contentsVO);	
			
			//view에 표시할 메세지
			model.addAttribute("message","수정 완료");
			model.addAttribute("url",request.getContextPath()+"/main/main.do");
			//아래 뷰 이름이 없으면 단독으로 jsp 호출
			return "musinfo/result";
		}
}
