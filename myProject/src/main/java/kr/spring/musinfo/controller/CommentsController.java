package kr.spring.musinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;
import kr.spring.musinfo.service.CommentsService;
import kr.spring.musinfo.validator.CommentsValidator;
import kr.spring.musinfo.vo.CommentsVO;
import kr.spring.musinfo.vo.ContentsVO;

@Controller
public class CommentsController {
	@Resource
	private CommentsService commentsService;
	private Logger log = Logger.getLogger(this.getClass());
	@ModelAttribute
	public CommentsVO initCommand() {
		return new CommentsVO();
	}

	//글쓰기 폼 호출
	@RequestMapping(value="/musinfo/write.do",method=RequestMethod.GET)
	public String form() {
		return "reviewWrite";
	}
	
	//글쓰기 전송된 데이터 처리
	@RequestMapping(value="/musinfo/write.do",method=RequestMethod.POST)
	public String submit(CommentsVO commentsVO,
			BindingResult result, HttpServletRequest request,HttpSession session) {
		
		//유효성 체크	
		new CommentsValidator().validate(commentsVO, result);
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "reviewWrite";
		}
		
		//글 등록
		//회원번호 세팅
		MemberVO member=(MemberVO)session.getAttribute("member");
		commentsVO.setMem_num(member.getMem_num());
		//뮤지컬번호 세팅
		ContentsVO contentsVO=(ContentsVO)session.getAttribute("contentsVO");
		contentsVO.setMus_num(contentsVO.getMus_num());
		commentsService.updateComments(commentsVO);

		return "redirect:/musinfo/musinfoMain.do";
	}
	//글 전체보기
	@RequestMapping("/musinfo/reviews.do")
	public List<CommentsVO> allComments() {
		Map<String,Object> map=new HashMap<String,Object>();
		List<CommentsVO> list=null;
		list=commentsService.selectList(map);
		return list;
	}
	//글 수정 폼 호출
	@RequestMapping(value="/musinfo/modify.do",method=RequestMethod.GET)
	public String form(@RequestParam int rev_num, Model model) {
		CommentsVO commentsVO=commentsService.selectComments(rev_num);
		model.addAttribute("commentsVO",commentsVO);
		return "musinfo/reviewModify";
	}
	//글 수정 처리
	@RequestMapping(value="/musinfo/modify.do",method=RequestMethod.POST)
	public String submitUpdate(@Valid CommentsVO commentsVO, BindingResult result,HttpServletRequest request,HttpSession session,Model model) {	
		if(result.hasErrors()) {
			return "musinfo/reviewModify";
		}
		//회원번호
		MemberVO member=(MemberVO)session.getAttribute("member");
		commentsVO.setMem_num(member.getMem_num());
		//뮤지컬번호
		ContentsVO contentsVO=(ContentsVO)session.getAttribute("contentsVO");
		contentsVO.setMus_num(contentsVO.getMus_num());
		commentsService.updateComments(commentsVO);
		
		//수정 후 view
		model.addAttribute("message","수정되었습니다.");
		model.addAttribute("url",request.getContextPath()+"/musinfo/musinfoMain.do");
		return "musinfo/result";
	}
	//글 삭제
	@RequestMapping("/musinfo/delete.do")
	public String submitDelete(@RequestParam int rev_num,Model model, HttpServletRequest request) {
		commentsService.deleteComments(rev_num);
		model.addAttribute("message","삭제되었습니다.");
		model.addAttribute("url",request.getContextPath()+"/musinfo/musinfoMain.do");
		return "musinfo/result";

	}
	
	
}
